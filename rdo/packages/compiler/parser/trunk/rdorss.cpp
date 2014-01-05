/*!
  \copyright (c) RDO-Team, 2011
  \file      rdorss.cpp
  \authors   Барс Александр
  \authors   Урусов Андрей (rdo@rk9.bmstu.ru)
  \authors   Романов Ярослав (robot.xet@gmail.com)
  \date      
  \brief     
  \indent    4T
*/

// ---------------------------------------------------------------------------- PCH
#include "simulator/compiler/parser/pch.h"
// ----------------------------------------------------------------------- INCLUDES
// ----------------------------------------------------------------------- SYNOPSIS
#include "simulator/compiler/parser/rdorss.h"
#include "simulator/compiler/parser/rdortp.h"
#include "simulator/compiler/parser/rdoparser.h"
#include "simulator/compiler/parser/rdoparser_lexer.h"
#include "simulator/runtime/calc/resource/calc_resource.h"
#include "simulator/runtime/calc/resource/calc_create_resource.h"
// --------------------------------------------------------------------------------

OPEN_RDO_PARSER_NAMESPACE

// --------------------------------------------------------------------------------
// -------------------- RDORSSResource
// --------------------------------------------------------------------------------
const std::string RDORSSResource::CONTEXT_PARAM_RESOURCE_EXPRESSION = "resource_expression";

RDORSSResource::RDORSSResource(CREF(LPRDOParser) pParser, CREF(RDOParserSrcInfo) src_info, CREF(LPRDORTPResType) pResType, ruint id)
	: RDOParserSrcInfo(src_info                                      )
	, m_pResType      (pResType                                      )
	, m_id            (id == UNDEFINED_ID ? pParser->getRSS_id() : id)
	, trace           (false                                         )
{
	ASSERT(m_pResType);
	pParser->insertRSSResource(LPRDORSSResource(this));
	m_currParam = m_pResType->getParams().begin();
	RDOParser::s_parser()->contextStack()->push(this);
}

RDORSSResource::~RDORSSResource()
{}

void RDORSSResource::end()
{
	RDOParser::s_parser()->contextStack()->pop<RDORSSResource>();
}

Context::FindResult RDORSSResource::onFindContext(const std::string& method, const Context::Params& params, const RDOParserSrcInfo& srcInfo) const
{
	if (method == Context::METHOD_GET)
	{
		const std::string paramName = params.identifier();

		ruint parNumb = getType()->getRTPParamNumber(paramName);
		if (parNumb == RDORTPResType::UNDEFINED_PARAM)
		{
			RDOParser::s_parser()->error().error(srcInfo, rdo::format("Неизвестный параметр ресурса: %s", paramName.c_str()));
		}

		LPExpression pExpression = rdo::Factory<Expression>::create(
			rdo::Factory<TypeInfo>::create(getType(), getType()->src_info()),
			rdo::Factory<rdo::runtime::RDOCalcGetResourceByID>::create(getID()),
			srcInfo
		);

		Context::Params params_;
		params_[RDORSSResource::CONTEXT_PARAM_RESOURCE_EXPRESSION] = pExpression;
		params_[RDOParam::CONTEXT_PARAM_PARAM_ID] = parNumb;

		LPContext pParam = getType()->findRTPParam(paramName);
		ASSERT(pParam);
		return pParam->find(Context::METHOD_GET, params_, srcInfo);
	}

	return FindResult();
}

void RDORSSResource::writeModelStructure(REF(rdo::ostream) stream) const
{
	stream << (getID() + 1) << " " << name() << " " << getType()->getNumber() << std::endl;
}

void RDORSSResource::addParam(CREF(LPRDOValue) pParam)
{
	ASSERT(pParam);

	LPRDOValue pAddParam;

	if (m_currParam == getType()->getParams().end())
	{
		RDOParser::s_parser()->error().push_only(pParam->src_info(), "Слишком много параметров");
		RDOParser::s_parser()->error().push_only(getType()->src_info(), "См. тип ресурса");
		RDOParser::s_parser()->error().push_done();
	}

	try
	{
		if (pParam->value().getAsString() == "*")
		{
			if (!(*m_currParam)->getDefault()->defined())
			{
				RDOParser::s_parser()->error().push_only(pParam->src_info(), "Невозможно использовать '*', к.т. отсутствует значение по умолчанию");
				/// @todo src_info() без параметра RDOParserSrcInfo()
				RDOParser::s_parser()->error().push_only((*m_currParam)->getTypeInfo()->src_info(RDOParserSrcInfo()), "См. описание параметра");
				RDOParser::s_parser()->error().push_done();
			}
			pAddParam = (*m_currParam)->getDefault();
		}
		else if (pParam->value().getAsString() == "#")
		{
			pAddParam = (*m_currParam)->getDefault()->defined()
				? (*m_currParam)->getDefault()
				: rdo::Factory<rdo::compiler::parser::RDOValue>::create(
					(*m_currParam)->getTypeInfo()->type()->get_default(),
					(*m_currParam)->getTypeInfo()->src_info(RDOParserSrcInfo()),
					(*m_currParam)->getTypeInfo()
				);
			ASSERT(pAddParam);
			pAddParam->value().setUndefined(true);
		}
		else
		{
			pAddParam = (*m_currParam)->getTypeInfo()->value_cast(pParam);
		}
	}
	catch(const RDOSyntaxException&)
	{
		RDOParser::s_parser()->error().modify(rdo::format("Для параметра '%s': ", (*m_currParam)->name().c_str()));
	}

	ASSERT(pAddParam);
	try
	{
		pAddParam = rdo::Factory<RDOValue>::create(pAddParam->value().clone(), pAddParam->src_info(), pAddParam->typeInfo());
	}
	catch (const rdo::runtime::RDOValueException& e)
	{
		RDOParser::s_parser()->error().error(pParam->src_info(), rdo::format("Для параметра '%s': %s", (*m_currParam)->name().c_str(), e.message().c_str()));
	}
	m_paramList.push_back(Param(pAddParam));
	m_currParam++;
}

rbool RDORSSResource::defined() const
{
	return m_currParam == getType()->getParams().end();
}

rdo::runtime::LPRDOCalc RDORSSResource::createCalc() const
{
	std::vector<rdo::runtime::RDOValue> paramList;
	STL_FOR_ALL_CONST(params(), it)
	{
		paramList.push_back(it->param()->value());
	}

	rdo::runtime::LPRDOCalc pCalc = rdo::Factory<rdo::runtime::RDOCalcCreateResource>::create(
		getType()->getNumber(),
		paramList,
		getTrace(),
		getType()->isPermanent()
	);
	ASSERT(pCalc);
	rdo::runtime::RDOSrcInfo srcInfo(src_info());
	srcInfo.setSrcText("Создание ресурса " + src_text());
	pCalc->setSrcInfo(srcInfo);
	return pCalc;
}

CLOSE_RDO_PARSER_NAMESPACE
