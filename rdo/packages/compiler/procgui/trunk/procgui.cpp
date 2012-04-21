/*!
  \copyright (c) RDO-Team, 2011
  \file      procgui.cpp
  \author    ������� ������
  \date      22.04.2011
  \brief     
  \indent    4T
*/

// ---------------------------------------------------------------------------- PCH
#include "simulator/compiler/procgui/pch.h"
// ----------------------------------------------------------------------- INCLUDES
// ----------------------------------------------------------------------- SYNOPSIS
#include "simulator/compiler/procgui/procgui.h"
#include "simulator/compiler/mbuilder/rdo_resources.h"
#include "simulator/compiler/mbuilder/process.h"
// --------------------------------------------------------------------------------

OPEN_COMPILER_GUI_NAMESPACE

// --------------------------------------------------------------------------------
// -------------------- ProcGUICalc
// --------------------------------------------------------------------------------
ProcGUICalc::ProcGUICalc(CREF(rdo::runtime::LPRDORuntime) pRuntime, CREF(LPRPShapeDataBlock) pParams)
	: m_pRuntime(pRuntime)
	, m_pParams (pParams )
{
	ASSERT(m_pRuntime);
	ASSERT(m_pParams );
	switch(pParams->getZakon())
	{
		case RPShapeDataBlock::Const: // ��������� 
		{
			m_pCalc = static_cast<rdo::runtime::LPRDOCalc>(getConstCalc(pParams->getExp()));
			break;
		}	
		case RPShapeDataBlock::Normal: // ����������
		{
			m_pCalc = static_cast<rdo::runtime::LPRDOCalc>(getNormalCalc(pParams->getBase(), pParams->getExp(), pParams->getDisp()));
			break;
		}
		case RPShapeDataBlock::Uniform: // ����������� �����
		{
			m_pCalc = static_cast<rdo::runtime::LPRDOCalc>(getUniformCalc(pParams->getBase(), pParams->getExp(), pParams->getDisp()));
			break;
		}
		case RPShapeDataBlock::Exp: // ����������������
		{
			m_pCalc = static_cast<rdo::runtime::LPRDOCalc>(getExpCalc(pParams->getBase(), pParams->getExp()));
			break;
		}
		case RPShapeDataBlock::Triangular: // ����������� �����
		{
			m_pCalc = static_cast<rdo::runtime::LPRDOCalc>(getTriangularCalc(pParams->getBase(), pParams->getExp(), pParams->getDisp(), pParams->getMax()));
			break;
		}
	}
}

ProcGUICalc::~ProcGUICalc()
{}

rdo::runtime::LPRDOCalcConst ProcGUICalc::getConstCalc(double arg)
{
	rdo::runtime::LPRDOCalcConst pCalc = rdo::Factory<rdo::runtime::RDOCalcConst>::create(arg);
	ASSERT(pCalc);
	return pCalc;
}

rdo::runtime::LPRDOCalc ProcGUICalc::getCalc()
{
	return m_pCalc;
}

rdo::runtime::LPRDOCalcFunctionCaller ProcGUICalc::getNormalCalc(ruint base, double arg1, double arg2)
{
	PTR(rdo::runtime::RandGeneratorNormal) pGenerator = new rdo::runtime::RandGeneratorNormal();
	ASSERT(pGenerator);
	rdo::runtime::LPRDOCalcSeqInit pInitCalc = rdo::Factory<rdo::runtime::RDOCalcSeqInit>::create(base, pGenerator);
	ASSERT(pInitCalc);
	m_pRuntime->addInitCalc(pInitCalc);
	rdo::runtime::LPRDOCalcSeqNext pNextCalc = rdo::Factory<rdo::runtime::RDOCalcSeqNextNormal>::create(pGenerator);
	ASSERT(pNextCalc);
	rdo::runtime::LPRDOCalcFunctionCaller pFuctionCall = rdo::Factory<rdo::runtime::RDOCalcFunctionCaller>::create(pNextCalc);
	ASSERT(pFuctionCall);
	rdo::runtime::LPRDOCalcConst pArg1 = rdo::Factory<rdo::runtime::RDOCalcConst>::create(arg1);
	rdo::runtime::LPRDOCalcConst pArg2 = rdo::Factory<rdo::runtime::RDOCalcConst>::create(arg2);
	ASSERT(pArg1);
	ASSERT(pArg2);
	pFuctionCall->addParameter(pArg1);
	pFuctionCall->addParameter(pArg2);
	return pFuctionCall;
}

