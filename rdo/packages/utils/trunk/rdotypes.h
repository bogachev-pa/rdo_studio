/*!
  \copyright (c) RDO-Team, 2011
  \file      rdotypes.h
  \authors   ������ ������ (rdo@rk9.bmstu.ru)
  \authors   ��������� ������� (lord.tiran@gmail.com)
  \date      18.04.2009
  \brief     ���������� ������� �����
  \indent    4T
*/

#ifndef _UTILS_RDOTYPES_H_
#define _UTILS_RDOTYPES_H_

// ----------------------------------------------------------------------- PLATFORM
#include "utils/platform.h"
// ----------------------------------------------------------------------- INCLUDES
#ifdef OST_WINDOWS
	#include <tchar.h>
#else
	#define _T(x) x
#endif

#include <string>
// ----------------------------------------------------------------------- SYNOPSIS
// --------------------------------------------------------------------------------

//! ��� �������
typedef  signed char                tchar;

//! ��� �����
typedef  unsigned char              rbyte;

//! ��� ������
typedef  std::basic_string<tchar>   tstring;

//! ��������� ���
typedef  bool                       rbool;

//! ����� �������� ���
typedef  signed int                 rsint;

//! ����� ����������� ���
typedef  unsigned int               ruint;

//! ����� �������� ������� ���
typedef  signed long int            rslong;

//! ����� ����������� ������� ���
typedef  unsigned long int          rulong;

//! ����� �������� 64-� ������ ���
typedef  signed long long int       rsint64;

//! ����� ����������� 64-� ������ ���
typedef  unsigned long long int     ruint64;

#endif // _UTILS_RDOTYPES_H_
