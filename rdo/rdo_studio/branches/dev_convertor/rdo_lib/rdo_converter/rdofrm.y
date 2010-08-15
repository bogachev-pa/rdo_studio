/*
 * copyright: (c) RDO-Team, 2009
 * filename : rdofrm.y
 * author   : �������� ����, ������ ������
 * date     : 
 * bref     : 
 * indent   : 4T
 */

%{
#define YYPARSE_PARAM lexer
#define YYLEX_PARAM lexer
%}

%pure-parser

%token RDO_Resource_type				257
%token RDO_permanent					258
%token RDO_Parameters					259
%token RDO_integer						260
%token RDO_real							261
%token RDO_End							262
%token RDO_temporary					263
%token RDO_IDENTIF						264
%token RDO_INT_CONST					265
%token RDO_REAL_CONST					266
%token RDO_such_as						267
%token RDO_dblpoint						268
%token RDO_Resources					269
%token RDO_trace						270
%token RDO_no_trace						271
%token RDO_IDENTIF_COLON				272
%token RDO_Constant						273
%token RDO_Body							274
%token RDO_Function						275
%token RDO_Type							276
%token RDO_algorithmic					277
%token RDO_table						278
%token RDO_list							279
%token RDO_Exist						281
%token RDO_Not_Exist					282
%token RDO_For_All						283
%token RDO_Not_For_All					284
%token RDO_neq							285
%token RDO_leq							286
%token RDO_geq							287
%token RDO_NoCheck						288
%token RDO_Calculate_if					289
%token RDO_or							290
%token RDO_and							291
%token RDO_Sequence						292
%token RDO_uniform						293
%token RDO_exponential					294
%token RDO_normal						295
%token RDO_by_hist						296
%token RDO_enumerative					297

%token RDO_Pattern						298
%token RDO_operation					299
%token RDO_irregular_event				300
%token RDO_rule							301
%token RDO_keyboard						302
%token RDO_Relevant_resources			303
%token RDO_Keep							304
%token RDO_Create						305
%token RDO_Erase						306
%token RDO_NonExist						307
%token RDO_IDENTIF_NoChange				308
%token RDO_Time							309
%token RDO_Choice						310
%token RDO_from							311
%token RDO_first						312
%token RDO_Convert_begin				313
%token RDO_Convert_end					314
%token RDO_Convert_rule					315
%token RDO_Convert_event				316
%token RDO_with_max						317
%token RDO_with_min						318
%token RDO_set							319
%token RDO_IDENTIF_NoChange_NoChange	320
%token RDO_Operations					321
	
%token RDO_Results						322
%token RDO_watch_par					323
%token RDO_watch_state					324
%token RDO_watch_quant					325
%token RDO_watch_value					326
%token RDO_get_value					327

%token RDO_Model_name					328
%token RDO_Resource_file				329
%token RDO_OprIev_file					330
%token RDO_Frame_file					331
%token RDO_Statistic_file				332
%token RDO_Results_file					333
%token RDO_Trace_file					334
%token RDO_Show_mode					335
%token RDO_Frame_number					336
%token RDO_Show_rate					337
%token RDO_Run_StartTime				338
%token RDO_Trace_StartTime				339
%token RDO_Trace_EndTime				340
%token RDO_Terminate_if					341
%token RDO_Break_point					342
%token RDO_Seed							343
%token RDO_NoShow						344
%token RDO_Monitor						345
%token RDO_Animation					346
%token RDO_NoChange						347

%token RDO_Decision_point				348
%token RDO_search						349
%token RDO_trace_stat					350
%token RDO_trace_tops					351
%token RDO_trace_all					352
%token RDO_Condition					353
%token RDO_Term_condition				354
%token RDO_Evaluate_by					355
%token RDO_Compare_tops					356
%token RDO_NO							357
%token RDO_YES							358
%token RDO_Activities					359
%token RDO_value_before					360
%token RDO_value_after					361
%token RDO_some							362
%token RDO_Process						363
%token RDO_SEIZE						364
%token RDO_GENERATE						365
%token RDO_TERMINATE					366
%token RDO_ADVANCE						367
%token RDO_RELEASE						368
%token RDO_if							369
%token RDO_result						370
%token RDO_CF							371
%token RDO_Priority						372
%token RDO_prior						373
%token RDO_Parent						374
%token RDO_PlusEqual					375
%token RDO_MinusEqual					376
%token RDO_MultiplyEqual				377
%token RDO_DivideEqual					378
%token RDO_array						379
%token RDO_event						380
%token RDO_Planning						381
%token RDO_else							382
%token RDO_IncrEqual					383
%token RDO_DecrEqual					384
%token RDO_Stopping						385
%token RDO_Start						386
%token RDO_Stop							387

%token RDO_Frame						400
%token RDO_Show_if						401
%token RDO_Back_picture					402
%token RDO_Show							403
%token RDO_frm_cell						404
%token RDO_text							405
%token RDO_bitmap						406
%token RDO_s_bmp						407
%token RDO_rect							408
%token RDO_r_rect						409
%token RDO_line							410
%token RDO_ellipse						411
%token RDO_triang						412
%token RDO_active						413
%token RDO_ruler						414
%token RDO_space						415
%token RDO_color_transparent			416
%token RDO_color_last					417
%token RDO_color_white					418
%token RDO_color_black					419
%token RDO_color_red					420
%token RDO_color_green					421
%token RDO_color_blue					422
%token RDO_color_cyan					423
%token RDO_color_magenta				424
%token RDO_color_yellow					425
%token RDO_color_gray					426

%token RDO_IDENTIF_RELRES				427
%token RDO_typedef						428
%token RDO_enum							429

%token RDO_STRING_CONST					430
%token RDO_STRING_CONST_BAD				431
%token RDO_IDENTIF_BAD					432
%token RDO_Select						433
%token RDO_Size							434
%token RDO_Empty						435
%token RDO_not							436
%token RDO_UMINUS						437
%token RDO_string						438
%token RDO_bool							439
%token RDO_BOOL_CONST					440
%token RDO_Fuzzy						441
%token RDO_Fuzzy_Term					442
%token RDO_eq							443
%token RDO_External_Model				444
%token RDO_QUEUE						445
%token RDO_DEPART						446
%token RDO_ASSIGN						447


%{
// ====================================================================== PCH
#include "rdo_lib/rdo_converter/pch.h"
// ====================================================================== INCLUDES
// ====================================================================== SYNOPSIS
#include "thirdparty/bison_flex/FlexLexer.h"
#include "rdo_lib/rdo_converter/rdoparser.h"
#include "rdo_lib/rdo_converter/rdoparser_lexer.h"
#include "rdo_lib/rdo_converter/rdortp.h"
#include "rdo_lib/rdo_converter/rdofun.h"
#include "rdo_lib/rdo_converter/rdofrm.h"
#include "rdo_lib/rdo_converter/rdopat.h"
#include "rdo_lib/rdo_converter/rdodpt.h"
#include "rdo_lib/rdo_converter/rdo_type_range.h"
#include "rdo_lib/rdo_runtime/rdocalc.h"
#include "rdo_common/rdoanimation.h"
// ===============================================================================

#define PARSER  LEXER->parser()
#define RUNTIME PARSER->runtime()

#define P_RDOVALUE(A) reinterpret_cast<PTR(RDOValue)>(A)
#define RDOVALUE(A)   (*P_RDOVALUE(A))

OPEN_RDO_CONVERTER_NAMESPACE
%}

%left RDO_or
%left RDO_and
%left '+' '-'
%left '*' '/'
%left RDO_not
%left RDO_UMINUS

%start frm_main

%%

// ----------------------------------------------------------------------------
// ---------- �������� ����
// ----------------------------------------------------------------------------
frm_main
	: /* empty */
	| frm_main frm_end
	| error
	{
		PARSER->error().error(@1, _T("����������� ������"));
	}
	;

// ----------------------------------------------------------------------------
// ---------- �����
// ----------------------------------------------------------------------------
frm_begin
	: RDO_Frame RDO_IDENTIF
	{
		LPRDOFRMFrame pFrame = rdo::Factory<RDOFRMFrame>::create(P_RDOVALUE($2)->src_info());
		ASSERT(pFrame);
		$$ = PARSER->stack().push(pFrame);
	}
	| RDO_Frame RDO_IDENTIF RDO_Show_if fun_logic
	{
		LPRDOFRMFrame pFrame = rdo::Factory<RDOFRMFrame>::create(P_RDOVALUE($2)->src_info(), PARSER->stack().pop<RDOFUNLogic>($4));
		ASSERT(pFrame);
		$$ = PARSER->stack().push(pFrame);
	}
	| RDO_Frame RDO_IDENTIF RDO_Show_if error
	{
		PARSER->error().error(@4, _T("������ � ���������� ���������"))
	}
	;

frm_background
	: frm_begin RDO_Back_picture '=' frm_color
	{
		LPRDOFRMFrame pFrame = PARSER->stack().pop<RDOFRMFrame>($1);
		ASSERT(pFrame);
		PTR(rdoRuntime::RDOFRMFrame::RDOFRMColor) pBgColor = reinterpret_cast<PTR(rdoRuntime::RDOFRMFrame::RDOFRMColor)>($4);
		if (pBgColor->getColorType() != rdoRuntime::RDOFRMFrame::RDOFRMColor::color_transparent && pBgColor->getColorType() != rdoRuntime::RDOFRMFrame::RDOFRMColor::color_rgb)
		{
			PARSER->error().error(@4, _T("���� ���� �� ����� ���� ������ ������� �� ��������� ��������"));
		}
		pFrame->frame()->setBackgroundColor(pBgColor);
		$$ = PARSER->stack().push(pFrame);
	}
	| frm_begin RDO_Back_picture '='
	{
		LPRDOFRMFrame pFrame = PARSER->stack().pop<RDOFRMFrame>($1);
		ASSERT(pFrame);
		$$ = PARSER->stack().push(pFrame);
	}
	| frm_begin RDO_Back_picture error
	{
		PARSER->error().error(@3, _T("����� ��������� ����� $Back_picture ��������� ���� ���������"));
	}
	| frm_begin error
	{
		PARSER->error().error(@2, _T("����� ����� ����� ��������� �������� ����� $Back_picture"));
	}
	;

frm_backpicture
	: frm_background RDO_IDENTIF
	{
		LPRDOFRMFrame pFrame = PARSER->stack().pop<RDOFRMFrame>($1);
		ASSERT(pFrame);
		pFrame->frame()->setBackPicture(P_RDOVALUE($2)->value().getIdentificator());
		$$ = PARSER->stack().push(pFrame);
	}
	| frm_background RDO_INT_CONST RDO_INT_CONST
	{
		LPRDOFRMFrame pFrame = PARSER->stack().pop<RDOFRMFrame>($1);
		ASSERT(pFrame);
		pFrame->frame()->setBackPicture(P_RDOVALUE($2)->value().getInt(), P_RDOVALUE($3)->value().getInt());
		$$ = PARSER->stack().push(pFrame);
	}
	| frm_background RDO_INT_CONST RDO_INT_CONST error
	{
		PARSER->error().error(@4, _T("�������� ��������� ����� ��������, ��������� �������� ����� $Show"));
	}
	| frm_background RDO_IDENTIF error
	{
		PARSER->error().error(@3, _T("�������� ��������� ����� ��������, ��������� �������� ����� $Show"));
	}
	| frm_background RDO_INT_CONST error
	{
		PARSER->error().error(@2, _T("����� ������ ����� ���������� ������� ��� ������"));
	}
	| frm_background
	{
		PARSER->error().error(@1, _T("���������� ������� ��� ������� �������� ��� ������ �����"));
	}
	;

frm_show
	: RDO_Show
	{
		LPRDOFRMFrame pFrame = PARSER->getLastFRMFrame();
		ASSERT(pFrame);
		pFrame->frame()->startShow();
	}
	| RDO_Show_if fun_logic
	{
		LPRDOFRMFrame pFrame = PARSER->getLastFRMFrame();
		pFrame->frame()->startShow(PARSER->stack().pop<RDOFUNLogic>($2)->getCalc());
	}
	| RDO_Show_if error
	{
		PARSER->error().error(@2, _T("������ � ���������� ���������"))
	}
	;