rdo::runtime::LPRDOCalcFunctionCaller ProcGUICalc::getUniformCalc(ruint base, double arg1, double arg2)
{
	PTR(rdo::runtime::RandGeneratorUniform) pGenerator = new rdo::runtime::RandGeneratorUniform();
	ASSERT(pGenerator);
	rdo::runtime::LPRDOCalcSeqInit pInitCalc = rdo::Factory<rdo::runtime::RDOCalcSeqInit>::create(base, pGenerator);
	ASSERT(pInitCalc);
	m_pRuntime->addInitCalc(pInitCalc);
	rdo::runtime::LPRDOCalcSeqNext pNextCalc = rdo::Factory<rdo::runtime::RDOCalcSeqNextUniform>::create(pGenerator);
	ASSERT(pNextCalc);
	rdo::runtime::LPRDOCalcFunctionCaller pFuctionCall = rdo::Factory<rdo::runtime::RDOCalcFunctionCaller>::create(pNextCalc);
	ASSERT(pFuctionCall);
	rdo::runtime::LPRDOCalcConst pArg1 = rdo::Factory<rdo::runtime::RDOCalcConst>::create(arg1);
	rdo::runtime::LPRDOCalcConst pArg2 = rdo::Factory<rdo::runtime::RDOCalcConst>::create(arg2);
	ASSERT(pArg1);
	ASSERT(pArg2);
	pFuctionCall->addParameter(pArg1);
	pFuctionCall->addParameter(pArg2);
	return pFuctionCall;
}

rdo::runtime::LPRDOCalcFunctionCaller ProcGUICalc::getExpCalc(ruint base, double arg)
{
	PTR(rdo::runtime::RandGeneratorExponential) pGenerator = new rdo::runtime::RandGeneratorExponential();
	ASSERT(pGenerator);
	rdo::runtime::LPRDOCalcSeqInit pInitCalc = rdo::Factory<rdo::runtime::RDOCalcSeqInit>::create(base, pGenerator);
	ASSERT(pInitCalc);
	m_pRuntime->addInitCalc(pInitCalc);
	rdo::runtime::LPRDOCalcSeqNext pNextCalc = rdo::Factory<rdo::runtime::RDOCalcSeqNextExponential>::create(pGenerator);
	ASSERT(pNextCalc);
	rdo::runtime::LPRDOCalcFunctionCaller pFuctionCall = rdo::Factory<rdo::runtime::RDOCalcFunctionCaller>::create(pNextCalc);
	ASSERT(pFuctionCall);
	rdo::runtime::LPRDOCalcConst pArg = rdo::Factory<rdo::runtime::RDOCalcConst>::create(arg);
	ASSERT(pArg);
	pFuctionCall->addParameter(pArg);
	return pFuctionCall;
}

rdo::runtime::LPRDOCalcFunctionCaller ProcGUICalc::getTriangularCalc(ruint base, double arg1, double arg2, double arg3)
{
	PTR(rdo::runtime::RandGeneratorTriangular) pGenerator = new rdo::runtime::RandGeneratorTriangular();
	rdo::runtime::LPRDOCalcSeqInit pInitCalc = rdo::Factory<rdo::runtime::RDOCalcSeqInit>::create(base, pGenerator);
	ASSERT(pInitCalc);
	m_pRuntime->addInitCalc(pInitCalc);
	rdo::runtime::LPRDOCalcSeqNext pNextCalc = rdo::Factory<rdo::runtime::RDOCalcSeqNextTriangular>::create(pGenerator);
	ASSERT(pNextCalc);
	rdo::runtime::LPRDOCalcFunctionCaller pFuctionCall = rdo::Factory<rdo::runtime::RDOCalcFunctionCaller>::create(pNextCalc);
	ASSERT(pFuctionCall);
	rdo::runtime::LPRDOCalcConst pArg1 = rdo::Factory<rdo::runtime::RDOCalcConst>::create(arg1);
	rdo::runtime::LPRDOCalcConst pArg2 = rdo::Factory<rdo::runtime::RDOCalcConst>::create(arg2);
	rdo::runtime::LPRDOCalcConst pArg3 = rdo::Factory<rdo::runtime::RDOCalcConst>::create(arg3);
	pFuctionCall->addParameter(pArg1);
	pFuctionCall->addParameter(pArg2);
	pFuctionCall->addParameter(pArg3);
	return pFuctionCall;
}

// --------------------------------------------------------------------
// ---------- ProcGUIProcess
// --------------------------------------------------------------------
tstring ProcGUIProcess::s_namePrefix = _T("");
tstring ProcGUIProcess::s_nameSufix  = _T("s");

