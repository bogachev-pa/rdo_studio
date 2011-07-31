/******************************************************************************//**
 * @copyright (c) RDO-Team, 2010
 * @file      equaltype.h
 * @authors   ������ ������
 * @date      03.12.2010
 * @brief     unknown
 * @indent    4T
 *********************************************************************************/

#ifndef _LIB_RUNTIME_EQUAL_TYPE_H_
#define _LIB_RUNTIME_EQUAL_TYPE_H_

// *********************************************************************** INCLUDES
// *********************************************************************** SYNOPSIS
// ********************************************************************************

OPEN_RDO_RUNTIME_NAMESPACE

// ********************************************************************************
// ******************** EqualType
// ********************************************************************************
enum EqualType
{
	ET_UNDEFINED,
	ET_NOCHANGE,
	ET_EQUAL,
	ET_PLUS,
	ET_MINUS,
	ET_MULTIPLY,
	ET_DIVIDE,
	ET_INCR,
	ET_DECR
};

CLOSE_RDO_RUNTIME_NAMESPACE

#endif // _LIB_RUNTIME_EQUAL_TYPE_H_
