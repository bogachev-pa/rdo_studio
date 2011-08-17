/*!
  \copyright (c) RDO-Team, 2011
  \file      rdo_object.h
  \authors   ���� ���������
  \authors   ������ ������ (rdo@rk9.bmstu.ru)
  \date      
  \brief     
  \indent    4T
*/

// ---------------------------------------------------------------------------- PCH
#include "rdo_lib/rdo_parser/pch.h"
// ----------------------------------------------------------------------- INCLUDES
// ----------------------------------------------------------------------- SYNOPSIS
#include "rdo_lib/rdo_parser/rdo_object.h"
#include "rdo_lib/rdo_parser/rdoparser.h"
// --------------------------------------------------------------------------------

OPEN_RDO_PARSER_NAMESPACE

// --------------------------------------------------------------------------------
// -------------------- RDOParserSrcInfo
// --------------------------------------------------------------------------------
RDOParserSrcInfo::RDOParserSrcInfo()
	: RDOSrcInfo()
{
	init();
}

RDOParserSrcInfo::RDOParserSrcInfo(CREF(YYLTYPE) pos)
	: RDOSrcInfo()
{
	init();
	setSrcPos(pos);
}

RDOParserSrcInfo::RDOParserSrcInfo(CREF(rdoRuntime::RDOSrcInfo) info)
	: RDOSrcInfo()
{
	init();
	RDOSrcInfo::setSrcInfo(info);
}

RDOParserSrcInfo::RDOParserSrcInfo(CREF(rdoRuntime::RDOSrcInfo::Position) pos)
	: RDOSrcInfo()
{
	init();
	RDOSrcInfo::setSrcPos(pos);
}

RDOParserSrcInfo::RDOParserSrcInfo(CREF(tstring) text)
	: RDOSrcInfo()
{
	init();
	setSrcText(text);
}

RDOParserSrcInfo::RDOParserSrcInfo(CREF(YYLTYPE) pos, CREF(tstring) text)
	: RDOSrcInfo()
{
	init();
	setSrcPos (pos );
	setSrcText(text);
}

RDOParserSrcInfo::RDOParserSrcInfo(CREF(YYLTYPE) pos_begin, CREF(YYLTYPE) pos_end, rbool first_align)
	: RDOSrcInfo()
{
	init();
	if (!first_align)
	{
		setSrcPos(pos_begin, pos_end);
	}
	else
	{
		if (pos_begin.m_first_line == pos_end.m_last_line)
		{
			setSrcPos(pos_begin, pos_end);
		}
		else
		{
			YYLTYPE pos(pos_begin);
			pos.m_first_line = pos.m_last_line;
			pos.m_first_pos  = pos.m_last_pos;
			setSrcPos(pos);
		}
	}
}

RDOParserSrcInfo::RDOParserSrcInfo(CREF(YYLTYPE) pos_begin, CREF(YYLTYPE) pos_end, CREF(tstring) text)
	: RDOSrcInfo()
{
	init();
	setSrcPos (pos_begin, pos_end);
	setSrcText(text);
}

void RDOParserSrcInfo::init()
{
	setSrcFileType(RDOParser::getFileToParse());
	rdoRuntime::RDOSrcInfo::Position pos;
	pos.m_first_pos  = RDOParser::lexer_loc_pos();
	pos.m_last_pos   = pos.m_first_pos;
	pos.m_first_line = RDOParser::lexer_loc_line();
	pos.m_last_line  = pos.m_first_line;
	RDOSrcInfo::setSrcPos(pos);
}

CLOSE_RDO_PARSER_NAMESPACE
