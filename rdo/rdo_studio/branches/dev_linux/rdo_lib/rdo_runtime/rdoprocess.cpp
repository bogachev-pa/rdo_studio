/**
 @file      rdoprocess.cpp
 @authors   ������ ������, ����� �������, etc.
 @date      unknown
 @brief     RDOProcess implementation
 @indent    4T
 */

// ====================================================================== INCLUDES
// ====================================================================== SYNOPSIS
#include "rdo_lib/rdo_runtime/pch.h"
#include "rdo_common/rdotypes.h"
#include "rdo_common/rdomacros.h"
#include "rdo_lib/rdo_runtime/rdoprocess.h"
#include "rdo_lib/rdo_runtime/rdocalc.h"
#include "rdo_lib/rdo_runtime/calc/relres.h"
// ===============================================================================

OPEN_RDO_RUNTIME_NAMESPACE

// ----------------------------------------------------------------------------
// ---------- RDOPROCProcess
// ----------------------------------------------------------------------------
RDOPROCProcess::RDOPROCProcess(CREF(tstring) name, PTR(RDOSimulator) sim)
	: RDOLogicSimple(sim)
	, m_name  (name)
{}

void RDOPROCProcess::insertChild(LPIPROCProcess pProcess)
{
	if (pProcess)
	{
		m_child.push_back(pProcess);
		pProcess->setParent(this);
	}
}

void RDOPROCProcess::setParent(LPIPROCProcess pProcess)
{
	m_parent = pProcess;
}

CREF(LPRDOResourceType) RDOPROCProcess::getTranType() const
{
	return m_transactType;
}

void RDOPROCProcess::next(CREF(LPRDOPROCTransact) pTransact)
{
	if ( pTransact->getBlock() )
	{
		Iterator it = std::find(begin(), end(), pTransact->getBlock());
		// ���� � ��������� ���� ����
		if (it != end())
		{
			// ����� ���� ����
			LPIPROCBlock block = *it;
			ASSERT(block);
			// ������� ������������ �������� � ������ ��� ����������
			RDOPROCBlock::TransactIt it_res = block->transactFind(pTransact);
			// ���� �������� ������
			// XXX: ������ ��� ��������� �������� �� ������������� � ����� GENERATE!!!
			if (it_res != block->transactEnd()) 
			{
				// ������� ��� �� ������ ���������� ����� �����
				block->transactGoOut(*it_res);
			}
			else
			{
				// ������ ����� ����� �� ����� ������, ��������� advance ������� ��������� �� ����
				//	getRuntime()->error( "���������� ������: ���������� �������� (�������� ������� ���� ����)" );
			}
			// ��������� � ���������� �����
			it++;
			// ���� ��������� ���� ����������
			if (it != end())
			{
				// ����� ���� ����
				block = *it;
				ASSERT(block);
				pTransact->setBlock(block);
				// ���������� � ����� ������ ����� ����� ������������ ��������
				block->transactGoIn(pTransact);
			}
			// ���� � �� �������� ����� ���� ����������� �������� ��� ���������
			else 
			{
				//---------���� � ���� ���� ��������, ��� it-1 = ��������� ���� ��� ���������, 
				//---------� ���� ������ ��������� ����� ������� ���� ��������?????????
				//getRuntime()->error( "������ ���������� ��������, ���� � ������� �� ��� - ���������" );
			}
		} 
		else
		{
			//getRuntime()->error( "�� ���������� ������ �����, � �������� �������� ��������" );
		}
	} 
	else 
	{
		//getRuntime()->error( "� ��������� �� �������� ������� ����" );
	}
}

// ----------------------------------------------------------------------------
// ---------- RDOPROCTransact
// ----------------------------------------------------------------------------
RDOPROCTransact::RDOPROCTransact(PTR(RDORuntime) runtime, CREF(std::vector<RDOValue>) paramsCalcs, LPIResourceType pResType, ruint resID, ruint typeID, rbool trace, rbool temporary)
	: RDOResource(runtime, paramsCalcs, pResType, resID, typeID, trace, temporary)
{
	m_state     = RDOResource::CS_Create;
	m_params.push_back(runtime->getCurrentTime());
}

RDOPROCTransact::~RDOPROCTransact()
{}