frm_item
	: /* empty */
	| frm_item frm_show
	| frm_item frm_text    {PARSER->getLastFRMFrame()->frame()->addItem (reinterpret_cast<PTR(rdoRuntime::RDOFRMText              )>($2));}
	| frm_item frm_bitmap  {PARSER->getLastFRMFrame()->frame()->addItem (reinterpret_cast<PTR(rdoRuntime::RDOFRMBitmap            )>($2));}
	| frm_item frm_rect    {PARSER->getLastFRMFrame()->frame()->addItem (reinterpret_cast<PTR(rdoRuntime::RDOFRMRect              )>($2));}
	| frm_item frm_line    {PARSER->getLastFRMFrame()->frame()->addItem (reinterpret_cast<PTR(rdoRuntime::RDOFRMLine              )>($2));}
	| frm_item frm_ellipse {PARSER->getLastFRMFrame()->frame()->addItem (reinterpret_cast<PTR(rdoRuntime::RDOFRMEllipse           )>($2));}
	| frm_item frm_r_rect  {PARSER->getLastFRMFrame()->frame()->addItem (reinterpret_cast<PTR(rdoRuntime::RDOFRMRectRound         )>($2));}
	| frm_item frm_triang  {PARSER->getLastFRMFrame()->frame()->addItem (reinterpret_cast<PTR(rdoRuntime::RDOFRMTriang            )>($2));}
	| frm_item frm_s_bmp   {PARSER->getLastFRMFrame()->frame()->addItem (reinterpret_cast<PTR(rdoRuntime::RDOFRMBitmapStretch     )>($2));}
	| frm_item frm_active  {PARSER->getLastFRMFrame()->frame()->addItem (reinterpret_cast<PTR(rdoRuntime::RDOFRMActive            )>($2));}
	| frm_item frm_ruler   {PARSER->getLastFRMFrame()->frame()->addRulet(reinterpret_cast<PTR(rdoRuntime::RDOFRMFrame::RDOFRMRulet)>($2));}
	| frm_item frm_space   {PARSER->getLastFRMFrame()->frame()->addItem (reinterpret_cast<PTR(rdoRuntime::RDOFRMSpace             )>($2));}
	;

frm_header
	: frm_backpicture frm_item
	;

frm_end
	: frm_header RDO_End
	;

// ----------------------------------------------------------------------------
// ---------- ��������
// ----------------------------------------------------------------------------
frm_color
	: RDO_color_transparent
	{
		$$ = (int)new rdoRuntime::RDOFRMFrame::RDOFRMColor(RUNTIME->lastFrame(), rdoRuntime::RDOFRMFrame::RDOFRMColor::color_transparent);
	}
	| RDO_color_last
	{
		$$ = (int)new rdoRuntime::RDOFRMFrame::RDOFRMColor(RUNTIME->lastFrame());
	}
	| RDO_color_white
	{
		$$ = (int)new rdoRuntime::RDOFRMFrame::RDOFRMColor(RUNTIME->lastFrame(), 255, 255, 255);
	}
	| RDO_color_black
	{
		$$ = (int)new rdoRuntime::RDOFRMFrame::RDOFRMColor(RUNTIME->lastFrame(), 0, 0, 0);
	}
	| RDO_color_red
	{
		$$ = (int)new rdoRuntime::RDOFRMFrame::RDOFRMColor(RUNTIME->lastFrame(), 255, 0, 0);
	}
	| RDO_color_green
	{
		$$ = (int)new rdoRuntime::RDOFRMFrame::RDOFRMColor(RUNTIME->lastFrame(), 0, 255, 0);
	}
	| RDO_color_blue
	{
		$$ = (int)new rdoRuntime::RDOFRMFrame::RDOFRMColor(RUNTIME->lastFrame(), 0, 0, 255);
	}
	| RDO_color_cyan
	{
		$$ = (int)new rdoRuntime::RDOFRMFrame::RDOFRMColor(RUNTIME->lastFrame(), 0, 255, 255);
	}
	| RDO_color_magenta
	{
		$$ = (int)new rdoRuntime::RDOFRMFrame::RDOFRMColor(RUNTIME->lastFrame(), 255, 0, 255);
	}
	| RDO_color_yellow
	{
		$$ = (int)new rdoRuntime::RDOFRMFrame::RDOFRMColor(RUNTIME->lastFrame(), 255, 255, 0);
	}
	| RDO_color_gray
	{
		$$ = (int)new rdoRuntime::RDOFRMFrame::RDOFRMColor(RUNTIME->lastFrame(), 127, 127, 127);
	}
	| '<' RDO_INT_CONST RDO_INT_CONST RDO_INT_CONST '>'
	{
		LPRDOFUNArithm pRed   = rdo::Factory<RDOFUNArithm>::create(RDOVALUE($2));
		LPRDOFUNArithm pGreen = rdo::Factory<RDOFUNArithm>::create(RDOVALUE($3));
		LPRDOFUNArithm pBlue  = rdo::Factory<RDOFUNArithm>::create(RDOVALUE($4));
		LPRDOTypeRangeRange pRange    = rdo::Factory<RDOTypeRangeRange>::create(RDOValue(0), RDOValue(255), RDOParserSrcInfo());
		LPRDOTypeIntRange   pIntRange = rdo::Factory<RDOTypeIntRange>::create(pRange);
		LPRDOTypeParam      pType     = rdo::Factory<RDOTypeParam>::create(pIntRange, RDOValue(0), RDOParserSrcInfo());
		pRed->checkParamType  (pType);
		pGreen->checkParamType(pType);
		pBlue->checkParamType (pType);
		$$ = (int)new rdoRuntime::RDOFRMFrame::RDOFRMColor(RUNTIME->lastFrame(), pRed->createCalc(), pGreen->createCalc(), pBlue->createCalc());
	}
	| '<' RDO_INT_CONST RDO_INT_CONST RDO_INT_CONST error
	{
		PARSER->error().error(@4, _T("������� ��� ������������ �����, ��������� '>'"));
	}
	| '<' RDO_INT_CONST RDO_INT_CONST error
	{
		PARSER->error().error(@3, @4, _T("��������� ����� ������������ �����"));
	}
	| '<' RDO_INT_CONST error
	{
		PARSER->error().error(@2, @3, _T("��������� ������� ������������ �����"));
	}
	| '<' fun_arithm ',' fun_arithm ',' fun_arithm '>'
	{
		LPRDOFUNArithm pRed   = PARSER->stack().pop<RDOFUNArithm>($2);
		LPRDOFUNArithm pGreen = PARSER->stack().pop<RDOFUNArithm>($4);
		LPRDOFUNArithm pBlue  = PARSER->stack().pop<RDOFUNArithm>($6);
		LPRDOTypeRangeRange pRange    = rdo::Factory<RDOTypeRangeRange>::create(RDOValue(0), RDOValue(255), RDOParserSrcInfo());
		LPRDOTypeIntRange   pIntRange = rdo::Factory<RDOTypeIntRange>::create(pRange);
		LPRDOTypeParam      pType     = rdo::Factory<RDOTypeParam>::create(pIntRange, RDOValue(0), RDOParserSrcInfo());
		pRed->checkParamType  (pType);
		pGreen->checkParamType(pType);
		pBlue->checkParamType (pType);
		$$ = (int)new rdoRuntime::RDOFRMFrame::RDOFRMColor(RUNTIME->lastFrame(), pRed->createCalc(), pGreen->createCalc(), pBlue->createCalc());
	}
	| '<' fun_arithm ',' fun_arithm ',' fun_arithm error
	{
		PARSER->error().error(@6, _T("������� ��� ������������ �����, ��������� '>'"));
	}
	| '<' fun_arithm ',' fun_arithm ',' error
	{
		PARSER->error().error(@5, @6, _T("��������� ����� ������������ �����"));
	}
	| '<' fun_arithm ',' fun_arithm error
	{
		PARSER->error().error(@4, _T("����� ������� ������������ ����� ��������� �������"));
	}
	| '<' fun_arithm ',' error
	{
		PARSER->error().error(@3, @4, _T("��������� ������� ������������ �����"));
	}
	| '<' fun_arithm error
	{
		PARSER->error().error(@2, _T("����� ������� ������������ ����� ��������� �������"));
	}
	| '<' error
	{
		PARSER->error().error(@1, _T("����� '<' ��������� ������� ������������ �����"));
	}
	;

frm_postype
	: /* empty */
	{
		$$ = rdoRuntime::RDOFRMFrame::RDOFRMPosition::absolute;
	}
	| '+'           
	{
		$$ = rdoRuntime::RDOFRMFrame::RDOFRMPosition::delta;
	}
	| '*'
	{
		$$ = rdoRuntime::RDOFRMFrame::RDOFRMPosition::mult;
	}
	| '#' RDO_INT_CONST
	{
		int rilet_id = P_RDOVALUE($2)->value().getInt();
		if (rilet_id <= 0)
		{
			PARSER->error().error(@2, _T("����� ������� ������ ���� ������ ����"));
		}
		if (!RUNTIME->lastFrame()->findRulet(rilet_id))
		{
			PARSER->error().error(@2, rdo::format(_T("������� � ������� '%d' �� ����������"), rilet_id));
		}
		$$ = rdoRuntime::RDOFRMFrame::RDOFRMPosition::rulet + rilet_id;
	}
	| '#' error
	{
		PARSER->error().error(@1, _T("����� '#' ��������� ������������� ����� �������"));
	}
	;

frm_postype_xy
	: frm_postype
	| '='
	{
		$$ = rdoRuntime::RDOFRMFrame::RDOFRMPosition::gabarit;
	}
	;

frm_postype_wh
	: frm_postype;
	| '='
	{
		PARSER->error().error(@1, _T("������ ������������ ������ ������������ ��� ������ ��� ������"));
	}
	;

frm_position_xy
	: fun_arithm frm_postype_xy 
	{
		rdoRuntime::LPRDOCalc pCalc = PARSER->stack().pop<RDOFUNArithm>($1)->createCalc();
		if ($2 >= rdoRuntime::RDOFRMFrame::RDOFRMPosition::rulet)
		{
			$$ = (int)new rdoRuntime::RDOFRMFrame::RDOFRMPosition(RUNTIME->lastFrame(), pCalc, rdoRuntime::RDOFRMFrame::RDOFRMPosition::rulet, $2 - rdoRuntime::RDOFRMFrame::RDOFRMPosition::rulet);
		}
		else
		{
			$$ = (int)new rdoRuntime::RDOFRMFrame::RDOFRMPosition(RUNTIME->lastFrame(), pCalc, (rdoRuntime::RDOFRMFrame::RDOFRMPosition::PositionType)$2);
		}
	}
	;

frm_position_wh
	: fun_arithm frm_postype_wh
	{
		rdoRuntime::LPRDOCalc pCalc = PARSER->stack().pop<RDOFUNArithm>($1)->createCalc();
		if ($2 >= rdoRuntime::RDOFRMFrame::RDOFRMPosition::rulet)
		{
			$$ = (int)new rdoRuntime::RDOFRMFrame::RDOFRMPosition(RUNTIME->lastFrame(), pCalc, rdoRuntime::RDOFRMFrame::RDOFRMPosition::rulet, $2 - rdoRuntime::RDOFRMFrame::RDOFRMPosition::rulet);
		}
		else
		{
			$$ = (int)new rdoRuntime::RDOFRMFrame::RDOFRMPosition(RUNTIME->lastFrame(), pCalc, (rdoRuntime::RDOFRMFrame::RDOFRMPosition::PositionType)$2);
		}
	}
	;

