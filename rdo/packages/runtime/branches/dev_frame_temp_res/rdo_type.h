/*!
  \copyright (c) RDO-Team, 2011
  \file      rdo_type.h
  \author    ������ ������ (rdo@rk9.bmstu.ru)
  \date      22.06.2008
  \brief     ������� ��� ������
  \indent    4T
*/

#ifndef _LIB_RUNTIME_TYPE_H_
#define _LIB_RUNTIME_TYPE_H_

// ----------------------------------------------------------------------- INCLUDES
// ----------------------------------------------------------------------- SYNOPSIS
#include "utils/rdomacros.h"
#include "utils/rdotypes.h"
#include "utils/smart_ptr/intrusive_ptr.h"
#include "simulator/runtime/namespace.h"
// --------------------------------------------------------------------------------

OPEN_RDO_RUNTIME_NAMESPACE

class RDOValue;

/*!
  \class     RDOType
  \brief     ������� ��� ������ ���
*/
OBJECT(RDOType)
{
public:
	/*!
	  \enum      TypeID
	  \brief     ������������� ���� ������
	*/
	enum TypeID
	{
		t_unknow = 0,
		t_void,
		t_identificator,
		t_int,
		t_real,
		t_bool,
		t_string,
		t_enum,
		t_pointer
	};

	RDOType(TypeID typeID);
	virtual ~RDOType();

	TypeID  typeID() const;

private:
	TypeID  m_typeID;
};

/// @todo �������� ������!
/*!
  \def       DEFINE_ATOM_TYPE
  \brief     ������ ��� ����������� ������� (���������) ����� ������
*/
#define DEFINE_ATOM_TYPE(Type)        \
class RDOType__##Type: public RDOType \
{                                     \
public:                               \
	RDOType__##Type()                 \
		: RDOType(t_##Type)           \
	{}                                \
};                                    \
extern rdo::intrusive_ptr<RDOType__##Type> g_##Type;

/*!
  \class     RDOType__unknow
  \brief     ��������� ����������� ��� ������
*/
DEFINE_ATOM_TYPE(unknow);

/*!
  \class     RDOType__void
  \brief     ��������� ����� ��� ������
*/
DEFINE_ATOM_TYPE(void);

/*!
  \class     RDOType__identificator
  \brief     ��������� ��� ������ �������������
*/
DEFINE_ATOM_TYPE(identificator);

/*!
  \class     RDOType__int
  \brief     ��������� ������������� ��� ������
*/
DEFINE_ATOM_TYPE(int);

/*!
  \class     RDOType__real
  \brief     ��������� ������������ ��� ������
*/
DEFINE_ATOM_TYPE(real);

/*!
  \class     RDOType__bool
  \brief     ��������� ���������� ��� ������
*/
DEFINE_ATOM_TYPE(bool);

/*!
  \class     RDOType__string
  \brief     ��������� ��������� ��� ������
*/
DEFINE_ATOM_TYPE(string);

CLOSE_RDO_RUNTIME_NAMESPACE

#include "simulator/runtime/rdo_type.inl"

#endif // _LIB_RUNTIME_TYPE_H_