ProcGUIProcess::ProcGUIProcess(CREF(rdo::runtime::LPRDORuntime) pRuntime)
	: m_pRuntime(pRuntime)
{
	ASSERT(m_pRuntime);
	m_pProcess = RF(rdo::runtime::RDOPROCProcess)::create(_T("GuiProcess"), m_pRuntime);
	ASSERT(m_pProcess);
	m_pProcess.query_cast<ILogic>()->init(m_pRuntime);
}

ProcGUIProcess::~ProcGUIProcess()
{}

void ProcGUIProcess::clear()
{
	m_pProcess = NULL;
	m_blockList.clear();
}

void ProcGUIProcess::insertBlock(CREF(LPProcGUIBlock) pBlock)
{
	ASSERT(pBlock);
	m_blockList.push_back(pBlock);
}

void ProcGUIProcess::initResources(CREF(parser::LPRDOParser) pParser)
{
	STL_FOR_ALL_CONST(m_resNameList, it)
	{
		parser::LPRDORSSResource pResource = pParser->findRSSResource(*it);
		ASSERT(pResource);
		rdo::runtime::LPRDOCalc pCalc = pResource->createCalc();
		ASSERT(pCalc);
		pParser->runtime()->addInitCalc(pCalc);
	}
}

void ProcGUIProcess::addResNameToBlock(CREF(tstring) name)
{
	ASSERT(!name.empty());

	ResNameList::const_iterator it = std::find(m_resNameList.begin(), m_resNameList.end(), name);
	if (it == m_resNameList.end())
	{
		m_resNameList.push_back(name);
	}
}

// --------------------------------------------------------------------------------
// -------------------- ProcGUIBlock
// --------------------------------------------------------------------------------
ProcGUIBlock::ProcGUIBlock(CREF(LPProcGUIProcess) pProcess, CREF(tstring) name)
	: m_name(name)
{
	ASSERT(pProcess);
	pProcess->insertBlock(this);
}

ProcGUIBlock::~ProcGUIBlock()
{}

// --------------------------------------------------------------------------------
// -------------------- ProcGUIBlockGenerate
// --------------------------------------------------------------------------------
ProcGUIBlockGenerate::ProcGUIBlockGenerate(CREF(LPProcGUIProcess) pProcess, CREF(rdo::runtime::LPRDORuntime) pRuntime, CREF(parser::LPRDOParser) pParser, CREF(LPRPShapeDataBlockCreate) pParams)
	: ProcGUIBlock(pProcess, pParams->getName())
	, ProcGUICalc (pRuntime, pParams           )
	, m_pParams   (pParams                     )
{
	ASSERT(pProcess );
	ASSERT(pRuntime );
	ASSERT(pParser  );
	ASSERT(m_pParams);

	tstring rtpName      = _T("���������");
	tstring rtpParamName = _T("�����_��������");

	//! �������� ������ ���� ����� ��������
	rdo::compiler::mbuilder::RDOResTypeList rtpList(pParser);
	//! ����� ��� �������, ���� ��� ���, �� �������
	if (!rtpList[rtpName].exist())
	{
		//! �������� ��� �������
		rdo::compiler::mbuilder::RDOResType rtp(rtpName);
		//! ������� �������� �����_��������
		rdo::compiler::mbuilder::RDOResType::Param param(rtpParamName, rdo::Factory<parser::RDOType__real>::create());
		rtp.m_params.append(param);
		//! ������� ��� �������
		if (!rtpList.append(rtp))
		{
			pParser->error().error(parser::RDOParserSrcInfo(), rdo::format(_T("������ �������� ���� �������: %s"), rtpName.c_str()));
		}
	}

	parser::LPRDORTPResType pResType = parser::RDOParser::s_parser()->findRTPResType(rtpName);
	ASSERT(pResType);
	pResType->setType(parser::RDORTPResType::procTran);
	pResType->end();

	rdo::runtime::LPIResourceType pType = pResType->getRuntimeResType();
	ASSERT(pType);

	std::vector<rdo::runtime::RDOValue> paramList;
	paramList.push_back(rdo::runtime::RDOValue(0.0));

	rdo::runtime::LPRDOCalc pCreateTransactCalc = rdo::Factory<rdo::runtime::RDOCalcCreateResource>::create(
		pType,
		paramList,
		true,
		pResType->isPermanent()
	);
	ASSERT(pCreateTransactCalc);

	rdo::runtime::LPRDOCalc pTimeCalc = getCalc();
	ASSERT(pTimeCalc);

	m_pBlock = RF(rdo::runtime::RDOPROCGenerate)::create(
		pProcess->getProcess(),
		pTimeCalc,
		pCreateTransactCalc,
		m_pParams->getAmount()
	);
	ASSERT(m_pBlock);

	LPIInternalStatisticsManager pStatisticsManager = m_pBlock;
	ASSERT(pStatisticsManager);
}