frm_ruler
	: RDO_ruler '[' RDO_INT_CONST ',' frm_position_xy ',' frm_position_xy ']'
	{
		CPTR(rdoRuntime::RDOFRMFrame::RDOFRMRulet) pRulet = RUNTIME->lastFrame()->findRulet(P_RDOVALUE($3)->value().getInt());
		if (pRulet)
		{
			PARSER->error().push_only(@3, rdo::format(_T("������� � ������� '%d' ��� ����������"), P_RDOVALUE($3)->value().getInt()));
			PARSER->error().push_only(pRulet->src_info(), _T("��. ������ �����������"));
			PARSER->error().push_done();
		}
		PTR(rdoRuntime::RDOFRMFrame::RDOFRMPosition) x = reinterpret_cast<PTR(rdoRuntime::RDOFRMFrame::RDOFRMPosition)>($5);
		PTR(rdoRuntime::RDOFRMFrame::RDOFRMPosition) y = reinterpret_cast<PTR(rdoRuntime::RDOFRMFrame::RDOFRMPosition)>($7);
		if (x->type != rdoRuntime::RDOFRMFrame::RDOFRMPosition::absolute)
		{
			PARSER->error().error(@5, _T("��������� ������� ������ ���� �����������"));
		}
		if (y->type != rdoRuntime::RDOFRMFrame::RDOFRMPosition::absolute)
		{
			PARSER->error().error(@7, _T("��������� ������� ������ ���� �����������"));
		}
		$$ = (int)new rdoRuntime::RDOFRMFrame::RDOFRMRulet(RDOParserSrcInfo(@1), P_RDOVALUE($3)->value().getInt(), x, y);
	}
	| RDO_ruler '[' RDO_INT_CONST ',' frm_position_xy ',' frm_position_xy error
	{
		PARSER->error().error(@7, _T("��������� ']'"));
	}
	| RDO_ruler '[' RDO_INT_CONST ',' frm_position_xy ',' error
	{
		PARSER->error().error(@6, @7, _T("��������� ���������� �� ��� Y"));
	}
	| RDO_ruler '[' RDO_INT_CONST ',' frm_position_xy error
	{
		PARSER->error().error(@5, _T("��������� �������"));
	}
	| RDO_ruler '[' RDO_INT_CONST ',' error
	{
		PARSER->error().error(@4, @5, _T("��������� ���������� �� ��� X"));
	}
	| RDO_ruler '[' RDO_INT_CONST error
	{
		PARSER->error().error(@3, _T("��������� �������"));
	}
	| RDO_ruler '[' error
	{
		PARSER->error().error(@2, @3, _T("��������� ����� �������"));
	}
	| RDO_ruler error
	{
		PARSER->error().error(@1, _T("��������� '['"));
	}
	;

frm_space
	: RDO_space '[' frm_position_xy ',' frm_position_xy ',' frm_position_wh ',' frm_position_wh ']'
	{
		PTR(rdoRuntime::RDOFRMFrame::RDOFRMPosition) x      = reinterpret_cast<PTR(rdoRuntime::RDOFRMFrame::RDOFRMPosition)>($3);
		PTR(rdoRuntime::RDOFRMFrame::RDOFRMPosition) y      = reinterpret_cast<PTR(rdoRuntime::RDOFRMFrame::RDOFRMPosition)>($5);
		PTR(rdoRuntime::RDOFRMFrame::RDOFRMPosition) width  = reinterpret_cast<PTR(rdoRuntime::RDOFRMFrame::RDOFRMPosition)>($7);
		PTR(rdoRuntime::RDOFRMFrame::RDOFRMPosition) height = reinterpret_cast<PTR(rdoRuntime::RDOFRMFrame::RDOFRMPosition)>($9);
		$$ = (int)new rdoRuntime::RDOFRMSpace(RUNTIME->lastFrame(), x, y, width, height);
	}
	| RDO_space '[' frm_position_xy ',' frm_position_xy ',' frm_position_wh ',' frm_position_wh error
	{
		PARSER->error().error(@9, _T("��������� ']'"));
	}
	| RDO_space '[' frm_position_xy ',' frm_position_xy ',' frm_position_wh ',' error
	{
		PARSER->error().error(@8, @9, _T("��������� ������"));
	}
	| RDO_space '[' frm_position_xy ',' frm_position_xy ',' frm_position_wh error
	{
		PARSER->error().error(@7, _T("��������� �������"));
	}
	| RDO_space '[' frm_position_xy ',' frm_position_xy ',' error
	{
		PARSER->error().error(@6, @7, _T("��������� ������"));
	}
	| RDO_space '[' frm_position_xy ',' frm_position_xy error
	{
		PARSER->error().error(@5, _T("��������� �������"));
	}
	| RDO_space '[' frm_position_xy ',' error
	{
		PARSER->error().error(@4, @5, _T("��������� ���������� �� ��� Y"));
	}
	| RDO_space '[' frm_position_xy error
	{
		PARSER->error().error(@3, _T("��������� �������"));
	}
	| RDO_space '[' error
	{
		PARSER->error().error(@2, @3, _T("��������� ���������� �� ��� X"));
	}
	| RDO_space error
	{
		PARSER->error().error(@1, _T("��������� '['"));
	}
	;

frm_text_align
	: /* empty */ {$$ = rdoAnimation::RDOTextElement::TETA_LEFT;  }
	| '<'         {$$ = rdoAnimation::RDOTextElement::TETA_LEFT;  }
	| '='         {$$ = rdoAnimation::RDOTextElement::TETA_CENTER;}
	| '>'         {$$ = rdoAnimation::RDOTextElement::TETA_RIGHT; }
	;

frm_text_common
	: RDO_text '[' frm_position_xy ',' frm_position_xy ',' frm_position_wh ',' frm_position_wh ',' frm_color ',' frm_color ','
	{
		PTR(rdoRuntime::RDOFRMFrame::RDOFRMPosition) x      = reinterpret_cast<PTR(rdoRuntime::RDOFRMFrame::RDOFRMPosition)>($3);
		PTR(rdoRuntime::RDOFRMFrame::RDOFRMPosition) y      = reinterpret_cast<PTR(rdoRuntime::RDOFRMFrame::RDOFRMPosition)>($5);
		PTR(rdoRuntime::RDOFRMFrame::RDOFRMPosition) width  = reinterpret_cast<PTR(rdoRuntime::RDOFRMFrame::RDOFRMPosition)>($7);
		PTR(rdoRuntime::RDOFRMFrame::RDOFRMPosition) height = reinterpret_cast<PTR(rdoRuntime::RDOFRMFrame::RDOFRMPosition)>($9);
		PTR(rdoRuntime::RDOFRMFrame::RDOFRMColor) pBgColor  = reinterpret_cast<PTR(rdoRuntime::RDOFRMFrame::RDOFRMColor)>($11);
		PTR(rdoRuntime::RDOFRMFrame::RDOFRMColor) pFgColor  = reinterpret_cast<PTR(rdoRuntime::RDOFRMFrame::RDOFRMColor)>($13);
		pBgColor->setColorType(rdoRuntime::RDOFRMFrame::RDOFRMColor::color_last_bg_text);
		pFgColor->setColorType(rdoRuntime::RDOFRMFrame::RDOFRMColor::color_last_fg_text);
		$$ = (int)new rdoRuntime::RDOFRMText(RUNTIME->lastFrame(), x, y, width, height, pBgColor, pFgColor);
	}
/*
	| RDO_text '[' frm_position_xy ',' frm_position_xy ',' frm_position_wh ',' frm_position_wh ',' frm_color ','
	{
		PTR(rdoRuntime::RDOFRMFrame::RDOFRMPosition) x      = reinterpret_cast<PTR(rdoRuntime::RDOFRMFrame::RDOFRMPosition)>($3);
		PTR(rdoRuntime::RDOFRMFrame::RDOFRMPosition) y      = reinterpret_cast<PTR(rdoRuntime::RDOFRMFrame::RDOFRMPosition)>($5);
		PTR(rdoRuntime::RDOFRMFrame::RDOFRMPosition) width  = reinterpret_cast<PTR(rdoRuntime::RDOFRMFrame::RDOFRMPosition)>($7);
		PTR(rdoRuntime::RDOFRMFrame::RDOFRMPosition) height = reinterpret_cast<PTR(rdoRuntime::RDOFRMFrame::RDOFRMPosition)>($9);
		PTR(rdoRuntime::RDOFRMFrame::RDOFRMColor) pBgColor = new rdoRuntime::RDOFRMFrame::RDOFRMColor(RUNTIME->lastFrame());
		PTR(rdoRuntime::RDOFRMFrame::RDOFRMColor) pFgColor = reinterpret_cast<PTR(rdoRuntime::RDOFRMFrame::RDOFRMColor)>($11);
		pBgColor->setColorType(rdoRuntime::RDOFRMFrame::RDOFRMColor::color_last_bg_text);
		pFgColor->setColorType(rdoRuntime::RDOFRMFrame::RDOFRMColor::color_last_fg_text);
		$$ = (int)new rdoRuntime::RDOFRMText(RUNTIME->lastFrame(), x, y, width, height, pBgColor, pFgColor);
	}
	| RDO_text '[' frm_position_xy ',' frm_position_xy ',' frm_position_wh ',' frm_position_wh ','
	{
		PTR(rdoRuntime::RDOFRMFrame::RDOFRMPosition) x      = reinterpret_cast<PTR(rdoRuntime::RDOFRMFrame::RDOFRMPosition)>($3);
		PTR(rdoRuntime::RDOFRMFrame::RDOFRMPosition) y      = reinterpret_cast<PTR(rdoRuntime::RDOFRMFrame::RDOFRMPosition)>($5);
		PTR(rdoRuntime::RDOFRMFrame::RDOFRMPosition) width  = reinterpret_cast<PTR(rdoRuntime::RDOFRMFrame::RDOFRMPosition)>($7);
		PTR(rdoRuntime::RDOFRMFrame::RDOFRMPosition) height = reinterpret_cast<PTR(rdoRuntime::RDOFRMFrame::RDOFRMPosition)>($9);
		PTR(rdoRuntime::RDOFRMFrame::RDOFRMColor) pBgColor = new rdoRuntime::RDOFRMFrame::RDOFRMColor(RUNTIME->lastFrame());
		PTR(rdoRuntime::RDOFRMFrame::RDOFRMColor) pFgColor = new rdoRuntime::RDOFRMFrame::RDOFRMColor(RUNTIME->lastFrame());
		pBgColor->setColorType(rdoRuntime::RDOFRMFrame::RDOFRMColor::color_last_bg_text);
		pFgColor->setColorType(rdoRuntime::RDOFRMFrame::RDOFRMColor::color_last_fg_text);
		$$ = (int)new rdoRuntime::RDOFRMText(RUNTIME->lastFrame(), x, y, width, height, pBgColor, pFgColor);
	}
*/
	| RDO_text '[' frm_position_xy ',' frm_position_xy ',' frm_position_wh ',' frm_position_wh ',' frm_color ',' frm_color error
	{
		PARSER->error().error(@13, _T("��������� �������"));
	}
	| RDO_text '[' frm_position_xy ',' frm_position_xy ',' frm_position_wh ',' frm_position_wh ',' frm_color ',' error
	{
		PARSER->error().error(@12, @13, _T("��������� ���� ������"));
	}
	| RDO_text '[' frm_position_xy ',' frm_position_xy ',' frm_position_wh ',' frm_position_wh ',' frm_color error
	{
		PARSER->error().error(@11, _T("��������� �������"));
	}
	| RDO_text '[' frm_position_xy ',' frm_position_xy ',' frm_position_wh ',' frm_position_wh ',' error
	{
		PARSER->error().error(@10, @11, _T("��������� ���� ����"));
	}
	| RDO_text '[' frm_position_xy ',' frm_position_xy ',' frm_position_wh ',' frm_position_wh error
	{
		PARSER->error().error(@9, _T("��������� �������"));
	}
	| RDO_text '[' frm_position_xy ',' frm_position_xy ',' frm_position_wh ',' error
	{
		PARSER->error().error(@8, @9, _T("��������� ������"));
	}
	| RDO_text '[' frm_position_xy ',' frm_position_xy ',' frm_position_wh error
	{
		PARSER->error().error(@7, _T("��������� �������"));
	}
	| RDO_text '[' frm_position_xy ',' frm_position_xy ',' error
	{
		PARSER->error().error(@6, @7, _T("��������� ������"));
	}
	| RDO_text '[' frm_position_xy ',' frm_position_xy error
	{
		PARSER->error().error(@5, _T("��������� �������"));
	}
	| RDO_text '[' frm_position_xy ',' error
	{
		PARSER->error().error(@4, @5, _T("��������� ���������� �� ��� Y"));
	}
	| RDO_text '[' frm_position_xy error
	{
		PARSER->error().error(@3, _T("��������� �������"));
	}
	| RDO_text '[' error
	{
		PARSER->error().error(@2, @3, _T("��������� ���������� �� ��� X"));
	}
	| RDO_text error
	{
		PARSER->error().error(@1, _T("��������� '['"));
	}
	;

frm_text
	: frm_text_common frm_text_align fun_arithm ']'
	{
		reinterpret_cast<PTR(rdoRuntime::RDOFRMText)>($1)->setText((rdoAnimation::RDOTextElement::TextAlign)$2, PARSER->stack().pop<RDOFUNArithm>($3)->createCalc());
	}
	| frm_text_common frm_text_align RDO_STRING_CONST ']'
	{
		reinterpret_cast<PTR(rdoRuntime::RDOFRMText)>($1)->setText((rdoAnimation::RDOTextElement::TextAlign)$2, P_RDOVALUE($3)->value().getString());
	}
	| frm_text_common frm_text_align fun_arithm error
	{
		PARSER->error().error(@3, _T("��������� ']'"));
	}
	| frm_text_common frm_text_align RDO_STRING_CONST error
	{
		PARSER->error().error(@3, _T("��������� ']'"));
	}
	| frm_text_common frm_text_align error
	{
		PARSER->error().error(@2, _T("��������� �������� ������� ��� ������"));
	}
	;

