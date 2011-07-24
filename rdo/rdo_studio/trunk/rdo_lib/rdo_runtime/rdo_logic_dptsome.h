/******************************************************************************//**
 * @copyright (c) RDO-Team, 2009
 * @file      rdo_logic_dptsome.h
 * @authors   ����� �������
 * @date      04.11.2009
 * @brief     unknown
 * @indent    4T
 *********************************************************************************/

#ifndef _LIB_RUNTIME_LOGIC_DPTSOME_
#define _LIB_RUNTIME_LOGIC_DPTSOME_

// *********************************************************************** INCLUDES
// *********************************************************************** SYNOPSIS
#include "rdo_common/namespace.h"
#include "rdo_lib/rdo_runtime/rdo_logic.h"
#include "rdo_lib/rdo_runtime/rdo_priority.h"
// ********************************************************************************

OPEN_RDO_RUNTIME_NAMESPACE

/******************************************************************************//**
 * @class   RDODPTSome
 * @brief   unknown
 *********************************************************************************/
class RDODPTSome: public RDOLogicSimple, public RDOPatternPrior
{
DEFINE_IFACTORY(RDODPTSome);
QUERY_INTERFACE_BEGIN
QUERY_INTERFACE_PARENT(RDOLogicSimple)
QUERY_INTERFACE_PARENT(RDOPatternPrior)
QUERY_INTERFACE_END

private:
	RDODPTSome (CREF(LPRDORuntime) pRuntime, LPIBaseOperationContainer parent = NULL);
	virtual ~RDODPTSome();
};

CLOSE_RDO_RUNTIME_NAMESPACE

#include "rdo_lib/rdo_runtime/rdo_logic_dptsome.inl"

#endif // _LIB_RUNTIME_LOGIC_DPTSOME_
