%{
#define YYPARSE_PARAM lexer
#define YYLEX_PARAM lexer
%}

%pure-parser

%token Resource_type		257
%token permanent_kw			258
%token Parameters			259
%token integer				260
%token real					261
%token End					262
%token temporary_kw			263
%token IDENTIF				264
%token INT_CONST			265
%token REAL_CONST			266
%token such_as				267
%token dblpoint				268
%token Resources			269
%token trace_keyword		270
%token no_trace				271
%token IDENTIF_COLON		272
%token Constant				273
%token Body					274
%token Function_keyword		275
%token Type_keyword			276
%token algorithmic			277
%token table_keyword		278
%token list_keyword			279
%token Exist				281
%token Not_Exist			282
%token For_All				283
%token Not_For_All			284
%token neq					285
%token leq					286
%token geq					287
%token NoCheck				288
%token Calculate_if			289
%token or_keyword			290
%token and_keyword			291
%token Sequence				292
%token uniform				293
%token exponential			294
%token normal_keyword		295
%token by_hist				296
%token enumerative			297

%token Pattern				298
%token operation_kw			299
%token irregular_event		300
%token rule_keyword			301
%token keyboard				302
%token Relevant_resources	303
%token Keep					304
%token Create_keyword		305
%token Erase				306
%token NonExist				307
%token IDENTIF_NoChange		308
%token Time					309
%token Choice				310
%token from_keyword			311
%token first_keyword		312
%token Convert_begin		313
%token Convert_end			314
%token Convert_rule			315
%token Convert_event		316
%token with_max				317
%token with_min				318
%token IDENTIF_set			319
%token IDENTIF_NoChange_NoChange	320
%token Operations			321
	
%token Results				322
%token watch_par			323
%token watch_state			324
%token watch_quant			325
%token watch_value			326
%token get_value			327

%token Model_name			328
%token Resource_file		329
%token OprIev_file			330
%token Frame_file			331
%token Statistic_file		332
%token Results_file			333
%token Trace_file			334
%token Show_mode			335
%token Frame_number			336
%token Show_rate			337
%token Run_StartTime		338
%token Trace_StartTime		339
%token Trace_EndTime		340
%token Terminate_if			341
%token Break_point			342
%token Seed					343
%token NoShow				344
%token Monitor				345
%token Animation			346
%token NoChange				347

%token Decision_point		348
%token search_keyword		349
%token trace_stat			350
%token trace_tops			351
%token trace_all			352
%token Condition_keyword	353
%token Term_condition		354
%token Evaluate_by			355
%token Compare_tops			356
%token NO					357
%token YES					358
%token Activities			359
%token value_before			360
%token value_after			361
%token some					362
%token Process				363
%token SEIZE				364
%token GENERATE				365
%token TERMINATE			366
%token ADVANCE				367
%token RELEASE				368
%token if_keyword			369
%token result_keyword		370

%token Frame				400
%token Show_if				401
%token Back_picture			402
%token Show					403
%token frm_cell				404
%token text					405
%token bitmap				406
%token s_bmp				407
%token rect_keyword			408
%token r_rect				409
%token line					410
%token ellipse				411
%token triang				412
%token active				413
%token ruler				414
%token space_kw				415
%token color_transparent_kw	416
%token color_last_kw		417
%token color_white_kw		418
%token color_black_kw		419
%token color_red_kw			420
%token color_green_kw		421
%token color_blue_kw		422
%token color_cyan_kw		423
%token color_magenta_kw		424
%token color_yellow_kw		425
%token color_gray_kw		426

%token QUOTED_IDENTIF		430
%token QUOTED_IDENTIF_BAD	431
%token IDENTIF_BAD			432
%token Select				433
%token Size_kw				434
%token Empty_kw				435
%token not_keyword			436
%token UMINUS				437