frm_bitmap
	: RDO_bitmap '[' frm_position_xy ',' frm_position_xy ',' RDO_IDENTIF ']'
	{
		PTR(rdoRuntime::RDOFRMFrame::RDOFRMPosition) x = reinterpret_cast<PTR(rdoRuntime::RDOFRMFrame::RDOFRMPosition)>($3);
		PTR(rdoRuntime::RDOFRMFrame::RDOFRMPosition) y = reinterpret_cast<PTR(rdoRuntime::RDOFRMFrame::RDOFRMPosition)>($5);
		$$ = (int)new rdoRuntime::RDOFRMBitmap(RUNTIME->lastFrame(), x, y, P_RDOVALUE($7)->value().getIdentificator());
	}
	| RDO_bitmap '[' frm_position_xy ',' frm_position_xy ',' RDO_IDENTIF ',' RDO_IDENTIF ']'
	{
		PTR(rdoRuntime::RDOFRMFrame::RDOFRMPosition) x = reinterpret_cast<PTR(rdoRuntime::RDOFRMFrame::RDOFRMPosition)>($3);
		PTR(rdoRuntime::RDOFRMFrame::RDOFRMPosition) y = reinterpret_cast<PTR(rdoRuntime::RDOFRMFrame::RDOFRMPosition)>($5);
		$$ = (int)new rdoRuntime::RDOFRMBitmap(RUNTIME->lastFrame(), x, y, P_RDOVALUE($7)->value().getIdentificator(), P_RDOVALUE($9)->value().getIdentificator());
	}
	| RDO_bitmap '[' frm_position_xy ',' frm_position_xy ',' RDO_IDENTIF ',' RDO_IDENTIF error
	{
		PARSER->error().error(@9, _T("��������� ']'"));
	}
	| RDO_bitmap '[' frm_position_xy ',' frm_position_xy ',' RDO_IDENTIF ',' error
	{
		PARSER->error().error(@8, @9, _T("��������� ��� ����� ��� ��������"));
	}
	| RDO_bitmap '[' frm_position_xy ',' frm_position_xy ',' RDO_IDENTIF error
	{
		PARSER->error().error(@7, _T("��������� ']'"));
	}
	| RDO_bitmap '[' frm_position_xy ',' frm_position_xy ',' error
	{
		PARSER->error().error(@6, @7, _T("��������� ��� ��������"));
	}
	| RDO_bitmap '[' frm_position_xy ',' frm_position_xy error
	{
		PARSER->error().error(@5, _T("��������� �������"));
	}
	| RDO_bitmap '[' frm_position_xy ',' error
	{
		PARSER->error().error(@4, @5, _T("��������� ���������� �� ��� Y"));
	}
	| RDO_bitmap '[' frm_position_xy error
	{
		PARSER->error().error(@3, _T("��������� �������"));
	}
	| RDO_bitmap '[' error
	{
		PARSER->error().error(@2, @3, _T("��������� ���������� �� ��� X"));
	}
	| RDO_bitmap error
	{
		PARSER->error().error(@1, _T("��������� '['"));
	}
	;

frm_s_bmp
	: RDO_s_bmp '[' frm_position_xy ',' frm_position_xy ',' frm_position_wh ',' frm_position_wh ',' RDO_IDENTIF ']'
	{
		PTR(rdoRuntime::RDOFRMFrame::RDOFRMPosition) x      = reinterpret_cast<PTR(rdoRuntime::RDOFRMFrame::RDOFRMPosition)>($3);
		PTR(rdoRuntime::RDOFRMFrame::RDOFRMPosition) y      = reinterpret_cast<PTR(rdoRuntime::RDOFRMFrame::RDOFRMPosition)>($5);
		PTR(rdoRuntime::RDOFRMFrame::RDOFRMPosition) width  = reinterpret_cast<PTR(rdoRuntime::RDOFRMFrame::RDOFRMPosition)>($7);
		PTR(rdoRuntime::RDOFRMFrame::RDOFRMPosition) height = reinterpret_cast<PTR(rdoRuntime::RDOFRMFrame::RDOFRMPosition)>($9);
		$$ = (int)new rdoRuntime::RDOFRMBitmapStretch(RUNTIME->lastFrame(), x, y, width, height, P_RDOVALUE($11)->value().getIdentificator());
	}
	| RDO_s_bmp '[' frm_position_xy ',' frm_position_xy ',' frm_position_wh ',' frm_position_wh ',' RDO_IDENTIF ',' RDO_IDENTIF ']'
	{
		PTR(rdoRuntime::RDOFRMFrame::RDOFRMPosition) x      = reinterpret_cast<PTR(rdoRuntime::RDOFRMFrame::RDOFRMPosition)>($3);
		PTR(rdoRuntime::RDOFRMFrame::RDOFRMPosition) y      = reinterpret_cast<PTR(rdoRuntime::RDOFRMFrame::RDOFRMPosition)>($5);
		PTR(rdoRuntime::RDOFRMFrame::RDOFRMPosition) width  = reinterpret_cast<PTR(rdoRuntime::RDOFRMFrame::RDOFRMPosition)>($7);
		PTR(rdoRuntime::RDOFRMFrame::RDOFRMPosition) height = reinterpret_cast<PTR(rdoRuntime::RDOFRMFrame::RDOFRMPosition)>($9);
		$$ = (int)new rdoRuntime::RDOFRMBitmapStretch(RUNTIME->lastFrame(), x, y, width, height, P_RDOVALUE($11)->value().getIdentificator(), P_RDOVALUE($13)->value().getIdentificator());
	}
	| RDO_s_bmp '[' frm_position_xy ',' frm_position_xy ',' frm_position_wh ',' frm_position_wh ',' RDO_IDENTIF ',' RDO_IDENTIF error
	{
		PARSER->error().error(@13, _T("��������� ']'"));
	}
	| RDO_s_bmp '[' frm_position_xy ',' frm_position_xy ',' frm_position_wh ',' frm_position_wh ',' RDO_IDENTIF ',' error
	{
		PARSER->error().error(@12, @13, _T("��������� ��� ����� ��� ��������"));
	}
	| RDO_s_bmp '[' frm_position_xy ',' frm_position_xy ',' frm_position_wh ',' frm_position_wh ',' RDO_IDENTIF error
	{
		PARSER->error().error(@11, _T("��������� ']'"));
	}
	| RDO_s_bmp '[' frm_position_xy ',' frm_position_xy ',' frm_position_wh ',' frm_position_wh ',' error
	{
		PARSER->error().error(@10, @11, _T("��������� ��� ��������"));
	}
	| RDO_s_bmp '[' frm_position_xy ',' frm_position_xy ',' frm_position_wh ',' frm_position_wh error
	{
		PARSER->error().error(@9, _T("��������� �������"));
	}
	| RDO_s_bmp '[' frm_position_xy ',' frm_position_xy ',' frm_position_wh ',' error
	{
		PARSER->error().error(@8, @9, _T("��������� ������"));
	}
	| RDO_s_bmp '[' frm_position_xy ',' frm_position_xy ',' frm_position_wh error
	{
		PARSER->error().error(@7, _T("��������� �������"));
	}
	| RDO_s_bmp '[' frm_position_xy ',' frm_position_xy ',' error
	{
		PARSER->error().error(@6, @7, _T("��������� ������"));
	}
	| RDO_s_bmp '[' frm_position_xy ',' frm_position_xy error
	{
		PARSER->error().error(@5, _T("��������� �������"));
	}
	| RDO_s_bmp '[' frm_position_xy ',' error
	{
		PARSER->error().error(@4, @5, _T("��������� ���������� �� ��� Y"));
	}
	| RDO_s_bmp '[' frm_position_xy error
	{
		PARSER->error().error(@3, _T("��������� �������"));
	}
	| RDO_s_bmp '[' error
	{
		PARSER->error().error(@2, @3, _T("��������� ���������� �� ��� X"));
	}
	| RDO_s_bmp error
	{
		PARSER->error().error(@1, _T("��������� '['"));
	}
	;

