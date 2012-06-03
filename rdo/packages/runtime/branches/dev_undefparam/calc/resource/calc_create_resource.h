/*!
  \copyright (c) RDO-Team, 2012
  \file      calc_create_resource.h
  \authors   ���� ���������
  \authors   ������ ������ (rdo@rk9.bmstu.ru)
  \authors   ����� ������� (dluschan@rk9.bmstu.ru)
  \date      10.02.2012
  \brief     RDOCalc ��� �������� ��������
  \indent    4T
*/

#ifndef _LIB_RUNTIME_CALC_RESOURCE_CREATE_RESOURCE_H_
#define _LIB_RUNTIME_CALC_RESOURCE_CREATE_RESOURCE_H_

// ----------------------------------------------------------------------- INCLUDES
// ----------------------------------------------------------------------- SYNOPSIS
#include "simulator/runtime/calc/calc_base.h"
#include "simulator/runtime/rdo_res_type_i.h"
// --------------------------------------------------------------------------------

OPEN_RDO_RUNTIME_NAMESPACE

//! �������� ������ �������
CALC(RDOCalcCreateResource)
{
DECLARE_FACTORY(RDOCalcCreateResource)
private:
	//! relResID == ~0 ��� ��������, ����������� ��� ������������� ������
	RDOCalcCreateResource(CREF(LPIResourceType) pType, CREF(std::vector<RDOValue>) rParamsCalcs, rbool traceFlag, rbool permanentFlag, ruint relResID = ~0);

	LPIResourceType        m_pResType;
	//! \todo m_paramsCalcs ������ ����� ����������� RDOCalc
	std::vector<RDOValue>  m_paramsCalcs;
	rbool                  m_traceFlag;
	rbool                  m_permanentFlag;
	ruint                  m_relResID;

	DECLARE_ICalc;
};

CLOSE_RDO_RUNTIME_NAMESPACE

//#include "simulator/runtime/calc/resource/calc_choice_from.inl"

#endif // _LIB_RUNTIME_CALC_RESOURCE_CREATE_RESOURCE_H_