ProcGUIBlockGenerate::~ProcGUIBlockGenerate()
{}

// --------------------------------------------------------------------------------
// -------------------- ProcGUIBlockTerminate
// --------------------------------------------------------------------------------
ProcGUIBlockTerminate::ProcGUIBlockTerminate(CREF(LPProcGUIProcess) pProcess, CREF(LPRPShapeDataBlockTerminate) pParams)
	: ProcGUIBlock(pProcess, pParams->getName())
	, m_pParams   (pParams                     )
{
	ASSERT(pProcess );
	ASSERT(m_pParams);

	//! \todo �������� ��������� �������������� ���������
	rdo::runtime::LPRDOCalc pCalc = rdo::Factory<rdo::runtime::RDOCalcConst>::create(rdo::runtime::RDOValue(static_cast<ruint>(m_pParams->getTermInc())));
	ASSERT(pCalc);
	m_pBlock = RF(rdo::runtime::RDOPROCTerminate)::create(pProcess->getProcess(), pCalc);
	ASSERT(m_pBlock);
}

ProcGUIBlockTerminate::~ProcGUIBlockTerminate()
{}

// --------------------------------------------------------------------------------
// -------------------- ProcGUIBlockProcess
// --------------------------------------------------------------------------------
ProcGUIBlockProcess::ProcGUIBlockProcess(CREF(LPProcGUIProcess) pProcess, CREF(rdo::runtime::LPRDORuntime) pRuntime, CREF(parser::LPRDOParser) pParser, CREF(LPRPShapeDataBlockProcess) pParams)
	: ProcGUIBlock(pProcess, pParams->getName())
	, m_pParams   (pParams                     )
{
	ASSERT(pProcess );
	ASSERT(pRuntime );
	ASSERT(pParser  );
	ASSERT(m_pParams);

	CREF(RPShapeDataBlockProcess::ActionList) actionList = m_pParams->getActionList();
	STL_FOR_ALL_CONST(actionList, it)
	{
		switch (*it)
		{
			case RPShapeDataBlockProcess::A_SEIZE:
			{
				LPProcGUIQueue pQueue = rdo::Factory<ProcGUIQueue>::create(pProcess, pParser, m_pParams->getName());
				ASSERT(pQueue);
				pQueue->createRuntime(pProcess, pParser);

				LPProcGUISeize pSeize = rdo::Factory<ProcGUISeize>::create(pProcess, pParser, m_pParams);
				ASSERT(pSeize);
				pSeize->createRuntime(pProcess, pParser);

				LPProcGUIDepart pDepart = rdo::Factory<ProcGUIDepart>::create(pProcess, pParser, m_pParams->getName());
				ASSERT(pDepart);
				pDepart->createRuntime(pProcess, pParser);

				break;
			}
			case RPShapeDataBlockProcess::A_ADVANCE:
			{
				LPProcGUIAdvance pAdvance = rdo::Factory<ProcGUIAdvance>::create(pProcess, pRuntime, m_pParams);
				ASSERT(pAdvance);
				break;
			}
			case RPShapeDataBlockProcess::A_RELEASE:
			{
				LPProcGUIRelease pRelease = rdo::Factory<ProcGUIRelease>::create(pProcess, pParser, m_pParams);
				ASSERT(pRelease);
				pRelease->createRuntime(pProcess, pParser);
				break;
			}
		}
	}
	pProcess->initResources(pParser);
}

ProcGUIBlockProcess::~ProcGUIBlockProcess()
{}

// --------------------------------------------------------------------------------
// -------------------- ProcGUIAdvance
// --------------------------------------------------------------------------------
ProcGUIAdvance::ProcGUIAdvance(CREF(LPProcGUIProcess) pProcess, CREF(rdo::runtime::LPRDORuntime) pRuntime, CREF(LPRPShapeDataBlockProcess) pParams)
	: ProcGUIBlock(pProcess, rdo::format(_T("%s Advance"), pParams->getName().c_str()))
	, ProcGUICalc (pRuntime, pParams)
	, m_pParams   (pParams)
{
	ASSERT(pProcess );
	ASSERT(pRuntime );
	ASSERT(m_pParams);

	m_pBlock = RF(rdo::runtime::RDOPROCAdvance)::create(pProcess->getProcess(), getCalc());
	ASSERT(m_pBlock);
}