frm_rect
	: RDO_rect '[' frm_position_xy ',' frm_position_xy ',' frm_position_wh ',' frm_position_wh ',' frm_color ',' frm_color ']'
	{
		PTR(rdoRuntime::RDOFRMFrame::RDOFRMPosition) x      = reinterpret_cast<PTR(rdoRuntime::RDOFRMFrame::RDOFRMPosition)>($3);
		PTR(rdoRuntime::RDOFRMFrame::RDOFRMPosition) y      = reinterpret_cast<PTR(rdoRuntime::RDOFRMFrame::RDOFRMPosition)>($5);
		PTR(rdoRuntime::RDOFRMFrame::RDOFRMPosition) width  = reinterpret_cast<PTR(rdoRuntime::RDOFRMFrame::RDOFRMPosition)>($7);
		PTR(rdoRuntime::RDOFRMFrame::RDOFRMPosition) height = reinterpret_cast<PTR(rdoRuntime::RDOFRMFrame::RDOFRMPosition)>($9);
		PTR(rdoRuntime::RDOFRMFrame::RDOFRMColor) pBgColor  = reinterpret_cast<PTR(rdoRuntime::RDOFRMFrame::RDOFRMColor)>($11);
		PTR(rdoRuntime::RDOFRMFrame::RDOFRMColor) pFgColor  = reinterpret_cast<PTR(rdoRuntime::RDOFRMFrame::RDOFRMColor)>($13);
		pBgColor->setColorType(rdoRuntime::RDOFRMFrame::RDOFRMColor::color_last_bg);
		pFgColor->setColorType(rdoRuntime::RDOFRMFrame::RDOFRMColor::color_last_fg);
		$$ = (int)new rdoRuntime::RDOFRMRect(RUNTIME->lastFrame(), x, y, width, height, pBgColor, pFgColor);
	}
	| RDO_rect '[' frm_position_xy ',' frm_position_xy ',' frm_position_wh ',' frm_position_wh ',' frm_color ']'
	{
		PTR(rdoRuntime::RDOFRMFrame::RDOFRMPosition) x      = reinterpret_cast<PTR(rdoRuntime::RDOFRMFrame::RDOFRMPosition)>($3);
		PTR(rdoRuntime::RDOFRMFrame::RDOFRMPosition) y      = reinterpret_cast<PTR(rdoRuntime::RDOFRMFrame::RDOFRMPosition)>($5);
		PTR(rdoRuntime::RDOFRMFrame::RDOFRMPosition) width  = reinterpret_cast<PTR(rdoRuntime::RDOFRMFrame::RDOFRMPosition)>($7);
		PTR(rdoRuntime::RDOFRMFrame::RDOFRMPosition) height = reinterpret_cast<PTR(rdoRuntime::RDOFRMFrame::RDOFRMPosition)>($9);
		PTR(rdoRuntime::RDOFRMFrame::RDOFRMColor) pBgColor  = reinterpret_cast<PTR(rdoRuntime::RDOFRMFrame::RDOFRMColor)>($11);
		PTR(rdoRuntime::RDOFRMFrame::RDOFRMColor) pFgColor  = new rdoRuntime::RDOFRMFrame::RDOFRMColor(RUNTIME->lastFrame());
		pBgColor->setColorType(rdoRuntime::RDOFRMFrame::RDOFRMColor::color_last_bg);
		pFgColor->setColorType(rdoRuntime::RDOFRMFrame::RDOFRMColor::color_last_fg);
		$$ = (int)new rdoRuntime::RDOFRMRect(RUNTIME->lastFrame(), x, y, width, height, pBgColor, pFgColor);
	}
	| RDO_rect '[' frm_position_xy ',' frm_position_xy ',' frm_position_wh ',' frm_position_wh ']'
	{
		PTR(rdoRuntime::RDOFRMFrame::RDOFRMPosition) x      = reinterpret_cast<PTR(rdoRuntime::RDOFRMFrame::RDOFRMPosition)>($3);
		PTR(rdoRuntime::RDOFRMFrame::RDOFRMPosition) y      = reinterpret_cast<PTR(rdoRuntime::RDOFRMFrame::RDOFRMPosition)>($5);
		PTR(rdoRuntime::RDOFRMFrame::RDOFRMPosition) width  = reinterpret_cast<PTR(rdoRuntime::RDOFRMFrame::RDOFRMPosition)>($7);
		PTR(rdoRuntime::RDOFRMFrame::RDOFRMPosition) height = reinterpret_cast<PTR(rdoRuntime::RDOFRMFrame::RDOFRMPosition)>($9);
		PTR(rdoRuntime::RDOFRMFrame::RDOFRMColor) pBgColor  = new rdoRuntime::RDOFRMFrame::RDOFRMColor(RUNTIME->lastFrame());
		PTR(rdoRuntime::RDOFRMFrame::RDOFRMColor) pFgColor  = new rdoRuntime::RDOFRMFrame::RDOFRMColor(RUNTIME->lastFrame());
		pBgColor->setColorType(rdoRuntime::RDOFRMFrame::RDOFRMColor::color_last_bg);
		pFgColor->setColorType(rdoRuntime::RDOFRMFrame::RDOFRMColor::color_last_fg);
		$$ = (int)new rdoRuntime::RDOFRMRect(RUNTIME->lastFrame(), x, y, width, height, pBgColor, pFgColor);
	}
	| RDO_rect '[' frm_position_xy ',' frm_position_xy ',' frm_position_wh ']'
	{
		PTR(rdoRuntime::RDOFRMFrame::RDOFRMPosition) x      = reinterpret_cast<PTR(rdoRuntime::RDOFRMFrame::RDOFRMPosition)>($3);
		PTR(rdoRuntime::RDOFRMFrame::RDOFRMPosition) y      = reinterpret_cast<PTR(rdoRuntime::RDOFRMFrame::RDOFRMPosition)>($5);
		PTR(rdoRuntime::RDOFRMFrame::RDOFRMPosition) width  = reinterpret_cast<PTR(rdoRuntime::RDOFRMFrame::RDOFRMPosition)>($7);
		PTR(rdoRuntime::RDOFRMFrame::RDOFRMPosition) height = new rdoRuntime::RDOFRMFrame::RDOFRMPosition(RUNTIME->lastFrame(), rdo::Factory<rdoRuntime::RDOCalcConst>::create(0), rdoRuntime::RDOFRMFrame::RDOFRMPosition::delta);
		PTR(rdoRuntime::RDOFRMFrame::RDOFRMColor) pBgColor  = new rdoRuntime::RDOFRMFrame::RDOFRMColor(RUNTIME->lastFrame());
		PTR(rdoRuntime::RDOFRMFrame::RDOFRMColor) pFgColor  = new rdoRuntime::RDOFRMFrame::RDOFRMColor(RUNTIME->lastFrame());
		pBgColor->setColorType(rdoRuntime::RDOFRMFrame::RDOFRMColor::color_last_bg);
		pFgColor->setColorType(rdoRuntime::RDOFRMFrame::RDOFRMColor::color_last_fg);
		$$ = (int)new rdoRuntime::RDOFRMRect(RUNTIME->lastFrame(), x, y, width, height, pBgColor, pFgColor);
	}
	| RDO_rect '[' frm_position_xy ',' frm_position_xy ']'
	{
		PTR(rdoRuntime::RDOFRMFrame::RDOFRMPosition) x      = reinterpret_cast<PTR(rdoRuntime::RDOFRMFrame::RDOFRMPosition)>($3);
		PTR(rdoRuntime::RDOFRMFrame::RDOFRMPosition) y      = reinterpret_cast<PTR(rdoRuntime::RDOFRMFrame::RDOFRMPosition)>($5);
		PTR(rdoRuntime::RDOFRMFrame::RDOFRMPosition) width  = new rdoRuntime::RDOFRMFrame::RDOFRMPosition(RUNTIME->lastFrame(), rdo::Factory<rdoRuntime::RDOCalcConst>::create(0), rdoRuntime::RDOFRMFrame::RDOFRMPosition::delta);
		PTR(rdoRuntime::RDOFRMFrame::RDOFRMPosition) height = new rdoRuntime::RDOFRMFrame::RDOFRMPosition(RUNTIME->lastFrame(), rdo::Factory<rdoRuntime::RDOCalcConst>::create(0), rdoRuntime::RDOFRMFrame::RDOFRMPosition::delta);
		PTR(rdoRuntime::RDOFRMFrame::RDOFRMColor) pBgColor  = new rdoRuntime::RDOFRMFrame::RDOFRMColor(RUNTIME->lastFrame());
		PTR(rdoRuntime::RDOFRMFrame::RDOFRMColor) pFgColor  = new rdoRuntime::RDOFRMFrame::RDOFRMColor(RUNTIME->lastFrame());
		pBgColor->setColorType(rdoRuntime::RDOFRMFrame::RDOFRMColor::color_last_bg);
		pFgColor->setColorType(rdoRuntime::RDOFRMFrame::RDOFRMColor::color_last_fg);
		$$ = (int)new rdoRuntime::RDOFRMRect(RUNTIME->lastFrame(), x, y, width, height, pBgColor, pFgColor);
	}
	| RDO_rect '[' frm_position_xy ',' frm_position_xy ',' frm_position_wh ',' frm_position_wh ',' frm_color ',' frm_color error
	{
		PARSER->error().error(@13, _T("��������� ']'"));
	}
	| RDO_rect '[' frm_position_xy ',' frm_position_xy ',' frm_position_wh ',' frm_position_wh ',' frm_color ',' error
	{
		PARSER->error().error(@12, @13, _T("��������� ���� ����� ��������������"));
	}
	| RDO_rect '[' frm_position_xy ',' frm_position_xy ',' frm_position_wh ',' frm_position_wh ',' frm_color error
	{
		PARSER->error().error(@11, _T("��������� �������"));
	}
	| RDO_rect '[' frm_position_xy ',' frm_position_xy ',' frm_position_wh ',' frm_position_wh ',' error
	{
		PARSER->error().error(@10, @11, _T("��������� ���� ����"));
	}
	| RDO_rect '[' frm_position_xy ',' frm_position_xy ',' frm_position_wh ',' frm_position_wh error
	{
		PARSER->error().error(@9, _T("��������� �������"));
	}
	| RDO_rect '[' frm_position_xy ',' frm_position_xy ',' frm_position_wh ',' error
	{
		PARSER->error().error(@8, @9, _T("��������� ������"));
	}
	| RDO_rect '[' frm_position_xy ',' frm_position_xy ',' frm_position_wh error
	{
		PARSER->error().error(@7, _T("��������� �������"));
	}
	| RDO_rect '[' frm_position_xy ',' frm_position_xy ',' error
	{
		PARSER->error().error(@6, @7, _T("��������� ������"));
	}
	| RDO_rect '[' frm_position_xy ',' frm_position_xy error
	{
		PARSER->error().error(@5, _T("��������� �������"));
	}
	| RDO_rect '[' frm_position_xy ',' error
	{
		PARSER->error().error(@4, @5, _T("��������� ���������� �� ��� Y"));
	}
	| RDO_rect '[' frm_position_xy error
	{
		PARSER->error().error(@3, _T("��������� �������"));
	}
	| RDO_rect '[' error
	{
		PARSER->error().error(@2, @3, _T("��������� ���������� �� ��� X"));
	}
	| RDO_rect error
	{
		PARSER->error().error(@1, _T("��������� '['"));
	}
	;

frm_r_rect
	: RDO_r_rect '[' frm_position_xy ',' frm_position_xy ',' frm_position_wh ',' frm_position_wh ',' frm_color ',' frm_color ']'
	{
		PTR(rdoRuntime::RDOFRMFrame::RDOFRMPosition) x      = reinterpret_cast<PTR(rdoRuntime::RDOFRMFrame::RDOFRMPosition)>($3);
		PTR(rdoRuntime::RDOFRMFrame::RDOFRMPosition) y      = reinterpret_cast<PTR(rdoRuntime::RDOFRMFrame::RDOFRMPosition)>($5);
		PTR(rdoRuntime::RDOFRMFrame::RDOFRMPosition) width  = reinterpret_cast<PTR(rdoRuntime::RDOFRMFrame::RDOFRMPosition)>($7);
		PTR(rdoRuntime::RDOFRMFrame::RDOFRMPosition) height = reinterpret_cast<PTR(rdoRuntime::RDOFRMFrame::RDOFRMPosition)>($9);
		PTR(rdoRuntime::RDOFRMFrame::RDOFRMColor) pBgColor = reinterpret_cast<PTR(rdoRuntime::RDOFRMFrame::RDOFRMColor)>($11);
		PTR(rdoRuntime::RDOFRMFrame::RDOFRMColor) pFgColor = reinterpret_cast<PTR(rdoRuntime::RDOFRMFrame::RDOFRMColor)>($13);
		pBgColor->setColorType(rdoRuntime::RDOFRMFrame::RDOFRMColor::color_last_bg);
		pFgColor->setColorType(rdoRuntime::RDOFRMFrame::RDOFRMColor::color_last_fg);
		$$ = (int)new rdoRuntime::RDOFRMRectRound(RUNTIME->lastFrame(), x, y, width, height, pBgColor, pFgColor);
	}
	| RDO_r_rect '[' frm_position_xy ',' frm_position_xy ',' frm_position_wh ',' frm_position_wh ',' frm_color ',' frm_color error
	{
		PARSER->error().error(@13, _T("��������� ']'"));
	}
	| RDO_r_rect '[' frm_position_xy ',' frm_position_xy ',' frm_position_wh ',' frm_position_wh ',' frm_color ',' error
	{
		PARSER->error().error(@12, @13, _T("��������� ���� ����� ��������������"));
	}
	| RDO_r_rect '[' frm_position_xy ',' frm_position_xy ',' frm_position_wh ',' frm_position_wh ',' frm_color error
	{
		PARSER->error().error(@11, _T("��������� �������"));
	}
	| RDO_r_rect '[' frm_position_xy ',' frm_position_xy ',' frm_position_wh ',' frm_position_wh ',' error
	{
		PARSER->error().error(@10, @11, _T("��������� ���� ����"));
	}
	| RDO_r_rect '[' frm_position_xy ',' frm_position_xy ',' frm_position_wh ',' frm_position_wh error
	{
		PARSER->error().error(@9, _T("��������� �������"));
	}
	| RDO_r_rect '[' frm_position_xy ',' frm_position_xy ',' frm_position_wh ',' error
	{
		PARSER->error().error(@8, @9, _T("��������� ������"));
	}
	| RDO_r_rect '[' frm_position_xy ',' frm_position_xy ',' frm_position_wh error
	{
		PARSER->error().error(@7, _T("��������� �������"));
	}
	| RDO_r_rect '[' frm_position_xy ',' frm_position_xy ',' error
	{
		PARSER->error().error(@6, @7, _T("��������� ������"));
	}
	| RDO_r_rect '[' frm_position_xy ',' frm_position_xy error
	{
		PARSER->error().error(@5, _T("��������� �������"));
	}
	| RDO_r_rect '[' frm_position_xy ',' error
	{
		PARSER->error().error(@4, @5, _T("��������� ���������� �� ��� Y"));
	}
	| RDO_r_rect '[' frm_position_xy error
	{
		PARSER->error().error(@3, _T("��������� �������"));
	}
	| RDO_r_rect '[' error
	{
		PARSER->error().error(@2, @3, _T("��������� ���������� �� ��� X"));
	}
	| RDO_r_rect error
	{
		PARSER->error().error(@1, _T("��������� '['"));
	}
	;