LPRDOResource RDOPROCTransact::clone(PTR(RDORuntime) runtime) const
{
	return rdo::Factory<RDOResource>::create(runtime, getParams(), getResType(), getTraceID(), getType(), traceable(), m_temporary);
}

void RDOPROCTransact::next()
{
	m_block->getProcess()->next(this);
}

// ----------------------------------------------------------------------------
// ---------- RDOPROCResource
// ----------------------------------------------------------------------------
RDOPROCResource::RDOPROCResource(PTR(RDORuntime) runtime, CREF(std::vector<RDOValue>) paramsCalcs, LPIResourceType pResType, ruint resID, ruint typeID, rbool trace, rbool temporary)
	: RDOResource(runtime, paramsCalcs, pResType, resID, typeID, trace, temporary)
{}

RDOPROCResource::~RDOPROCResource()
{}

LPRDOResource RDOPROCResource::clone(PTR(RDORuntime) runtime) const
{
	return rdo::Factory<RDOResource>::create(runtime, getParams(), getResType(), getTraceID(), getType(), traceable(), m_temporary);
}

// ----------------------------------------------------------------------------
// ---------- RDOPROCBlock
// ----------------------------------------------------------------------------
RDOPROCBlock::RDOPROCBlock(LPIPROCProcess pProcess)
	: m_process(pProcess)
{}

rbool RDOPROCBlock::init()
{
	if (!m_process)
		return false;

	m_process.query_cast<IBaseOperationContainer>()->append(this);
	return true;
}

RDOPROCBlock::TransactIt RDOPROCBlock::transactFind(CREF(LPTransact) pTransact)
{
	return std::find(m_transacts.begin(), m_transacts.end(), pTransact);
}

RDOPROCBlock::TransactIt RDOPROCBlock::transactEnd()
{
	return m_transacts.end();
}

void RDOPROCBlock::transactGoIn(CREF(LPTransact) pTransact)
{
	m_transacts.push_back(pTransact);
}

void RDOPROCBlock::transactGoOut(CREF(LPTransact) pTransact)
{
	m_transacts.remove(pTransact);
}

LPIPROCProcess RDOPROCBlock::getProcess() const
{
	return m_process;
}

// ----------------------------------------------------------------------------
// ---------- RDOPROCGenerate
// ----------------------------------------------------------------------------
void RDOPROCGenerate::onStart( RDOSimulator* sim )
{
	calcNextTimeInterval(sim);
}

bool RDOPROCGenerate::onCheckCondition( RDOSimulator* sim )
{
	return sim->getCurrentTime() >= timeNext ? true : false;
}

IBaseOperation::BOResult RDOPROCGenerate::onDoOperation(PTR(RDOSimulator) sim)
{
//	TRACE1( "%7.1f GENERATE\n", sim->getCurrentTime() );
	calcNextTimeInterval(sim);
	if(m_maxTransCount > 0)
		if(m_TransCount < m_maxTransCount)
		{
			std::vector<RDOValue> transactParams(1);
			transactParams.push_back(sim->getCurrentTime());
			LPRDOPROCTransact pTransact = this->m_process->getTranType()->createRes(static_cast<PTR(RDORuntime)>(sim), transactParams, true, true).object_static_cast<RDOPROCTransact>();
			ASSERT(pTransact);
			LPIPROCBlock pBlock(this);
			pTransact->setBlock(pBlock);
			m_TransCount++;
			PTR(RDOTrace) tracer = static_cast<RDORuntime*>(sim)->getTracer();
			if ( !tracer->isNull() ) 
			{
				tracer->getOStream() << pTransact->traceResourceState('\0', static_cast<RDORuntime*>(sim)) << tracer->getEOL();
			}
			pTransact->next();
			return IBaseOperation::BOR_done;
		}
		else
			return IBaseOperation::BOR_done;
	else
	{
		std::vector<RDOValue> transactParams(1);
		transactParams.push_back(sim->getCurrentTime());
		LPRDOPROCTransact pTransact = this->m_process->getTranType()->createRes(static_cast<PTR(RDORuntime)>(sim), transactParams, true, true).object_static_cast<RDOPROCTransact>();
		ASSERT(pTransact);
		LPIPROCBlock pBlock(this);
		pTransact->setBlock(pBlock);
		PTR(RDOTrace) tracer = static_cast<RDORuntime*>(sim)->getTracer();
		if ( !tracer->isNull() ) 
		{
			tracer->getOStream() << pTransact->traceResourceState('\0', static_cast<RDORuntime*>(sim)) << tracer->getEOL();
		}
		pTransact->next();
		return IBaseOperation::BOR_done;
	}
}