ProcGUIAdvance::~ProcGUIAdvance()
{}

// --------------------------------------------------------------------------------
// -------------------- ProcGUISeize
// --------------------------------------------------------------------------------
ProcGUISeize::ProcGUISeize(CREF(LPProcGUIProcess) pProcess, CREF(parser::LPRDOParser) pParser, CREF(LPRPShapeDataBlockProcess) pParams)
	: ProcGUIBlock(pProcess, rdo::format(_T("%s Seize"), pParams->getName().c_str()))
	, m_pParams   (pParams)
{
	ASSERT(pProcess );
	ASSERT(pParser  );
	ASSERT(m_pParams);

	CREF(RPShapeDataBlockProcess::ResNameList) resNameList = m_pParams->getResNameList();
	STL_FOR_ALL_CONST(resNameList, it)
	{
		addResourceName(*it);
		pProcess->addResNameToBlock(*it);
		tstring resName = *it;
		//! �������� ������ ���� ��������
		rdo::compiler::mbuilder::RDOResourceList rssList(pParser);
		rdo::compiler::mbuilder::RDOResType      rtp;
		//! ���� ������ ����������, ����� ��� ��� � ���������
		if (rssList[resName].exist())
		{
			rtp = rssList[resName].getType();
			if (rdo::compiler::mbuilder::BlockForSeize::checkType(rtp, parser::RDOParserSrcInfo()))
			{
				//! \todo ����������
				if (!rssList[resName].checkParserResourceType<parser::RDORSSResource>(pParser))
				{
					rdo::compiler::mbuilder::BlockForSeize::reobjectRes(rtp, resName);
				}
			}
		}
		else
		{
			//! ������ �� ������, ������������ ��� ���� �� ����� �������
			//! ������������ ��� ���� �� ����� �������
			tstring rtpName(ProcGUIProcess::s_namePrefix + resName + ProcGUIProcess::s_nameSufix);
			//! �������� ������ ���� ����� ��������
			rdo::compiler::mbuilder::RDOResTypeList rtpList(pParser);
			//! ����� ��� �������
			if (rtpList[rtpName].exist())
			{
				rdo::compiler::mbuilder::RDOResType rtp_ = rtpList[rtpName];
				if (rdo::compiler::mbuilder::BlockForSeize::checkType(rtp_, parser::RDOParserSrcInfo()))
				{
					rdo::compiler::mbuilder::BlockForSeize::createRes(rtp_, resName);
				}
			}
			else
			{
				rtp = rdo::compiler::mbuilder::BlockForSeize::createType(rtpName, parser::RDOParserSrcInfo());
				rdo::compiler::mbuilder::BlockForSeize::createRes(rtp, resName);
			}
		}
	}
}

ProcGUISeize::~ProcGUISeize()
{}

void ProcGUISeize::createRuntime(CREF(LPProcGUIProcess) pProcess, CREF(parser::LPRDOParser) pParser)
{
	ASSERT(pProcess);
	ASSERT(pParser );

	STL_FOR_ALL_CONST(m_resNameList, it)
	{
		parser::LPRDORSSResource pResource = pParser->findRSSResource(*it);
		if (pResource)
		{
			tstring resName = pResource->name();
			//! �������� ������ ���� ��������
			rdo::compiler::mbuilder::RDOResourceList rssList(pParser);
			//! �������� ��� �������
			rdo::compiler::mbuilder::RDOResType rtp = rssList[resName].getType();
			//! "���������"
			tstring rtpParamName = rdo::runtime::RDOPROCBlockForSeize::getStateParamName();
			//! �������� ��� �� ������� ������������� ���������
			if (!rtp.m_params[rtpParamName].exist())
			{
				pParser->error().error(rtp.src_info(), rdo::format(_T("� ���� ������� '%s' ��� ��������� ������������� ���� '%s'"), rtp.name().c_str(), rtpParamName.c_str()));
			}
			rdo::runtime::parser_for_Seize bbb;
			bbb.Id_res   = pResource->getID();
			bbb.Id_param = rtp.m_params[rtpParamName].id(); 
			m_parserForRuntime.push_back(bbb);
		}
		else
		{
			pParser->error().error(parser::RDOParserSrcInfo(), rdo::format(_T("���������� ������ ProcGUISeize: �� ����� parser-������ '%s'"), it->c_str()));
		}
	}
	if (!m_parserForRuntime.empty())
	{
		m_pBlock = RF(rdo::runtime::RDOPROCSeize)::create(pProcess->getProcess(), m_parserForRuntime);
		ASSERT(m_pBlock);
	}
	else
	{
		pParser->error().error(parser::RDOParserSrcInfo(), _T("���������� ������: ���� Seize �� �������� ��������"));
	}
}