frm_ellipse
	: RDO_ellipse '[' frm_position_xy ',' frm_position_xy ',' frm_position_wh ',' frm_position_wh ',' frm_color ',' frm_color ']'
	{
		PTR(rdoRuntime::RDOFRMFrame::RDOFRMPosition) x      = reinterpret_cast<PTR(rdoRuntime::RDOFRMFrame::RDOFRMPosition)>($3);
		PTR(rdoRuntime::RDOFRMFrame::RDOFRMPosition) y      = reinterpret_cast<PTR(rdoRuntime::RDOFRMFrame::RDOFRMPosition)>($5);
		PTR(rdoRuntime::RDOFRMFrame::RDOFRMPosition) width  = reinterpret_cast<PTR(rdoRuntime::RDOFRMFrame::RDOFRMPosition)>($7);
		PTR(rdoRuntime::RDOFRMFrame::RDOFRMPosition) height = reinterpret_cast<PTR(rdoRuntime::RDOFRMFrame::RDOFRMPosition)>($9);
		PTR(rdoRuntime::RDOFRMFrame::RDOFRMColor) pBgColor = reinterpret_cast<PTR(rdoRuntime::RDOFRMFrame::RDOFRMColor)>($11);
		PTR(rdoRuntime::RDOFRMFrame::RDOFRMColor) pFgColor = reinterpret_cast<PTR(rdoRuntime::RDOFRMFrame::RDOFRMColor)>($13);
		pBgColor->setColorType(rdoRuntime::RDOFRMFrame::RDOFRMColor::color_last_bg);
		pFgColor->setColorType(rdoRuntime::RDOFRMFrame::RDOFRMColor::color_last_fg);
		$$ = (int)new rdoRuntime::RDOFRMEllipse(RUNTIME->lastFrame(), x, y, width, height, pBgColor, pFgColor);
	}
	| RDO_ellipse '[' frm_position_xy ',' frm_position_xy ',' frm_position_wh ',' frm_position_wh ',' frm_color ',' frm_color error
	{
		PARSER->error().error(@13, _T("��������� ']'"));
	}
	| RDO_ellipse '[' frm_position_xy ',' frm_position_xy ',' frm_position_wh ',' frm_position_wh ',' frm_color ',' error
	{
		PARSER->error().error(@12, @13, _T("��������� ���� ����� �������"));
	}
	| RDO_ellipse '[' frm_position_xy ',' frm_position_xy ',' frm_position_wh ',' frm_position_wh ',' frm_color error
	{
		PARSER->error().error(@11, _T("��������� �������"));
	}
	| RDO_ellipse '[' frm_position_xy ',' frm_position_xy ',' frm_position_wh ',' frm_position_wh ',' error
	{
		PARSER->error().error(@10, @11, _T("��������� ���� ����"));
	}
	| RDO_ellipse '[' frm_position_xy ',' frm_position_xy ',' frm_position_wh ',' frm_position_wh error
	{
		PARSER->error().error(@9, _T("��������� �������"));
	}
	| RDO_ellipse '[' frm_position_xy ',' frm_position_xy ',' frm_position_wh ',' error
	{
		PARSER->error().error(@8, @9, _T("��������� ������"));
	}
	| RDO_ellipse '[' frm_position_xy ',' frm_position_xy ',' frm_position_wh error
	{
		PARSER->error().error(@7, _T("��������� �������"));
	}
	| RDO_ellipse '[' frm_position_xy ',' frm_position_xy ',' error
	{
		PARSER->error().error(@6, @7, _T("��������� ������"));
	}
	| RDO_ellipse '[' frm_position_xy ',' frm_position_xy error
	{
		PARSER->error().error(@5, _T("��������� �������"));
	}
	| RDO_ellipse '[' frm_position_xy ',' error
	{
		PARSER->error().error(@4, @5, _T("��������� ���������� �� ��� Y"));
	}
	| RDO_ellipse '[' frm_position_xy error
	{
		PARSER->error().error(@3, _T("��������� �������"));
	}
	| RDO_ellipse '[' error
	{
		PARSER->error().error(@2, @3, _T("��������� ���������� �� ��� X"));
	}
	| RDO_ellipse error
	{
		PARSER->error().error(@1, _T("��������� '['"));
	}
	;

frm_line
	: RDO_line '[' frm_position_xy ',' frm_position_xy ',' frm_position_xy ',' frm_position_xy ',' frm_color ']'
	{
		PTR(rdoRuntime::RDOFRMFrame::RDOFRMPosition) x      = reinterpret_cast<PTR(rdoRuntime::RDOFRMFrame::RDOFRMPosition)>($3);
		PTR(rdoRuntime::RDOFRMFrame::RDOFRMPosition) y      = reinterpret_cast<PTR(rdoRuntime::RDOFRMFrame::RDOFRMPosition)>($5);
		PTR(rdoRuntime::RDOFRMFrame::RDOFRMPosition) width  = reinterpret_cast<PTR(rdoRuntime::RDOFRMFrame::RDOFRMPosition)>($7);
		PTR(rdoRuntime::RDOFRMFrame::RDOFRMPosition) height = reinterpret_cast<PTR(rdoRuntime::RDOFRMFrame::RDOFRMPosition)>($9);
		PTR(rdoRuntime::RDOFRMFrame::RDOFRMColor) color = reinterpret_cast<PTR(rdoRuntime::RDOFRMFrame::RDOFRMColor)>($11);
		color->setColorType(rdoRuntime::RDOFRMFrame::RDOFRMColor::color_last_fg);
		$$ = (int)new rdoRuntime::RDOFRMLine(RUNTIME->lastFrame(), x, y, width, height, color);
	}
	| RDO_line '[' frm_position_xy ',' frm_position_xy ',' frm_position_xy ',' frm_position_xy ',' frm_color error
	{
		PARSER->error().error(@11, _T("��������� ']'"));
	}
	| RDO_line '[' frm_position_xy ',' frm_position_xy ',' frm_position_xy ',' frm_position_xy ',' error
	{
		PARSER->error().error(@10, @11, _T("��������� ���� �����"));
	}
	| RDO_line '[' frm_position_xy ',' frm_position_xy ',' frm_position_xy ',' frm_position_xy error
	{
		PARSER->error().error(@9, _T("��������� �������"));
	}
	| RDO_line '[' frm_position_xy ',' frm_position_xy ',' frm_position_xy ',' error
	{
		PARSER->error().error(@8, @9, _T("��������� Y2"));
	}
	| RDO_line '[' frm_position_xy ',' frm_position_xy ',' frm_position_xy error
	{
		PARSER->error().error(@7, _T("��������� �������"));
	}
	| RDO_line '[' frm_position_xy ',' frm_position_xy ',' error
	{
		PARSER->error().error(@6, @7, _T("��������� X2"));
	}
	| RDO_line '[' frm_position_xy ',' frm_position_xy error
	{
		PARSER->error().error(@5, _T("��������� �������"));
	}
	| RDO_line '[' frm_position_xy ',' error
	{
		PARSER->error().error(@4, @5, _T("��������� Y1"));
	}
	| RDO_line '[' frm_position_xy error
	{
		PARSER->error().error(@3, _T("��������� �������"));
	}
	| RDO_line '[' error
	{
		PARSER->error().error(@2, @3, _T("��������� X1"));
	}
	| RDO_line error
	{
		PARSER->error().error(@1, _T("��������� '['"));
	}
	;

frm_triang
	: RDO_triang '[' frm_position_xy ',' frm_position_xy ',' frm_position_xy ',' frm_position_xy ',' frm_position_xy ',' frm_position_xy ',' frm_color ',' frm_color ']'
	{
		PTR(rdoRuntime::RDOFRMFrame::RDOFRMPosition) x1 = reinterpret_cast<PTR(rdoRuntime::RDOFRMFrame::RDOFRMPosition)>($3);
		PTR(rdoRuntime::RDOFRMFrame::RDOFRMPosition) y1 = reinterpret_cast<PTR(rdoRuntime::RDOFRMFrame::RDOFRMPosition)>($5);
		PTR(rdoRuntime::RDOFRMFrame::RDOFRMPosition) x2 = reinterpret_cast<PTR(rdoRuntime::RDOFRMFrame::RDOFRMPosition)>($7);
		PTR(rdoRuntime::RDOFRMFrame::RDOFRMPosition) y2 = reinterpret_cast<PTR(rdoRuntime::RDOFRMFrame::RDOFRMPosition)>($9);
		PTR(rdoRuntime::RDOFRMFrame::RDOFRMPosition) x3 = reinterpret_cast<PTR(rdoRuntime::RDOFRMFrame::RDOFRMPosition)>($11);
		PTR(rdoRuntime::RDOFRMFrame::RDOFRMPosition) y3 = reinterpret_cast<PTR(rdoRuntime::RDOFRMFrame::RDOFRMPosition)>($13);
		PTR(rdoRuntime::RDOFRMFrame::RDOFRMColor) pBgColor = reinterpret_cast<PTR(rdoRuntime::RDOFRMFrame::RDOFRMColor)>($15);
		PTR(rdoRuntime::RDOFRMFrame::RDOFRMColor) pFgColor = reinterpret_cast<PTR(rdoRuntime::RDOFRMFrame::RDOFRMColor)>($17);
		pBgColor->setColorType(rdoRuntime::RDOFRMFrame::RDOFRMColor::color_last_bg);
		pFgColor->setColorType(rdoRuntime::RDOFRMFrame::RDOFRMColor::color_last_fg);
		$$ = (int)new rdoRuntime::RDOFRMTriang(RUNTIME->lastFrame(), x1, y1, x2, y2, x3, y3, pBgColor, pFgColor);
	}
	| RDO_triang '[' frm_position_xy ',' frm_position_xy ',' frm_position_xy ',' frm_position_xy ',' frm_position_xy ',' frm_position_xy ',' frm_color ',' frm_color error
	{
		PARSER->error().error(@17, _T("��������� ']'"));
	}
	| RDO_triang '[' frm_position_xy ',' frm_position_xy ',' frm_position_xy ',' frm_position_xy ',' frm_position_xy ',' frm_position_xy ',' frm_color ',' error
	{
		PARSER->error().error(@16, @17, _T("��������� ���� �����"));
	}
	| RDO_triang '[' frm_position_xy ',' frm_position_xy ',' frm_position_xy ',' frm_position_xy ',' frm_position_xy ',' frm_position_xy ',' frm_color error
	{
		PARSER->error().error(@15, _T("��������� �������"));
	}
	| RDO_triang '[' frm_position_xy ',' frm_position_xy ',' frm_position_xy ',' frm_position_xy ',' frm_position_xy ',' frm_position_xy ',' error
	{
		PARSER->error().error(@14, @15, _T("��������� ���� ������������"));
	}
	| RDO_triang '[' frm_position_xy ',' frm_position_xy ',' frm_position_xy ',' frm_position_xy ',' frm_position_xy ',' frm_position_xy error
	{
		PARSER->error().error(@13, _T("��������� �������"));
	}
	| RDO_triang '[' frm_position_xy ',' frm_position_xy ',' frm_position_xy ',' frm_position_xy ',' frm_position_xy ',' error
	{
		PARSER->error().error(@12, @13, _T("��������� Y3"));
	}
	| RDO_triang '[' frm_position_xy ',' frm_position_xy ',' frm_position_xy ',' frm_position_xy ',' frm_position_xy error
	{
		PARSER->error().error(@11, _T("��������� �������"));
	}
	| RDO_triang '[' frm_position_xy ',' frm_position_xy ',' frm_position_xy ',' frm_position_xy ',' error
	{
		PARSER->error().error(@10, @11, _T("��������� X3"));
	}
	| RDO_triang '[' frm_position_xy ',' frm_position_xy ',' frm_position_xy ',' frm_position_xy error
	{
		PARSER->error().error(@9, _T("��������� �������"));
	}
	| RDO_triang '[' frm_position_xy ',' frm_position_xy ',' frm_position_xy ',' error
	{
		PARSER->error().error(@8, @9, _T("��������� Y2"));
	}
	| RDO_triang '[' frm_position_xy ',' frm_position_xy ',' frm_position_xy error
	{
		PARSER->error().error(@7, _T("��������� �������"));
	}
	| RDO_triang '[' frm_position_xy ',' frm_position_xy ',' error
	{
		PARSER->error().error(@6, @7, _T("��������� X2"));
	}
	| RDO_triang '[' frm_position_xy ',' frm_position_xy error
	{
		PARSER->error().error(@5, _T("��������� �������"));
	}
	| RDO_triang '[' frm_position_xy ',' error
	{
		PARSER->error().error(@4, @5, _T("��������� Y1"));
	}
	| RDO_triang '[' frm_position_xy error
	{
		PARSER->error().error(@3, _T("��������� �������"));
	}
	| RDO_triang '[' error
	{
		PARSER->error().error(@2, @3, _T("��������� X1"));
	}
	| RDO_triang error
	{
		PARSER->error().error(@1, _T("��������� '['"));
	}
	;

