/*!
  \copyright (c) RDO-Team, 2011
  \file      rdotypes.h
  \author    ������ ������ (rdo@rk9.bmstu.ru)
  \date      18.04.2009
  \brief     
  \indent    4T
*/

#ifndef _RDOTYPES_H_
#define _RDOTYPES_H_

// ----------------------------------------------------------------------- INCLUDES
#include <tchar.h>
#include <string>
// ----------------------------------------------------------------------- SYNOPSIS
// --------------------------------------------------------------------------------

//! ��� �������
typedef  char                       tchar;

//! ��� ������
typedef  std::basic_string<tchar>   tstring;

//! ��������� ���
typedef  bool                       rbool;

//! ����� �������� ���
typedef  signed int                 rsint;

//! ����� ����������� ���
typedef  unsigned int               ruint;

//! ����� �������� 64-� ������ ���
typedef  signed long long int       rsint64;

//! ����� ����������� 64-� ������ ���
typedef  unsigned long long int     ruint64;

//! ��� �����
typedef  unsigned char              rbyte;

#endif //! _RDOTYPES_H_