void ProcGUISeize::addResourceName(CREF(tstring) name)
{
	ASSERT(!name.empty());
	m_resNameList.push_back(name);
}

// --------------------------------------------------------------------------------
// -------------------- ProcGUIRelease
// --------------------------------------------------------------------------------
ProcGUIRelease::ProcGUIRelease(CREF(LPProcGUIProcess) pProcess, CREF(parser::LPRDOParser) pParser, CREF(LPRPShapeDataBlockProcess) pParams)
	: ProcGUIBlock(pProcess, rdo::format(_T("%s Release"), pParams->getName().c_str()))
	, m_pParams   (pParams)
{
	ASSERT(pProcess );
	ASSERT(pParser  );
	ASSERT(m_pParams);

	CREF(RPShapeDataBlockProcess::ResNameList) resNameList = m_pParams->getResNameList();
	STL_FOR_ALL_CONST(resNameList, it)
	{
		addResourceName(*it);
		pProcess->addResNameToBlock(*it);
		tstring resName = *it;
		//! �������� ������ ���� ��������
		rdo::compiler::mbuilder::RDOResourceList rssList(pParser);
		rdo::compiler::mbuilder::RDOResType      rtp;
		//! ���� ������ ����������, ����� ��� ��� � ���������
		if (rssList[resName].exist())
		{
			rtp = rssList[resName].getType();
			if (rdo::compiler::mbuilder::BlockForSeize::checkType(rtp, parser::RDOParserSrcInfo()))
			{
				//! \todo ����������
				if (!rssList[resName].checkParserResourceType<parser::RDORSSResource>(pParser))
				{
					rdo::compiler::mbuilder::BlockForSeize::reobjectRes(rtp, resName);
				}
			}
		}
		else
		{
			//! ������ �� ������, ������������ ��� ���� �� ����� �������
			//! ������������ ��� ���� �� ����� �������
			tstring rtpName(ProcGUIProcess::s_namePrefix + resName + ProcGUIProcess::s_nameSufix);
			//! �������� ������ ���� ����� ��������
			rdo::compiler::mbuilder::RDOResTypeList rtpList(pParser);
			//! ����� ��� �������
			if (rtpList[rtpName].exist())
			{
				rdo::compiler::mbuilder::RDOResType rtp_ = rtpList[rtpName];
				if (rdo::compiler::mbuilder::BlockForSeize::checkType(rtp_, parser::RDOParserSrcInfo()))
				{
					rdo::compiler::mbuilder::BlockForSeize::createRes(rtp_, resName);
				}
			}
			else
			{
				rtp = rdo::compiler::mbuilder::BlockForSeize::createType(rtpName, parser::RDOParserSrcInfo());
				rdo::compiler::mbuilder::BlockForSeize::createRes(rtp, resName);
			}
		}
	}
}

ProcGUIRelease::~ProcGUIRelease()
{}

void ProcGUIRelease::createRuntime(CREF(LPProcGUIProcess) pProcess, CREF(parser::LPRDOParser) pParser)
{
	ASSERT(pProcess);
	ASSERT(pParser );

	STL_FOR_ALL_CONST(m_resNameList, it)
	{
		parser::LPRDORSSResource pResource = pParser->findRSSResource(*it);
		if (pResource)
		{
			tstring resName = pResource->name();
			//! �������� ������ ���� ��������
			rdo::compiler::mbuilder::RDOResourceList rssList(pParser);
			//! �������� ��� �������
			rdo::compiler::mbuilder::RDOResType rtp = rssList[resName].getType();
			//! "���������"
			tstring rtpParamName = rdo::runtime::RDOPROCBlockForSeize::getStateParamName();
			//! �������� ��� �� ������� ������������� ���������
			if (!rtp.m_params[rtpParamName].exist())
			{
				pParser->error().error(rtp.src_info(), rdo::format(_T("� ���� ������� '%s' ��� ��������� ������������� ���� '%s'"), rtp.name().c_str(), rtpParamName.c_str()));
			}
			rdo::runtime::parser_for_Seize bbb;
			bbb.Id_res   = pResource->getID();
			bbb.Id_param = rtp.m_params[rtpParamName].id(); 
			m_parserForRuntime.push_back(bbb);
		}
		else
		{
			pParser->error().error(parser::RDOParserSrcInfo(), rdo::format(_T("���������� ������ ProcGUIRelease: �� ����� parser-������ '%s'"), it->c_str()));
		}
	}
	if (!m_parserForRuntime.empty())
	{
		m_pBlock = RF(rdo::runtime::RDOPROCRelease)::create(pProcess->getProcess(), m_parserForRuntime);
		ASSERT(m_pBlock);
	}
	else
	{
		pParser->error().error(parser::RDOParserSrcInfo(), _T("���������� ������: ���� Release �� �������� ��������"));
	}
}