frm_active
	: RDO_active RDO_IDENTIF '[' frm_position_xy ',' frm_position_xy ',' frm_position_wh ',' frm_position_wh ']'
	{
		tstring opr_name = P_RDOVALUE($2)->value().getIdentificator();
		LPRDODPTFreeActivity pActivity = PARSER->findDPTFreeActivity(opr_name);
		if (!pActivity)
		{
			PARSER->error().error(@2, rdo::format(_T("���������� '%s' �� �������"), opr_name.c_str()));
		}
		else
		{
			if (pActivity->pattern()->getType() != RDOPATPattern::PT_Keyboard)
			{
				PARSER->error().push_only(@2, rdo::format(_T("���������� '%s' ������ ���� ������������"), pActivity->name().c_str()));
				PARSER->error().push_only(pActivity->src_info(), _T("��. ���������"));
				PARSER->error().push_only(pActivity->pattern()->src_info(), _T("��. �������"));
				PARSER->error().push_done();
			}
		}
		PTR(rdoRuntime::RDOFRMFrame::RDOFRMPosition) x      = reinterpret_cast<PTR(rdoRuntime::RDOFRMFrame::RDOFRMPosition)>($4);
		PTR(rdoRuntime::RDOFRMFrame::RDOFRMPosition) y      = reinterpret_cast<PTR(rdoRuntime::RDOFRMFrame::RDOFRMPosition)>($6);
		PTR(rdoRuntime::RDOFRMFrame::RDOFRMPosition) width  = reinterpret_cast<PTR(rdoRuntime::RDOFRMFrame::RDOFRMPosition)>($8);
		PTR(rdoRuntime::RDOFRMFrame::RDOFRMPosition) height = reinterpret_cast<PTR(rdoRuntime::RDOFRMFrame::RDOFRMPosition)>($10);
		$$ = (int)new rdoRuntime::RDOFRMActive(RUNTIME->lastFrame(), x, y, width, height, opr_name);
	}
	| RDO_active RDO_IDENTIF '[' frm_position_xy ',' frm_position_xy ',' frm_position_wh ',' frm_position_wh error
	{
		PARSER->error().error(@10, _T("��������� ']'"));
	}
	| RDO_active RDO_IDENTIF '[' frm_position_xy ',' frm_position_xy ',' frm_position_wh ',' error
	{
		PARSER->error().error(@9, @10, _T("��������� ������"));
	}
	| RDO_active RDO_IDENTIF '[' frm_position_xy ',' frm_position_xy ',' frm_position_wh error
	{
		PARSER->error().error(@8, _T("��������� �������"));
	}
	| RDO_active RDO_IDENTIF '[' frm_position_xy ',' frm_position_xy ',' error
	{
		PARSER->error().error(@7, @8, _T("��������� ������"));
	}
	| RDO_active RDO_IDENTIF '[' frm_position_xy ',' frm_position_xy error
	{
		PARSER->error().error(@6, _T("��������� �������"));
	}
	| RDO_active RDO_IDENTIF '[' frm_position_xy ',' error
	{
		PARSER->error().error(@5, @6, _T("��������� ���������� �� ��� Y"));
	}
	| RDO_active RDO_IDENTIF '[' frm_position_xy error
	{
		PARSER->error().error(@4, _T("��������� �������"));
	}
	| RDO_active RDO_IDENTIF '[' error
	{
		PARSER->error().error(@3, @4, _T("��������� ���������� �� ��� X"));
	}
	| RDO_active RDO_IDENTIF error
	{
		PARSER->error().error(@2, _T("��������� '['"));
	}
	| RDO_active error
	{
		PARSER->error().error(@1, _T("��������� ��� ������������ ��������"));
	}
	;

// ----------------------------------------------------------------------------
// ---------- ����� ��������� ������ ��� ���� �������� ���
// ----------------------------------------------------------------------------
// ---------- ���������� ���������
// ----------------------------------------------------------------------------
fun_logic_eq
	: RDO_eq { $$ = RDO_eq; }
	;

fun_logic
	: fun_arithm fun_logic_eq fun_arithm
	{
		LPRDOFUNArithm pArithm1 = PARSER->stack().pop<RDOFUNArithm>($1);
		LPRDOFUNArithm pArithm2 = PARSER->stack().pop<RDOFUNArithm>($3);
		ASSERT(pArithm1);
		ASSERT(pArithm2);
		LPRDOFUNLogic pResult = pArithm1->operator ==(pArithm2);
		ASSERT(pResult);
		$$ = PARSER->stack().push(pResult);
	}
	| fun_arithm RDO_neq fun_arithm
	{
		LPRDOFUNArithm pArithm1 = PARSER->stack().pop<RDOFUNArithm>($1);
		LPRDOFUNArithm pArithm2 = PARSER->stack().pop<RDOFUNArithm>($3);
		ASSERT(pArithm1);
		ASSERT(pArithm2);
		LPRDOFUNLogic pResult = pArithm1->operator !=(pArithm2);
		ASSERT(pResult);
		$$ = PARSER->stack().push(pResult);
	}
	| fun_arithm '<' fun_arithm
	{
		LPRDOFUNArithm pArithm1 = PARSER->stack().pop<RDOFUNArithm>($1);
		LPRDOFUNArithm pArithm2 = PARSER->stack().pop<RDOFUNArithm>($3);
		ASSERT(pArithm1);
		ASSERT(pArithm2);
		LPRDOFUNLogic pResult = pArithm1->operator <(pArithm2);
		ASSERT(pResult);
		$$ = PARSER->stack().push(pResult);
	}
	| fun_arithm '>' fun_arithm
	{
		LPRDOFUNArithm pArithm1 = PARSER->stack().pop<RDOFUNArithm>($1);
		LPRDOFUNArithm pArithm2 = PARSER->stack().pop<RDOFUNArithm>($3);
		ASSERT(pArithm1);
		ASSERT(pArithm2);
		LPRDOFUNLogic pResult = pArithm1->operator >(pArithm2);
		ASSERT(pResult);
		$$ = PARSER->stack().push(pResult);
	}
	| fun_arithm RDO_leq fun_arithm
	{
		LPRDOFUNArithm pArithm1 = PARSER->stack().pop<RDOFUNArithm>($1);
		LPRDOFUNArithm pArithm2 = PARSER->stack().pop<RDOFUNArithm>($3);
		ASSERT(pArithm1);
		ASSERT(pArithm2);
		LPRDOFUNLogic pResult = pArithm1->operator <=(pArithm2);
		ASSERT(pResult);
		$$ = PARSER->stack().push(pResult);
	}
	| fun_arithm RDO_geq fun_arithm
	{
		LPRDOFUNArithm pArithm1 = PARSER->stack().pop<RDOFUNArithm>($1);
		LPRDOFUNArithm pArithm2 = PARSER->stack().pop<RDOFUNArithm>($3);
		ASSERT(pArithm1);
		ASSERT(pArithm2);
		LPRDOFUNLogic pResult = pArithm1->operator >=(pArithm2);
		ASSERT(pResult);
		$$ = PARSER->stack().push(pResult);
	}
	| fun_logic RDO_and fun_logic
	{
		LPRDOFUNLogic pLogic1 = PARSER->stack().pop<RDOFUNLogic>($1);
		LPRDOFUNLogic pLogic2 = PARSER->stack().pop<RDOFUNLogic>($3);
		ASSERT(pLogic1);
		ASSERT(pLogic2);
		LPRDOFUNLogic pResult = pLogic1->operator &&(pLogic2);
		ASSERT(pResult);
		$$ = PARSER->stack().push(pResult);
	}
	| fun_logic RDO_or fun_logic
	{
		LPRDOFUNLogic pLogic1 = PARSER->stack().pop<RDOFUNLogic>($1);
		LPRDOFUNLogic pLogic2 = PARSER->stack().pop<RDOFUNLogic>($3);
		ASSERT(pLogic1);
		ASSERT(pLogic2);
		LPRDOFUNLogic pResult = pLogic1->operator ||(pLogic2);
		ASSERT(pResult);
		$$ = PARSER->stack().push(pResult);
	}
	| fun_arithm
	{
		LPRDOFUNArithm pArithm = PARSER->stack().pop<RDOFUNArithm>($1);
		ASSERT(pArithm);
		LPRDOFUNLogic pResult = rdo::Factory<RDOFUNLogic>::create(pArithm);
		ASSERT(pResult);
		$$ = PARSER->stack().push(pResult);
	}
	| fun_group
	| fun_select_logic
	| '[' fun_logic ']'
	{
		LPRDOFUNLogic pLogic = PARSER->stack().pop<RDOFUNLogic>($2);
		ASSERT(pLogic);
		pLogic->setSrcPos (@1, @3);
		pLogic->setSrcText(_T("[") + pLogic->src_text() + _T("]"));
		$$ = PARSER->stack().push(pLogic);
	}
	| '(' fun_logic ')'
	{
		LPRDOFUNLogic pLogic = PARSER->stack().pop<RDOFUNLogic>($2);
		ASSERT(pLogic);
		pLogic->setSrcPos (@1, @3);
		pLogic->setSrcText(_T("(") + pLogic->src_text() + _T(")"));
		$$ = PARSER->stack().push(pLogic);
	}
	| RDO_not fun_logic
	{
		LPRDOFUNLogic pLogic = PARSER->stack().pop<RDOFUNLogic>($2);
		ASSERT(pLogic);
		LPRDOFUNLogic pLogicNot = pLogic->operator_not();
		ASSERT(pLogicNot);
		pLogicNot->setSrcPos (@1, @2);
		pLogicNot->setSrcText(_T("not ") + pLogic->src_text());
		$$ = PARSER->stack().push(pLogicNot);
	}
	| '[' fun_logic error
	{
		PARSER->error().error(@2, _T("��������� ������������� ������"));
	}
	| '(' fun_logic error
	{
		PARSER->error().error(@2, _T("��������� ������������� ������"));
	}
	;

// ----------------------------------------------------------------------------
// ---------- �������������� ���������
// ----------------------------------------------------------------------------
fun_arithm
	: RDO_INT_CONST                      { $$ = PARSER->stack().push(rdo::Factory<RDOFUNArithm>::create(RDOVALUE($1))); }
	| RDO_REAL_CONST                     { $$ = PARSER->stack().push(rdo::Factory<RDOFUNArithm>::create(RDOVALUE($1))); }
	| RDO_BOOL_CONST                     { $$ = PARSER->stack().push(rdo::Factory<RDOFUNArithm>::create(RDOVALUE($1))); }
	| RDO_STRING_CONST                   { $$ = PARSER->stack().push(rdo::Factory<RDOFUNArithm>::create(RDOVALUE($1))); }
	| RDO_IDENTIF                        { $$ = PARSER->stack().push(rdo::Factory<RDOFUNArithm>::create(RDOVALUE($1))); }
	| RDO_IDENTIF '.' RDO_IDENTIF        { $$ = PARSER->stack().push(rdo::Factory<RDOFUNArithm>::create(RDOVALUE($1), RDOVALUE($3))); }
	| RDO_IDENTIF_RELRES '.' RDO_IDENTIF { $$ = PARSER->stack().push(rdo::Factory<RDOFUNArithm>::create(RDOVALUE($1), RDOVALUE($3))); }
	| fun_arithm '+' fun_arithm
	{
		LPRDOFUNArithm pArithm1 = PARSER->stack().pop<RDOFUNArithm>($1);
		LPRDOFUNArithm pArithm2 = PARSER->stack().pop<RDOFUNArithm>($3);
		ASSERT(pArithm1);
		ASSERT(pArithm2);
		LPRDOFUNArithm pResult = pArithm1->operator +(pArithm2);
		ASSERT(pResult);
		$$ = PARSER->stack().push(pResult);
	}
	| fun_arithm '-' fun_arithm
	{
		LPRDOFUNArithm pArithm1 = PARSER->stack().pop<RDOFUNArithm>($1);
		LPRDOFUNArithm pArithm2 = PARSER->stack().pop<RDOFUNArithm>($3);
		ASSERT(pArithm1);
		ASSERT(pArithm2);
		LPRDOFUNArithm pResult = pArithm1->operator -(pArithm2);
		ASSERT(pResult);
		$$ = PARSER->stack().push(pResult);
	}
	| fun_arithm '*' fun_arithm
	{
		LPRDOFUNArithm pArithm1 = PARSER->stack().pop<RDOFUNArithm>($1);
		LPRDOFUNArithm pArithm2 = PARSER->stack().pop<RDOFUNArithm>($3);
		ASSERT(pArithm1);
		ASSERT(pArithm2);
		LPRDOFUNArithm pResult = pArithm1->operator *(pArithm2);
		ASSERT(pResult);
		$$ = PARSER->stack().push(pResult);
	}
	| fun_arithm '/' fun_arithm
	{
		LPRDOFUNArithm pArithm1 = PARSER->stack().pop<RDOFUNArithm>($1);
		LPRDOFUNArithm pArithm2 = PARSER->stack().pop<RDOFUNArithm>($3);
		ASSERT(pArithm1);
		ASSERT(pArithm2);
		LPRDOFUNArithm pResult = pArithm1->operator /(pArithm2);
		ASSERT(pResult);
		$$ = PARSER->stack().push(pResult);
	}
	| fun_arithm_func_call
	| fun_select_arithm
	| '(' fun_arithm ')'
	{
		LPRDOFUNArithm pArithm = PARSER->stack().pop<RDOFUNArithm>($2);
		ASSERT(pArithm);
		pArithm->setSrcPos (@1, @3);
		pArithm->setSrcText(_T("(") + pArithm->src_text() + _T(")"));
		$$ = PARSER->stack().push(pArithm);
	}
	| '-' fun_arithm %prec RDO_UMINUS
	{
		LPRDOFUNArithm pArithm = PARSER->stack().pop<RDOFUNArithm>($2);
		ASSERT(pArithm);
		RDOParserSrcInfo info;
		info.setSrcPos (@1, @2);
		info.setSrcText(_T("-") + pArithm->src_text());
		$$ = PARSER->stack().push(rdo::Factory<RDOFUNArithm>::create(RDOValue(pArithm->type(), info), rdo::Factory<rdoRuntime::RDOCalcUMinus>::create(pArithm->createCalc())));
	}
	;