void RDOPROCGenerate::calcNextTimeInterval( RDOSimulator* sim )
{
	sim->addTimePoint( timeNext = pTimeCalc->calcValue( static_cast<RDORuntime*>(sim) ).getDouble() + sim->getCurrentTime(), m_process, this );
}

void                     RDOPROCGenerate::onStop      (PTR(rdoRuntime::RDOSimulator) sim)                  {}
void                     RDOPROCGenerate::onMakePlaned(PTR(rdoRuntime::RDOSimulator) sim, PTR(void) param) {}
IBaseOperation::BOResult RDOPROCGenerate::onContinue  (PTR(rdoRuntime::RDOSimulator) sim)                  { return IBaseOperation::BOR_cant_run; }

// ----------------------------------------------------------------------------
// ---------- RDOPROCBlockForQueue
// ----------------------------------------------------------------------------
RDOPROCBlockForQueue::RDOPROCBlockForQueue(LPIPROCProcess process, parser_for_Queue From_Par)
	: RDOPROCBlock(process )
	, fromParser  (From_Par)
{}

void RDOPROCBlockForQueue::_onStart(RDOSimulator* sim)
{
	int Id_res = fromParser.Id_res;
	int Id_param = fromParser.Id_param;
	LPRDOResource res = static_cast<RDORuntime*>(sim)->getResourceByID(Id_res);
	forRes.Id_param = Id_param;
	forRes.rss = res.object_static_cast<RDOPROCResource>();
	forRes.defaultValue = RDOValue( RDOPROCQueue::getDefaultValue() );
}

// ----------------------------------------------------------------------------
// ---------- RDOPROCQueue
// ----------------------------------------------------------------------------
void RDOPROCQueue::onStart(PTR(rdoRuntime::RDOSimulator) sim)
{
	_onStart(sim);
}

bool RDOPROCQueue::onCheckCondition( RDOSimulator* sim )
{
	if ( !m_transacts.empty() ) 
	{
		RDOValue i = forRes.rss->getParam( forRes.Id_param );
		RDOValue j = RDOValue( int (1) );
		forRes.rss->setParam( forRes.Id_param, i + j );	
		return true;
	}
	else
	{
		return false;
	}
}

IBaseOperation::BOResult RDOPROCQueue::onDoOperation( RDOSimulator* sim )
{
	TRACE1(_T("%7.1f QUEUE\n"), sim->getCurrentTime());
	m_transacts.front()->next();
	return IBaseOperation::BOR_done;
}

void                     RDOPROCQueue::onStop      (PTR(rdoRuntime::RDOSimulator) sim)                  {}
void                     RDOPROCQueue::onMakePlaned(PTR(rdoRuntime::RDOSimulator) sim, PTR(void) param) {}
IBaseOperation::BOResult RDOPROCQueue::onContinue  (PTR(rdoRuntime::RDOSimulator) sim)                  { return IBaseOperation::BOR_cant_run; }

// ----------------------------------------------------------------------------
// ---------- RDOPROCDepart
// ----------------------------------------------------------------------------
void RDOPROCDepart::onStart(PTR(rdoRuntime::RDOSimulator) sim)
{
	_onStart(sim);
}

bool RDOPROCDepart::onCheckCondition( RDOSimulator* sim )
{
	if ( !m_transacts.empty() ) 
	{
		RDOValue i = forRes.rss->getParam( forRes.Id_param );
		RDOValue j = RDOValue( int (1) );
		forRes.rss->setParam( forRes.Id_param, i - j );	
		return true;
	}
	else
	{
		return false;
	}
}

IBaseOperation::BOResult RDOPROCDepart::onDoOperation( RDOSimulator* sim )
{
	TRACE1(_T("%7.1f DEPART\n"), sim->getCurrentTime());
	m_transacts.front()->next();
	return IBaseOperation::BOR_done;
}

void                     RDOPROCDepart::onStop      (PTR(rdoRuntime::RDOSimulator) sim)                  {}
void                     RDOPROCDepart::onMakePlaned(PTR(rdoRuntime::RDOSimulator) sim, PTR(void) param) {}
IBaseOperation::BOResult RDOPROCDepart::onContinue  (PTR(rdoRuntime::RDOSimulator) sim)                  { return IBaseOperation::BOR_cant_run; }