void ProcGUIRelease::addResourceName(CREF(tstring) name)
{
	ASSERT(!name.empty());
	m_resNameList.push_back(name);
}

// --------------------------------------------------------------------------------
// -------------------- RDOPROCQueue
// --------------------------------------------------------------------------------
ProcGUIQueue::ProcGUIQueue(CREF(LPProcGUIProcess) pProcess, CREF(parser::LPRDOParser) pParser, CREF(tstring) name)
	: ProcGUIBlock  (pProcess, rdo::format(_T("%s Queue"), name.c_str()))
	, m_resourceName(name)
{
	ASSERT(pProcess);
	ASSERT(pParser );

	pProcess->addResNameToBlock(m_resourceName);
	// �������� ������ ���� ��������
	rdo::compiler::mbuilder::RDOResourceList rssList(pParser);
	//! �������� ������ ���� ����� ��������
	rdo::compiler::mbuilder::RDOResTypeList rtpList(pParser);
	rdo::compiler::mbuilder::RDOResType     rtp;
	tstring rtpName   = _T("QDEPART");
	tstring queueName = _T("�������_") + m_resourceName;
	//! ���� ������ ����������, ����� ��� ��� � ���������
	if (rssList[m_resourceName].exist())
	{
		rtp = rssList[m_resourceName].getType();
		rdo::compiler::mbuilder::BlockForQueue::checkType(rtp, parser::RDOParserSrcInfo());
		parser::LPRDOPMDWatchPar pResult = rdo::Factory<parser::RDOPMDWatchPar>::create(parser::RDOParserSrcInfo(queueName));
		ASSERT(pResult);
		pResult->init(false, parser::RDOParserSrcInfo(m_resourceName), parser::RDOParserSrcInfo(tstring(_T("�����_�������"))));
	}
	else
	{
		//! ���� ��� "QDEPART" ����������
		if (rtpList[rtpName].exist())
		{
			rdo::compiler::mbuilder::RDOResType rtp_ = rtpList[rtpName];
			if (rdo::compiler::mbuilder::BlockForQueue::checkType(rtp_, parser::RDOParserSrcInfo()))
			{
				rdo::compiler::mbuilder::BlockForQueue::createRes(rtp_, m_resourceName);
				parser::LPRDOPMDWatchPar pResult = rdo::Factory<parser::RDOPMDWatchPar>::create(parser::RDOParserSrcInfo(queueName));
				ASSERT(pResult);
				pResult->init(false, parser::RDOParserSrcInfo(m_resourceName), parser::RDOParserSrcInfo(tstring(_T("�����_�������"))));
			}
		}
		else
		{
			rdo::compiler::mbuilder::RDOResType rtp_ = rdo::compiler::mbuilder::BlockForQueue::createType(rtpName, parser::RDOParserSrcInfo());
			if (rdo::compiler::mbuilder::BlockForQueue::checkType(rtp_, parser::RDOParserSrcInfo()))
			{
				rdo::compiler::mbuilder::BlockForQueue::createRes(rtp_, m_resourceName);
				parser::LPRDOPMDWatchPar pResult = rdo::Factory<parser::RDOPMDWatchPar>::create(parser::RDOParserSrcInfo(queueName));
				ASSERT(pResult);
				pResult->init(false, parser::RDOParserSrcInfo(m_resourceName), parser::RDOParserSrcInfo(tstring(_T("�����_�������"))));
			}
		}
	}
}

ProcGUIQueue::~ProcGUIQueue()
{}