// ----------------------------------------------------------------------------
// ---------- ������� � ������������������
// ----------------------------------------------------------------------------
fun_arithm_func_call
	: RDO_IDENTIF '(' ')'
	{
		LPRDOFUNParams pFunParams = rdo::Factory<RDOFUNParams>::create();
		ASSERT(pFunParams);
		tstring funName = RDOVALUE($1)->getIdentificator();
		pFunParams->getFunseqName().setSrcInfo(RDOParserSrcInfo(@1, funName));
		pFunParams->setSrcPos (@1, @3);
		pFunParams->setSrcText(funName + _T("()"));
		LPRDOFUNArithm pArithm = pFunParams->createCall(funName);
		ASSERT(pArithm);
		$$ = PARSER->stack().push(pArithm);
	}
	| RDO_IDENTIF '(' fun_arithm_func_call_pars ')'
	{
		LPRDOFUNParams pFunParams = PARSER->stack().pop<RDOFUNParams>($3);
		ASSERT(pFunParams);
		tstring funName = RDOVALUE($1)->getIdentificator();
		pFunParams->getFunseqName().setSrcInfo(RDOParserSrcInfo(@1, funName));
		pFunParams->setSrcPos (@1, @4);
		pFunParams->setSrcText(funName + _T("(") + pFunParams->src_text() + _T(")"));
		LPRDOFUNArithm pArithm = pFunParams->createCall(funName);
		ASSERT(pArithm);
		$$ = PARSER->stack().push(pArithm);
	}
	| RDO_IDENTIF '(' error
	{
		PARSER->error().error(@3, _T("������ � ���������� �������"));
	}
	;

fun_arithm_func_call_pars
	: fun_arithm
	{
		LPRDOFUNParams pFunParams = rdo::Factory<RDOFUNParams>::create();
		LPRDOFUNArithm pArithm    = PARSER->stack().pop<RDOFUNArithm>($1);
		ASSERT(pFunParams);
		ASSERT(pArithm   );
		pFunParams->setSrcText  (pArithm->src_text());
		pFunParams->addParameter(pArithm);
		$$ = PARSER->stack().push(pFunParams);
	}
	| fun_arithm_func_call_pars ',' fun_arithm
	{
		LPRDOFUNParams pFunParams = PARSER->stack().pop<RDOFUNParams>($1);
		LPRDOFUNArithm pArithm    = PARSER->stack().pop<RDOFUNArithm>($3);
		ASSERT(pFunParams);
		ASSERT(pArithm   );
		pFunParams->setSrcText  (pFunParams->src_text() + _T(", ") + pArithm->src_text());
		pFunParams->addParameter(pArithm);
		$$ = PARSER->stack().push(pFunParams);
	}
	| fun_arithm_func_call_pars error
	{
		PARSER->error().error(@2, _T("������ � �������������� ���������"));
	}
	| fun_arithm_func_call_pars ',' error
	{
		PARSER->error().error(@3, _T("������ � �������������� ���������"));
	}
	;

// ----------------------------------------------------------------------------
// ---------- ��������� ���������
// ----------------------------------------------------------------------------
fun_group_keyword
	: RDO_Exist       { $$ = RDOFUNGroupLogic::fgt_exist;     }
	| RDO_Not_Exist   { $$ = RDOFUNGroupLogic::fgt_notexist;  }
	| RDO_For_All     { $$ = RDOFUNGroupLogic::fgt_forall;    }
	| RDO_Not_For_All { $$ = RDOFUNGroupLogic::fgt_notforall; }
	;

fun_group_header
	: fun_group_keyword '(' RDO_IDENTIF_COLON
	{
		PTR(RDOValue) type_name = P_RDOVALUE($3);
		$$ = PARSER->stack().push(rdo::Factory<RDOFUNGroupLogic>::create((RDOFUNGroupLogic::FunGroupType)$1, type_name->src_info()));
	}
	| fun_group_keyword '(' error
	{
		PARSER->error().error(@3, _T("��������� ��� ����"));
	}
	| fun_group_keyword error
	{
		PARSER->error().error(@1, _T("����� ����� ������� ��������� ������������� ������"));
	}
	;

fun_group
	: fun_group_header fun_logic ')'
	{
		LPRDOFUNGroupLogic pGroupFun = PARSER->stack().pop<RDOFUNGroupLogic>($1);
		LPRDOFUNLogic      pLogic    = PARSER->stack().pop<RDOFUNLogic>     ($2);
		ASSERT(pGroupFun);
		ASSERT(pLogic   );
		pGroupFun->setSrcPos(@1, @3);
		$$ = PARSER->stack().push(pGroupFun->createFunLogic(pLogic));
	}
	| fun_group_header RDO_NoCheck ')'
	{
		LPRDOFUNGroupLogic pGroupFun = PARSER->stack().pop<RDOFUNGroupLogic>($1);
		ASSERT(pGroupFun);
		pGroupFun->setSrcPos(@1, @3);
		LPRDOFUNLogic pTrueLogic = rdo::Factory<RDOFUNLogic>::create(rdo::Factory<rdoRuntime::RDOCalcConst>::create(1), false);
		ASSERT(pTrueLogic);
		pTrueLogic->setSrcPos (@2);
		pTrueLogic->setSrcText(_T("NoCheck"));
		$$ = PARSER->stack().push(pGroupFun->createFunLogic(pTrueLogic));
	}
	| fun_group_header fun_logic error
	{
		PARSER->error().error(@2, _T("��������� ������������� ������"));
	}
	| fun_group_header RDO_NoCheck error
	{
		PARSER->error().error(@2, _T("��������� ������������� ������"));
	}
	| fun_group_header error
	{
		PARSER->error().error(@1, @2, _T("������ � ���������� ���������"));
	}
	;

// ----------------------------------------------------------------------------
// ---------- Select
// ----------------------------------------------------------------------------
fun_select_header
	: RDO_Select '(' RDO_IDENTIF_COLON
	{
		PTR(RDOValue)  type_name = P_RDOVALUE($3);
		LPRDOFUNSelect pSelect   = rdo::Factory<RDOFUNSelect>::create(type_name->src_info());
		ASSERT(pSelect);
		pSelect->setSrcText(_T("Select(") + type_name->value().getIdentificator() + _T(": "));
		$$ = PARSER->stack().push(pSelect);
	}
	| RDO_Select '(' error
	{
		PARSER->error().error(@3, _T("��������� ��� ����"));
	}
	| RDO_Select error
	{
		PARSER->error().error(@1, _T("��������� ������������� ������"));
	}
	;

fun_select_body
	: fun_select_header fun_logic ')'
	{
		LPRDOFUNSelect pSelect = PARSER->stack().pop<RDOFUNSelect>($1);
		LPRDOFUNLogic  pLogic  = PARSER->stack().pop<RDOFUNLogic> ($2);
		ASSERT(pSelect);
		ASSERT(pLogic );
		pSelect->setSrcText(pSelect->src_text() + pLogic->src_text() + _T(")"));
		pSelect->initSelect(pLogic);
		$$ = PARSER->stack().push(pSelect);
	}
	| fun_select_header RDO_NoCheck ')'
	{
		LPRDOFUNSelect pSelect = PARSER->stack().pop<RDOFUNSelect>($1);
		ASSERT(pSelect);
		RDOParserSrcInfo logicInfo(@2, _T("NoCheck"));
		pSelect->setSrcText(pSelect->src_text() + logicInfo.src_text() + _T(")"));
		rdoRuntime::LPRDOCalcConst pCalc  = rdo::Factory<rdoRuntime::RDOCalcConst>::create(1);
		ASSERT(pCalc);
		LPRDOFUNLogic pLogic = rdo::Factory<RDOFUNLogic>::create(pCalc, true);
		ASSERT(pLogic);
		pLogic->setSrcInfo(logicInfo);
		pSelect->initSelect(pLogic);
		$$ = PARSER->stack().push(pSelect);
	}
	| fun_select_header fun_logic error
	{
		PARSER->error().error(@2, _T("��������� ������������� ������"));
	}
	| fun_select_header RDO_NoCheck error
	{
		PARSER->error().error(@2, _T("��������� ������������� ������"));
	}
	| fun_select_header error
	{
		PARSER->error().error(@1, @2, _T("������ � ���������� ���������"));
	}
	;

fun_select_keyword
	: RDO_Exist			{ $$ = RDOFUNGroupLogic::fgt_exist;     }
	| RDO_Not_Exist		{ $$ = RDOFUNGroupLogic::fgt_notexist;  }
	| RDO_For_All		{ $$ = RDOFUNGroupLogic::fgt_forall;    }
	| RDO_Not_For_All	{ $$ = RDOFUNGroupLogic::fgt_notforall; }
	;

fun_select_logic
	: fun_select_body '.' fun_select_keyword '(' fun_logic ')'
	{
		LPRDOFUNSelect pSelect = PARSER->stack().pop<RDOFUNSelect>($1);
		LPRDOFUNLogic  pLogic  = PARSER->stack().pop<RDOFUNLogic> ($5);
		ASSERT(pSelect);
		ASSERT(pLogic );
		pSelect->setSrcPos(@1, @6);
		LPRDOFUNLogic pLogicSelect = pSelect->createFunSelectGroup((RDOFUNGroupLogic::FunGroupType)$3, pLogic);
		ASSERT(pLogicSelect);
		$$ = PARSER->stack().push(pLogicSelect);
	}
	| fun_select_body '.' fun_select_keyword '(' error
	{
		PARSER->error().error(@4, @5, _T("������ � ���������� ���������"));
	}
	| fun_select_body '.' fun_select_keyword error
	{
		PARSER->error().error(@3, _T("��������� ������������� ������"));
	}
	| fun_select_body '.' RDO_Empty '(' ')'
	{
		LPRDOFUNSelect pSelect = PARSER->stack().pop<RDOFUNSelect>($1);
		ASSERT(pSelect);
		pSelect->setSrcPos(@1, @5);
		RDOParserSrcInfo emptyInfo(@3, @5, _T("Empty()"));
		LPRDOFUNLogic pLogic = pSelect->createFunSelectEmpty(emptyInfo);
		ASSERT(pLogic);
		$$ = PARSER->stack().push(pLogic);
	}
	| fun_select_body '.' RDO_Empty '(' error
	{
		PARSER->error().error(@4, _T("��������� ������������� ������"));
	}
	| fun_select_body '.' RDO_Empty error
	{
		PARSER->error().error(@3, _T("��������� ������������� ������"));
	}
	| fun_select_body '.' error
	{
		PARSER->error().error(@2, @3, _T("��������� ����� ������ ��������"));
	}
	| fun_select_body error
	{
		PARSER->error().error(@1, _T("��������� '.' (�����) ��� ������ ������ ������ ��������"));
	}
	;

fun_select_arithm
	: fun_select_body '.' RDO_Size '(' ')'
	{
		LPRDOFUNSelect pSelect = PARSER->stack().pop<RDOFUNSelect>($1);
		ASSERT(pSelect);
		pSelect->setSrcPos(@1, @5);
		RDOParserSrcInfo sizeInfo(@3, @5, _T("Size()"));
		LPRDOFUNArithm pArithm = pSelect->createFunSelectSize(sizeInfo);
		ASSERT(pArithm);
		$$ = PARSER->stack().push(pArithm);
	}
	| fun_select_body '.' RDO_Size error
	{
		PARSER->error().error(@3, _T("��������� ������������� ������"));
	}
	| fun_select_body '.' RDO_Size '(' error
	{
		PARSER->error().error(@4, _T("��������� ������������� ������"));
	}
	;

%%

CLOSE_RDO_CONVERTER_NAMESPACE