// ----------------------------------------------------------------------------
// ---------- RDOPROCBlockForSeizes
// ----------------------------------------------------------------------------
RDOPROCBlockForSeize::RDOPROCBlockForSeize(LPIPROCProcess process, std::vector < parser_for_Seize > From_Par)
	: RDOPROCBlock(process )
	, fromParser  (From_Par)
{}

void RDOPROCBlockForSeize::_onStart( RDOSimulator* sim )
{
	// todo: ���� ����������� ������ �������, ��������� ������� ����� ������ ������ ��,
	// ��� ��� DPT search, �� ������������� ��������� ���� ����� ������ � checkOperation
	int size = fromParser.size();
	std::vector < parser_for_Seize >::iterator it1 = fromParser.begin();
	while ( it1 != fromParser.end() ) 
	{
		int Id_res = (*it1).Id_res;
		int Id_param = (*it1).Id_param;
		LPRDOResource res = static_cast<RDORuntime*>(sim)->getResourceByID( Id_res );
		runtime_for_Seize bbb;
		bbb.Id_param = Id_param;
		bbb.rss = res.object_static_cast<RDOPROCResource>();
		bbb.enum_free = RDOValue( bbb.rss->getParam(Id_param).getEnum(), RDOPROCBlockForSeize::getStateEnumFree() );
		bbb.enum_buzy = RDOValue( bbb.rss->getParam(Id_param).getEnum(), RDOPROCBlockForSeize::getStateEnumBuzy() );
		forRes.push_back(bbb);
		it1++;
	}
}

// ----------------------------------------------------------------------------
// ---------- RDOPROCSeizes
// ----------------------------------------------------------------------------
void RDOPROCSeize::onStart(PTR(rdoRuntime::RDOSimulator) sim)
{
	_onStart(sim);
}

bool RDOPROCSeize::onCheckCondition(PTR(RDOSimulator) sim)
{
	if (m_transacts.empty())
		return false;

	ruint Size_Seizes = forRes.size();
	for (ruint i = 0; i < Size_Seizes; i++)
	{
		// ���� ��������
		if (forRes[i].rss->getParam(forRes[i].Id_param) == forRes[i].enum_free)
		{
			ruint idBlocksTransact    = m_transacts.front()->getTraceID();
			ruint idResourcesTransact = forRes[i].rss->transacts.front()->getTraceID();
			if (idBlocksTransact != idResourcesTransact)
				return false;

			PTR(RDOTrace) tracer = static_cast<PTR(RDORuntime)>(sim)->getTracer();
			forRes[i].rss->setParam(forRes[i].Id_param, forRes[i].enum_buzy);
			TRACE3(_T("%7.1f SEIZES-%d, resId = %d\n"), sim->getCurrentTime(), index, forRes[i].rss->getTraceID());
			if (!tracer->isNull())
				tracer->getOStream() << forRes[i].rss->traceResourceState(_T('\0'), static_cast<RDORuntime*>(sim)) << tracer->getEOL();

			m_transacts.front()->setRes(forRes[i].rss);
			return true;
		}
	}
	return false;
}

IBaseOperation::BOResult RDOPROCSeize::onDoOperation( RDOSimulator* sim )
{
	m_transacts.front()->next();
	return IBaseOperation::BOR_done;
}

void RDOPROCSeize::transactGoIn( RDOPROCTransact* _transact )
{
	int Size_Seizes = forRes.size();
	for(int i=0;i<Size_Seizes; i++)
	{
		forRes[i].rss->transacts.push_back( _transact );
	}
	RDOPROCBlockForSeize::transactGoIn( _transact );
}

void RDOPROCSeize::transactGoOut( RDOPROCTransact* _transact )
{
	int Size_Seizes = forRes.size();
	for(int i=0;i<Size_Seizes; i++)
	{
		forRes[i].rss->transacts.remove( _transact );
	}
	RDOPROCBlockForSeize::transactGoOut( _transact );
}

void                     RDOPROCSeize::onStop      (PTR(rdoRuntime::RDOSimulator) sim)                  {}
void                     RDOPROCSeize::onMakePlaned(PTR(rdoRuntime::RDOSimulator) sim, PTR(void) param) {}
IBaseOperation::BOResult RDOPROCSeize::onContinue  (PTR(rdoRuntime::RDOSimulator) sim)                  { return IBaseOperation::BOR_cant_run; }