void ProcGUIQueue::createRuntime(CREF(LPProcGUIProcess) pProcess, CREF(parser::LPRDOParser) pParser)
{
	ASSERT(pProcess);
	ASSERT(pParser );

	parser::LPRDORSSResource pResource = pParser->findRSSResource(m_resourceName);
	if (pResource)
	{
		tstring resName = pResource->name();
		//! �������� ������ ���� ��������
		rdo::compiler::mbuilder::RDOResourceList rssList(pParser);
		//! �������� ��� �������
		rdo::compiler::mbuilder::RDOResType rtp = rssList[resName].getType();
		//! "�����_�������"
		tstring rtpParamName        = rdo::runtime::RDOPROCQueue::getQueueParamName();
		m_parserForRuntime.Id_res   = pResource->getID();
		m_parserForRuntime.Id_param = rtp.m_params[rtpParamName].id();
	}
	else
	{
		pParser->error().error(parser::RDOParserSrcInfo(), rdo::format(_T("���������� ������ ProcGUIQueue: �� ����� parser-������ '%s'"), m_resourceName.c_str()));
	}
	m_pBlock = RF(rdo::runtime::RDOPROCQueue)::create(pProcess->getProcess(), m_parserForRuntime);
	ASSERT(m_pBlock);
}


// --------------------------------------------------------------------------------
// -------------------- ProcGUIDepart
// --------------------------------------------------------------------------------
ProcGUIDepart::ProcGUIDepart(CREF(LPProcGUIProcess) pProcess, CREF(parser::LPRDOParser) pParser, CREF(tstring) name)
	: ProcGUIBlock  (pProcess, rdo::format(_T("%s Depart"), name.c_str()))
	, m_resourceName(name)
{
	ASSERT(pProcess);
	ASSERT(pParser );

	pProcess->addResNameToBlock(m_resourceName);
	//! �������� ������ ���� ��������
	rdo::compiler::mbuilder::RDOResourceList rssList(pParser);
	//! �������� ������ ���� ����� ��������
	rdo::compiler::mbuilder::RDOResTypeList rtpList(pParser);
	rdo::compiler::mbuilder::RDOResType rtp;
	tstring rtpName = _T("QDEPART");
	//! ���� ������ ����������, ����� ��� ��� � ���������
	if (rssList[m_resourceName].exist())
	{
		rtp = rssList[m_resourceName].getType();
		rdo::compiler::mbuilder::BlockForQueue::checkType(rtp, parser::RDOParserSrcInfo());
	}
	else
	{
		if (rtpList[rtpName].exist())
		{
			rdo::compiler::mbuilder::RDOResType rtp_ = rtpList[rtpName];
			if (rdo::compiler::mbuilder::BlockForQueue::checkType(rtp_, parser::RDOParserSrcInfo()))
			{
				rdo::compiler::mbuilder::BlockForQueue::createRes(rtp_, m_resourceName);
			}
		}
		else
		{
			rdo::compiler::mbuilder::RDOResType rtp_ = rdo::compiler::mbuilder::BlockForQueue::createType(rtpName, parser::RDOParserSrcInfo());
			if (rdo::compiler::mbuilder::BlockForQueue::checkType(rtp_, parser::RDOParserSrcInfo()))
			{
				rdo::compiler::mbuilder::BlockForQueue::createRes(rtp_, m_resourceName);
			}
		}
	}
}

ProcGUIDepart::~ProcGUIDepart()
{}

void ProcGUIDepart::createRuntime(CREF(LPProcGUIProcess) pProcess, CREF(parser::LPRDOParser) pParser)
{
	ASSERT(pProcess);
	ASSERT(pParser );

	parser::LPRDORSSResource pResource = pParser->findRSSResource(m_resourceName);
	if (pResource)
	{
		tstring resName = pResource->name();
		//! �������� ������ ���� ��������
		rdo::compiler::mbuilder::RDOResourceList rssList(pParser);
		//! �������� ��� �������
		rdo::compiler::mbuilder::RDOResType rtp = rssList[resName].getType();
		//! "�����_�������"
		tstring rtpParamName        = rdo::runtime::RDOPROCDepart::getDepartParamName();
		m_parserForRuntime.Id_res   = pResource->getID();
		m_parserForRuntime.Id_param = rtp.m_params[rtpParamName].id();
	}	
	else
	{
		pParser->error().error(parser::RDOParserSrcInfo(), rdo::format(_T("���������� ������ ProcGUIDepart: �� ����� parser-������ '%s'"), m_resourceName.c_str()));
	}
	m_pBlock = RF(rdo::runtime::RDOPROCDepart)::create(pProcess->getProcess(), m_parserForRuntime);
	ASSERT(m_pBlock);
}

CLOSE_COMPILER_GUI_NAMESPACE