%{
#include "pch.h"
#ifdef _DEBUG
#define new DEBUG_NEW
#undef THIS_FILE
static char THIS_FILE[] = __FILE__;
#endif

#include "rdoparser.h"
#include "rdoparser_lexer.h"
#include "rdofun.h"
#include "rdodpt.h"
#include "rdortp.h"
#include "rdorss.h"
#include <rdoprocess.h>
#include <rdo_resources.h>

#define PARSER  reinterpret_cast<rdoParse::RDOLexer*>(lexer)->m_parser
#define RUNTIME PARSER->runtime()

namespace rdoParse 
{
%}

%left or_keyword
%left and_keyword
%left '+' '-'
%left '*' '/'
%left not_keyword
%left UMINUS

%start dptrtp_main

%%

/* ///////////////////////  GENERAL PART ///////////////////////////// */
dptrtp_main:
	| dptrtp_main Decision_point error End /* �������� ��� $Decision_point */
	| dptrtp_main Activities error End     /* �������� ��� $Activities     */
	| dptrtp_main dpt_process_end;

/* ///////////////////////  PROCESS ///////////////////////////// */

dpt_process:		dpt_process_begin dpt_process_input;

dpt_process_begin:	Process;

dpt_process_input:	/* empty */
					| dpt_process_input dpt_process_line;

dpt_process_line:	IDENTIF	{
						PARSER->error( rdo::format("����������� �������� '%s'", ((std::string *)$1)->c_str()) );
					}
					| GENERATE fun_arithm {
					}
					| GENERATE error {
						PARSER->error( @2, "������ � �������������� ���������" )
					}
					| TERMINATE {
					}
					| ADVANCE fun_arithm {
					}
					| ADVANCE error {
						PARSER->error( @2, "������ � �������������� ���������" )
					}
					| RELEASE IDENTIF {
					}
					| SEIZE {
					}
					| SEIZE IDENTIF {

	// ��� �������
	std::string res_name       = *(std::string*)$2;
	// "���������"
	std::string rtp_param_name = rdoRuntime::RDOPROCBlockForSeize::getStateParamName();
	// "��������"
	std::string rtp_state_free = rdoRuntime::RDOPROCBlockForSeize::getStateEnumFree();
	// "�����"
	std::string rtp_state_buzy = rdoRuntime::RDOPROCBlockForSeize::getStateEnumBuzy();

	// �������� ������ ���� ����� ��������
	rdoMBuilder::RDOResTypeList rtpList( PARSER );
	// �������� ������ ���� ��������
	rdoMBuilder::RDOResourceList rssList( PARSER );

	rdoMBuilder::RDOResType rtp;
	bool rssMustCreate = !rssList[res_name].exist();
	if ( rssMustCreate )
	{
		// ������ �� �����, �������� ������� ����
		// ������������ ��� ���� �� ����� �������
		std::string rtp_name( RDOPROCProcess::name_prefix + res_name + RDOPROCProcess::name_sufix );
		// ����� ��� �������
		if ( !rtpList[rtp_name].exist() )
		{
			PARSER->error( @2, rdo::format("�� ������ ��� �������: %s", rtp_name.c_str()) );
		}
		rtp = rtpList[rtp_name];
	}
	else
	{
		// ������� ������, ����� ��� ���
		rtp = rssList[res_name].getType();
	}

	// ��������� ��� �� ������� ������������� ���������
	if ( !rtp.m_params[rtp_param_name].exist() ) {
		PARSER->error( rdo::format( "� ���� ������� '%s' ��� ��������� ������������� ���� '%s'", rtp.name().c_str(), rtp_param_name.c_str() ) );
	}
	const rdoMBuilder::RDOResType::Param& param = rtp.m_params[rtp_param_name];
	// �������� ��������� ����, ���� ���������, ����� � ��� ���� �������� �������� � �����
	// ��� ������ �������� ��� ���������
	if ( param.getType() != rdoRuntime::RDOValue::Type::rvt_enum ) {
		// �������� ��������� ����, �� �� �� ������������� ����
		PARSER->error( rdo::format( "� ���� ������� '%s' �������� '%s' �� �������� ������������ �����", rtp.name().c_str(), rtp_param_name.c_str() ) );
	}
	// ������ �������� ���� ��������
	if ( !param.getEnum().exist(rtp_state_free) || !param.getEnum().exist(rtp_state_buzy) )
	{
		PARSER->error( rdo::format( "� ���� ������� '%s' ������������ �������� '%s' ������ ����� ��� ������� ��� ������������ ��������: %s � %s", rtp.name().c_str(), param.name().c_str(), rtp_state_free.c_str(), rtp_state_buzy.c_str() ) );
	}

	if ( rssMustCreate )
	{
		// �������� ������
		rdoMBuilder::RDOResource rss( rtp, res_name );
//		res->setTrace( true );
		// ������� ��� � �������
		rssList.append( rss );
	}
};

dpt_process_end:	dpt_process End	{
					};

// ----------------------------------------------------------------------------
// ---------- ���������� ���������
// ----------------------------------------------------------------------------
fun_logic:	fun_arithm '=' fun_arithm         { $$ = (int)(*(RDOFUNArithm *)$1 == *(RDOFUNArithm *)$3); }
			| fun_arithm neq fun_arithm       { $$ = (int)(*(RDOFUNArithm *)$1 != *(RDOFUNArithm *)$3); }
			| fun_arithm '<' fun_arithm       { $$ = (int)(*(RDOFUNArithm *)$1 <  *(RDOFUNArithm *)$3); }
			| fun_arithm '>' fun_arithm       { $$ = (int)(*(RDOFUNArithm *)$1 >  *(RDOFUNArithm *)$3); }
			| fun_arithm leq fun_arithm       { $$ = (int)(*(RDOFUNArithm *)$1 <= *(RDOFUNArithm *)$3); }
			| fun_arithm geq fun_arithm       { $$ = (int)(*(RDOFUNArithm *)$1 >= *(RDOFUNArithm *)$3); }
			| fun_logic and_keyword fun_logic { $$ = (int)(*(RDOFUNLogic *)$1 && *(RDOFUNLogic *)$3);   }
			| fun_logic or_keyword fun_logic  { $$ = (int)(*(RDOFUNLogic *)$1 || *(RDOFUNLogic *)$3);   }
			| '[' fun_logic ']' {
				RDOFUNLogic* logic = reinterpret_cast<RDOFUNLogic*>($2);
				logic->setSrcPos( @1, @3 );
				logic->setSrcText( "[" + logic->src_text() + "]" );
				$$ = $2;
			}
			| '(' fun_logic ')' {
				RDOFUNLogic* logic = reinterpret_cast<RDOFUNLogic*>($2);
				logic->setSrcPos( @1, @3 );
				logic->setSrcText( "(" + logic->src_text() + ")" );
				$$ = $2;
			}
			| '[' fun_logic error {
				PARSER->error( @2, "��������� ������������� ������" );
			}
			| '(' fun_logic error {
				PARSER->error( @2, "��������� ������������� ������" );
			}
			| not_keyword fun_logic {
				RDOFUNLogic* logic = reinterpret_cast<RDOFUNLogic*>($2);
				RDOFUNLogic* logic_not = logic->operator_not();
				logic_not->setSrcPos( @1, @2 );
				logic_not->setSrcText( "not " + logic->src_text() );
				$$ = (int)logic_not;
			}
			| fun_group {
			}
			| fun_select_logic {
			};

// ----------------------------------------------------------------------------
// ---------- �������������� ���������
// ----------------------------------------------------------------------------
fun_arithm: fun_arithm '+' fun_arithm		{ $$ = (int)(*(RDOFUNArithm *)$1 + *(RDOFUNArithm *)$3); }
			| fun_arithm '-' fun_arithm		{ $$ = (int)(*(RDOFUNArithm *)$1 - *(RDOFUNArithm *)$3); }
			| fun_arithm '*' fun_arithm		{ $$ = (int)(*(RDOFUNArithm *)$1 * *(RDOFUNArithm *)$3); }
			| fun_arithm '/' fun_arithm		{ $$ = (int)(*(RDOFUNArithm *)$1 / *(RDOFUNArithm *)$3); }
			| '(' fun_arithm ')' {
				RDOFUNArithm* arithm = reinterpret_cast<RDOFUNArithm*>($2);
				arithm->setSrcPos( @1, @3 );
				arithm->setSrcText( "(" + arithm->src_text() + ")" );
				$$ = $2;
			}
			| fun_arithm_func_call {
			}
			| fun_select_arithm {
			}
			| IDENTIF '.' IDENTIF {
				$$ = (int)new RDOFUNArithm( PARSER, RDOParserSrcInfo( @1, *reinterpret_cast<std::string*>($1) ), RDOParserSrcInfo( @3, *reinterpret_cast<std::string*>($3) ) );
			}
			| INT_CONST                   { $$ = (int)new RDOFUNArithm( PARSER, (int)$1, RDOParserSrcInfo( @1, reinterpret_cast<RDOLexer*>(lexer)->YYText() ) );     }
			| REAL_CONST                  { $$ = (int)new RDOFUNArithm( PARSER, (double*)$1, RDOParserSrcInfo( @1, reinterpret_cast<RDOLexer*>(lexer)->YYText() ) ); }
			| IDENTIF                     { $$ = (int)new RDOFUNArithm( PARSER, *(std::string*)$1, @1 );                                                             }
			| '-' fun_arithm %prec UMINUS {
				RDOParserSrcInfo info;
				info.setSrcPos( @1, @2 );
				info.setSrcText( "-" + reinterpret_cast<RDOFUNArithm*>($2)->src_text() );
				$$ = (int)new RDOFUNArithm( PARSER, reinterpret_cast<RDOFUNArithm*>($2)->getType(), new rdoRuntime::RDOCalcUMinus( RUNTIME, reinterpret_cast<RDOFUNArithm*>($2)->createCalc() ), info );
			};

// ----------------------------------------------------------------------------
// ---------- ������� � ������������������
// ----------------------------------------------------------------------------
fun_arithm_func_call:	IDENTIF '(' ')' {
							RDOFUNParams* fun = new RDOFUNParams( PARSER );
							std::string fun_name = *reinterpret_cast<std::string*>($1);
							fun->funseq_name.setSrcInfo( RDOParserSrcInfo(@1, fun_name) );
							fun->setSrcPos( @1, @3 );
							fun->setSrcText( fun_name + "()" );
							RDOFUNArithm* arithm = fun->createCall( fun_name );
							$$ = (int)arithm;
						}
						| IDENTIF '(' fun_arithm_func_call_pars ')' {
							RDOFUNParams* fun    = reinterpret_cast<RDOFUNParams*>($3);
							std::string fun_name = *reinterpret_cast<std::string*>($1);
							fun->funseq_name.setSrcInfo( RDOParserSrcInfo(@1, fun_name) );
							fun->setSrcPos( @1, @4 );
							fun->setSrcText( fun_name + "(" + fun->src_text() + ")" );
							RDOFUNArithm* arithm = fun->createCall( fun_name );
							$$ = (int)arithm;
						}
						| IDENTIF '(' error {
							PARSER->error( @3, "������ � ���������� �������" );
						};

fun_arithm_func_call_pars:	fun_arithm {
								RDOFUNParams* fun = new RDOFUNParams( PARSER );
								RDOFUNArithm* arithm = reinterpret_cast<RDOFUNArithm*>($1);
								fun->setSrcText( arithm->src_text() );
								fun->addParameter( arithm );
								$$ = (int)fun;
							}
							| fun_arithm_func_call_pars ',' fun_arithm {
								RDOFUNParams* fun    = reinterpret_cast<RDOFUNParams*>($1);
								RDOFUNArithm* arithm = reinterpret_cast<RDOFUNArithm*>($3);
								fun->setSrcText( fun->src_text() + ", " + arithm->src_text() );
								fun->addParameter( arithm );
								$$ = (int)fun;
							}
							| fun_arithm_func_call_pars error {
								PARSER->error( @2, "������ � �������������� ���������" );
							}
							| fun_arithm_func_call_pars ',' error {
								PARSER->error( @3, "������ � �������������� ���������" );
							};

// ----------------------------------------------------------------------------
// ---------- ��������� ���������
// ----------------------------------------------------------------------------
fun_group_keyword:	Exist			{ $$ = RDOFUNGroupLogic::fgt_exist;     }
					| Not_Exist		{ $$ = RDOFUNGroupLogic::fgt_notexist;  }
					| For_All		{ $$ = RDOFUNGroupLogic::fgt_forall;    }
					| Not_For_All	{ $$ = RDOFUNGroupLogic::fgt_notforall; };

fun_group_header:	fun_group_keyword '(' IDENTIF_COLON {
						std::string type_name = *reinterpret_cast<std::string*>($3);
						$$ = (int)(new RDOFUNGroupLogic( PARSER, (RDOFUNGroupLogic::FunGroupType)$1, RDOParserSrcInfo(@3, type_name, RDOParserSrcInfo::psi_align_bytext) ));
					}
					| fun_group_keyword '(' error {
						PARSER->error( @3, "��������� ��� ����" );
					}
					| fun_group_keyword error {
						PARSER->error( @1, "����� ����� ������� ��������� ������������� ������" );
					};

fun_group:			fun_group_header fun_logic ')' {
						RDOFUNGroupLogic* groupfun = reinterpret_cast<RDOFUNGroupLogic*>($1);
						groupfun->setSrcPos( @1, @3 );
						$$ = (int)groupfun->createFunLogic( reinterpret_cast<RDOFUNLogic*>($2) );
					}
					| fun_group_header NoCheck ')' {
						RDOFUNGroupLogic* groupfun = reinterpret_cast<RDOFUNGroupLogic*>($1);
						groupfun->setSrcPos( @1, @3 );
						RDOFUNLogic* trueLogic = new RDOFUNLogic( groupfun, new rdoRuntime::RDOCalcConst( RUNTIME, 1 ) );
						trueLogic->setSrcPos( @2 );
						trueLogic->setSrcText( "NoCheck" );
						$$ = (int)groupfun->createFunLogic( trueLogic );
					}
					| fun_group_header fun_logic error {
						PARSER->error( @2, "��������� ������������� ������" );
					}
					| fun_group_header NoCheck error {
						PARSER->error( @2, "��������� ������������� ������" );
					}
					| fun_group_header error {
						PARSER->error( @1, @2, "������ � ���������� ���������" )
					};

// ----------------------------------------------------------------------------
// ---------- Select
// ----------------------------------------------------------------------------
fun_select_header:	Select '(' IDENTIF_COLON {
						std::string type_name = *reinterpret_cast<std::string*>($3);
						RDOFUNSelect* select = new RDOFUNSelect( PARSER, RDOParserSrcInfo(@3, type_name, RDOParserSrcInfo::psi_align_bytext) );
						select->setSrcText( "Select(" + type_name + ": " );
						$$ = (int)select;
					}
					| Select '(' error {
						PARSER->error( @3, "��������� ��� ����" );
					}
					| Select error {
						PARSER->error( @1, "��������� ������������� ������" );
					};

fun_select_body:	fun_select_header fun_logic ')' {
						RDOFUNSelect* select = reinterpret_cast<RDOFUNSelect*>($1);
						RDOFUNLogic*  flogic = reinterpret_cast<RDOFUNLogic*>($2);
						select->setSrcText( select->src_text() + flogic->src_text() + ")" );
						select->initSelect( flogic );
					}
					| fun_select_header NoCheck ')' {
						RDOFUNSelect* select = reinterpret_cast<RDOFUNSelect*>($1);
						RDOParserSrcInfo logic_info(@2, "NoCheck");
						select->setSrcText( select->src_text() + logic_info.src_text() + ")" );
						rdoRuntime::RDOCalcConst* calc_nocheck = new rdoRuntime::RDOCalcConst( RUNTIME, 1 );
						RDOFUNLogic* flogic = new RDOFUNLogic( select, calc_nocheck, true );
						flogic->setSrcInfo( logic_info );
						select->initSelect( flogic );
					}
					| fun_select_header fun_logic error {
						PARSER->error( @2, "��������� ������������� ������" );
					}
					| fun_select_header NoCheck error {
						PARSER->error( @2, "��������� ������������� ������" );
					}
					| fun_select_header error {
						PARSER->error( @1, @2, "������ � ���������� ���������" )
					};

fun_select_keyword:	Exist			{ $$ = RDOFUNGroupLogic::fgt_exist;     }
					| Not_Exist		{ $$ = RDOFUNGroupLogic::fgt_notexist;  }
					| For_All		{ $$ = RDOFUNGroupLogic::fgt_forall;    }
					| Not_For_All	{ $$ = RDOFUNGroupLogic::fgt_notforall; };

fun_select_logic:	fun_select_body '.' fun_select_keyword '(' fun_logic ')' {
						RDOFUNSelect* select = reinterpret_cast<RDOFUNSelect*>($1);
						select->setSrcPos( @1, @6 );
						RDOFUNLogic* logic = select->createFunSelectGroup( (RDOFUNGroupLogic::FunGroupType)$3, reinterpret_cast<RDOFUNLogic*>($5) );
						$$ = (int)logic;
					}
					| fun_select_body '.' fun_select_keyword '(' error {
						PARSER->error( @4, @5, "������ � ���������� ���������" )
					}
					| fun_select_body '.' fun_select_keyword error {
						PARSER->error( @3, "��������� ������������� ������" );
					}
					| fun_select_body '.' Empty_kw '(' ')' {
						RDOFUNSelect* select = reinterpret_cast<RDOFUNSelect*>($1);
						select->setSrcPos( @1, @5 );
						RDOParserSrcInfo empty_info(@3, @5, "Empty()");
						RDOFUNLogic* logic = select->createFunSelectEmpty( empty_info );
						$$ = (int)logic;
					}
					| fun_select_body '.' Empty_kw '(' error {
						PARSER->error( @4, "��������� ������������� ������" );
					}
					| fun_select_body '.' Empty_kw error {
						PARSER->error( @3, "��������� ������������� ������" );
					}
					| fun_select_body '.' error {
						PARSER->error( @2, @3, "��������� ����� ������ ��������" );
					}
					| fun_select_body error {
						PARSER->error( @1, "��������� '.' (�����) ��� ������ ������ ������ ��������" );
					};

fun_select_arithm:	fun_select_body '.' Size_kw '(' ')' {
						RDOFUNSelect* select = reinterpret_cast<RDOFUNSelect*>($1);
						select->setSrcPos( @1, @5 );
						RDOParserSrcInfo size_info(@3, @5, "Size()");
						RDOFUNArithm* arithm = select->createFunSelectSize( size_info );
						$$ = (int)arithm;
					}
					| fun_select_body '.' Size_kw error {
						PARSER->error( @3, "��������� ������������� ������" );
					}
					| fun_select_body '.' Size_kw '(' error {
						PARSER->error( @4, "��������� ������������� ������" );
					};

%%

}