// ----------------------------------------------------------------------------
// ---------- RDOPROCReleases
// ----------------------------------------------------------------------------
void RDOPROCRelease::onStart(PTR(rdoRuntime::RDOSimulator) sim)
{
	_onStart(sim);
}

bool RDOPROCRelease::onCheckCondition( RDOSimulator* sim )
{
	if ( !m_transacts.empty() ) 
	{
		int Size_Seizes = forRes.size();
		for(int i=0;i<Size_Seizes; i++)
		{
			if( forRes[i].rss == m_transacts.front()->getRes() )
			{
				// �����
				if ( forRes[i].rss->getParam(forRes[i].Id_param) == forRes[i].enum_buzy ) 
				{
					RDOTrace* tracer = static_cast<RDORuntime*>(sim)->getTracer();
					TRACE3(_T("%7.1f RELEASES-%d, resId = %d\n"), sim->getCurrentTime(), index, forRes[i].rss->getTraceID());
					forRes[i].rss->setParam(forRes[i].Id_param, forRes[i].enum_free);
						if ( !tracer->isNull() ) 
						{
							tracer->getOStream() << forRes[i].rss->traceResourceState('\0', static_cast<RDORuntime*>(sim)) << tracer->getEOL();
						}				
					return true;
				}		
				// �� ����� � �� ��������
				if ( forRes[i].rss->getParam(forRes[i].Id_param) != forRes[i].enum_free )
				{
					//������� ��������
					RDOTrace* tracer = static_cast<RDORuntime*>(sim)->getTracer();
					TRACE3(_T("%7.1f RELEASES_Bad-%d, resId = %d\n"), sim->getCurrentTime(), index, forRes[i].rss->getTraceID());
					LPRDOPROCTransact transact = m_transacts.front();
					ASSERT(transact);
					transact->setState( RDOResource::CS_Erase );
					if ( !tracer->isNull() )
					{
						tracer->getOStream() << transact->traceResourceState('\0', static_cast<RDORuntime*>(sim)) << tracer->getEOL();
					}
					m_transacts.remove( transact );
					forRes[i].rss->transacts.remove( transact );
					static_cast<RDORuntime*>(sim)->onEraseRes( transact->getTraceID(), NULL );
					return false;
				}
			}
		}
	}
	return false;
}

IBaseOperation::BOResult RDOPROCRelease::onDoOperation( RDOSimulator* sim )
{
	m_transacts.front()->next();
	return IBaseOperation::BOR_done;
}

void                     RDOPROCRelease::onStop      (PTR(rdoRuntime::RDOSimulator) sim)                  {}
void                     RDOPROCRelease::onMakePlaned(PTR(rdoRuntime::RDOSimulator) sim, PTR(void) param) {}
IBaseOperation::BOResult RDOPROCRelease::onContinue  (PTR(rdoRuntime::RDOSimulator) sim)                  { return IBaseOperation::BOR_cant_run; }

// ----------------------------------------------------------------------------
// ---------- RDOPROCAdvance
// ----------------------------------------------------------------------------
bool RDOPROCAdvance::onCheckCondition( RDOSimulator* sim )
{
	if ( !m_transacts.empty() ) 
	{
		return true;
	} 
	else
	{
		if ( !leave_list.empty() ) 
		{
		double tnow = sim->getCurrentTime();
		std::list< LeaveTr >::iterator it = leave_list.begin();
			while ( it != leave_list.end() ) 
			{
				if ( tnow >= it->timeLeave ) 
				{
					return true;
				}
			it++;
			}
		}
	}
	return false;
}

IBaseOperation::BOResult RDOPROCAdvance::onDoOperation( RDOSimulator* sim )
{
	if ( !m_transacts.empty() )
	{
//		TRACE1(_T("%7.1f ADVANCE BEGIN\n"), sim->getCurrentTime());
		double timeLeave = pDelayCalc->calcValue( static_cast<RDORuntime*>(sim) ).getDouble() + sim->getCurrentTime();
		leave_list.push_back( LeaveTr(m_transacts.front(), timeLeave) );
		m_transacts.erase( m_transacts.begin() );
		sim->addTimePoint( timeLeave, m_process, this );
		return IBaseOperation::BOR_done;
	} 
	else if ( !leave_list.empty() )
	{
		double tnow = sim->getCurrentTime();
		std::list< LeaveTr >::iterator it = leave_list.begin();
		while ( it != leave_list.end() )
		{
			if ( tnow >= it->timeLeave )
			{
//				TRACE1(_T("%7.1f ADVANCE END\n"), it->timeLeave);
				it->transact->next();
				leave_list.erase( it );
				return IBaseOperation::BOR_planned_and_run;
			}
			it++;
		}
	}
	return IBaseOperation::BOR_cant_run;
}

void                     RDOPROCAdvance::onStart     (PTR(rdoRuntime::RDOSimulator) sim)                  {}
void                     RDOPROCAdvance::onStop      (PTR(rdoRuntime::RDOSimulator) sim)                  {}
void                     RDOPROCAdvance::onMakePlaned(PTR(rdoRuntime::RDOSimulator) sim, PTR(void) param) {}
IBaseOperation::BOResult RDOPROCAdvance::onContinue  (PTR(rdoRuntime::RDOSimulator) sim)                  { return IBaseOperation::BOR_cant_run; }

// ----------------------------------------------------------------------------
// ---------- RDOPROCTerminate
// ----------------------------------------------------------------------------
bool RDOPROCTerminate::onCheckCondition( RDOSimulator* sim )
{
	return !m_transacts.empty() ? true : false;
}

IBaseOperation::BOResult RDOPROCTerminate::onDoOperation( RDOSimulator* sim )
{
//	TRACE1(_T("%7.1f TERMINATE\n"), sim->getCurrentTime());
	LPRDOPROCTransact transact = m_transacts.front();
	ASSERT(transact);
	transact->setState( RDOResource::CS_Erase );
	RDOTrace* tracer = static_cast<RDORuntime*>(sim)->getTracer();
	if ( !tracer->isNull() ) {
		tracer->getOStream() << transact->traceResourceState('\0', static_cast<RDORuntime*>(sim)) << tracer->getEOL();
	}
	static_cast<RDORuntime*>(sim)->onEraseRes( transact->getTraceID(), NULL );
	m_transacts.erase( m_transacts.begin() );
	int termNow = static_cast<RDORuntime*>(sim)->getCurrentTerm();
	termNow += getTerm();
	static_cast<RDORuntime*>(sim)->setCurrentTerm(termNow);
	return IBaseOperation::BOR_done;
}

void                     RDOPROCTerminate::onStart     (PTR(rdoRuntime::RDOSimulator) sim)                  {}
void                     RDOPROCTerminate::onStop      (PTR(rdoRuntime::RDOSimulator) sim)                  {}
void                     RDOPROCTerminate::onMakePlaned(PTR(rdoRuntime::RDOSimulator) sim, PTR(void) param) {}
IBaseOperation::BOResult RDOPROCTerminate::onContinue  (PTR(rdoRuntime::RDOSimulator) sim)                  { return IBaseOperation::BOR_cant_run; }

// ----------------------------------------------------------------------------
// ---------- RDOPROCAssign
// ----------------------------------------------------------------------------
bool RDOPROCAssign::onCheckCondition( RDOSimulator* sim )
{
	return !m_transacts.empty();
}

IBaseOperation::BOResult RDOPROCAssign::onDoOperation( RDOSimulator* sim )
{
	LPRDOResource res = static_cast<RDORuntime*>(sim)->getResourceByID( t_resId );
	res->setParam( t_parId, pParamValue->calcValue( static_cast<RDORuntime*>(sim) ) );	
	TRACE1(_T("%7.1f ASSIGN\n"), sim->getCurrentTime());
	m_transacts.front()->next();
	return IBaseOperation::BOR_done;
}

void                     RDOPROCAssign::onStart     (PTR(rdoRuntime::RDOSimulator) sim)                  {}
void                     RDOPROCAssign::onStop      (PTR(rdoRuntime::RDOSimulator) sim)                  {}
void                     RDOPROCAssign::onMakePlaned(PTR(rdoRuntime::RDOSimulator) sim, PTR(void) param) {}
IBaseOperation::BOResult RDOPROCAssign::onContinue  (PTR(rdoRuntime::RDOSimulator) sim)                  { return IBaseOperation::BOR_cant_run; }

CLOSE_RDO_RUNTIME_NAMESPACE
