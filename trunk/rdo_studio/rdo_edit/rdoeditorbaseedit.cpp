#include "stdafx.h"
#include "rdoeditorbaseedit.h"
#include "../edit_ctrls/sci/SciLexer.h"
#include "../resource.h"

#ifdef _DEBUG
#define new DEBUG_NEW
#endif

using namespace std;
using namespace rdoEditor;
using namespace rdoStyle;

// ----------------------------------------------------------------------------
// ---------- RDOEditorBaseEdit
// ---------------------------------------------------------------------------

// ---------------
// RDO lexer

char* RDOEditorBaseEdit::kw0 = "$Activities $Back_picture $Body $Changes $Compare_tops $Condition \
$Constant $Decision_point $Default $End $End_picture $Evaluate_by $Frame $Function \
$Include $Operations $Parameters $Pattern $Relevant_resources $Resource_type \
$Resources $Result_values $Results $Sequence $Status $Term_condition $Time $Tracing \
$Type $Watching active AExpCalcCounter after algorithmic all and Animation before \
BExpCalcCounter bitmap Break_point by_hist Calculate_if Choice Convert_begin \
Convert_end Convert_event Convert_rule Create ellipse enumerative Erase EventCount \
exponential first FALSE Frame_file Frame_number from get_value Get_value integer \
irregular_event Keep keyboard line list longint Model_name Monitor NO NO_MORE_EVENTS \
NoChange NoCheck NonExist normal NORMAL_TERMINATION NoShow operation \
OperRuleCheckCounter OprIev_file or permanent r_rect real rect Resource_file \
Results_file rule Run_file Run_StartTime RUN_TIME_ERROR s_bmp search Seconds selected \
set Show Show_if Show_mode Show_rate some Statistic_file such_as table temporary \
Terminate_if text Time_now Trace_EndTime Trace_file Trace_StartTime triang TRUE \
uniform until USER_BREAK value watch_par watch_quant watch_state watch_value with_max \
with_min YES transparent ���������_�����";

char* RDOEditorBaseEdit::kw1 = "Abs ArcCos ArcSin ArcTan Cos Cotan Exist Exp Floor For_All Frac \
GetRelResNumber GetResNumber IAbs IMax IMin Int IntPower Ln Log10 Log2 LogN Max Min \
Not_Exist Not_For_All Power Round Sin Sqrt Tan";

char* RDOEditorBaseEdit::kw2 = "no_trace trace trace_all trace_stat trace_tops";

static char* wordCharacters = "0123456789_$abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ�����������娸����������������������������������������������������";

// ---------------

BEGIN_MESSAGE_MAP( RDOEditorBaseEdit, RDOBaseEdit )
	//{{AFX_MSG_MAP(RDOEditorBaseEdit)
	ON_WM_CREATE()
	//}}AFX_MSG_MAP
END_MESSAGE_MAP()

RDOEditorBaseEdit::RDOEditorBaseEdit(): RDOBaseEdit()
{
}

RDOEditorBaseEdit::~RDOEditorBaseEdit()
{
}

int RDOEditorBaseEdit::OnCreate( LPCREATESTRUCT lpCreateStruct )
{
	if ( RDOBaseEdit::OnCreate(lpCreateStruct) == -1 ) return -1;

	sendEditor( SCI_SETLEXER, SCLEX_RDO );
	int lexLanguage = sendEditor( SCI_GETLEXER );

	sendEditorString( SCI_SETPROPERTY, reinterpret_cast<unsigned long>("fold"), "1" );

	sendEditor( SCI_SETMARGINWIDTHN, 1, 0 );

	sendEditor( SCI_SETSTYLEBITS, 5 );
	sendEditorString( SCI_SETKEYWORDS, 0, kw0 );
	sendEditorString( SCI_SETKEYWORDS, 1, kw1 );
	sendEditorString( SCI_SETKEYWORDS, 2, kw2 );
	sendEditorString( SCI_SETWORDCHARS, 0, wordCharacters );

	return 0;
}

void RDOEditorBaseEdit::setEditorStyle( RDOEditorBaseEditStyle* _style )
{
	RDOBaseEdit::setEditorStyle( _style );
	if ( !style ) return;

	// ----------
	// Colors
	sendEditor( SCI_STYLESETFORE, SCE_RDO_DEFAULT, static_cast<RDOEditorEditTheme*>(style->theme)->defaultColor );
	sendEditor( SCI_STYLESETBACK, SCE_RDO_DEFAULT, static_cast<RDOEditorEditTheme*>(style->theme)->backgroundColor );
	sendEditor( SCI_STYLESETFORE, SCE_RDO_IDENTIFIER, static_cast<RDOEditorEditTheme*>(style->theme)->identifierColor );
	sendEditor( SCI_STYLESETBACK, SCE_RDO_IDENTIFIER, static_cast<RDOEditorEditTheme*>(style->theme)->backgroundColor );
	sendEditor( SCI_STYLESETFORE, SCE_RDO_KEYWORD, static_cast<RDOEditorEditTheme*>(style->theme)->keywordColor );
	sendEditor( SCI_STYLESETBACK, SCE_RDO_KEYWORD, static_cast<RDOEditorEditTheme*>(style->theme)->backgroundColor );
	sendEditor( SCI_STYLESETFORE, SCE_RDO_FUNCTION, static_cast<RDOEditorEditTheme*>(style->theme)->functionsColor );
	sendEditor( SCI_STYLESETBACK, SCE_RDO_FUNCTION, static_cast<RDOEditorEditTheme*>(style->theme)->backgroundColor );
	sendEditor( SCI_STYLESETFORE, SCE_RDO_TRACE, static_cast<RDOEditorEditTheme*>(style->theme)->traceColor );
	sendEditor( SCI_STYLESETBACK, SCE_RDO_TRACE, static_cast<RDOEditorEditTheme*>(style->theme)->backgroundColor );
	sendEditor( SCI_STYLESETFORE, SCE_RDO_COMMENT, static_cast<RDOEditorEditTheme*>(style->theme)->commentColor );
	sendEditor( SCI_STYLESETBACK, SCE_RDO_COMMENT, static_cast<RDOEditorEditTheme*>(style->theme)->backgroundColor );
	sendEditor( SCI_STYLESETFORE, SCE_RDO_NUMBER, static_cast<RDOEditorEditTheme*>(style->theme)->numberColor );
	sendEditor( SCI_STYLESETBACK, SCE_RDO_NUMBER, static_cast<RDOEditorEditTheme*>(style->theme)->backgroundColor );
	sendEditor( SCI_STYLESETFORE, SCE_RDO_STRING, static_cast<RDOEditorEditTheme*>(style->theme)->stringColor );
	sendEditor( SCI_STYLESETBACK, SCE_RDO_STRING, static_cast<RDOEditorEditTheme*>(style->theme)->backgroundColor );
	sendEditor( SCI_STYLESETFORE, SCE_RDO_OPERATOR, static_cast<RDOEditorEditTheme*>(style->theme)->operatorColor );
	sendEditor( SCI_STYLESETBACK, SCE_RDO_OPERATOR, static_cast<RDOEditorEditTheme*>(style->theme)->backgroundColor );

	// ----------
	// Styles
	sendEditor( SCI_STYLESETBOLD     , SCE_RDO_DEFAULT, static_cast<RDOEditorEditTheme*>(style->theme)->defaultStyle & RDOStyleFont::BOLD      );
	sendEditor( SCI_STYLESETITALIC   , SCE_RDO_DEFAULT, static_cast<RDOEditorEditTheme*>(style->theme)->defaultStyle & RDOStyleFont::ITALIC    );
	sendEditor( SCI_STYLESETUNDERLINE, SCE_RDO_DEFAULT, static_cast<RDOEditorEditTheme*>(style->theme)->defaultStyle & RDOStyleFont::UNDERLINE );
	sendEditor( SCI_STYLESETBOLD     , SCE_RDO_IDENTIFIER, static_cast<RDOEditorEditTheme*>(style->theme)->identifierStyle & RDOStyleFont::BOLD      );
	sendEditor( SCI_STYLESETITALIC   , SCE_RDO_IDENTIFIER, static_cast<RDOEditorEditTheme*>(style->theme)->identifierStyle & RDOStyleFont::ITALIC    );
	sendEditor( SCI_STYLESETUNDERLINE, SCE_RDO_IDENTIFIER, static_cast<RDOEditorEditTheme*>(style->theme)->identifierStyle & RDOStyleFont::UNDERLINE );
	sendEditor( SCI_STYLESETBOLD     , SCE_RDO_KEYWORD, static_cast<RDOEditorEditTheme*>(style->theme)->keywordStyle & RDOStyleFont::BOLD      );
	sendEditor( SCI_STYLESETITALIC   , SCE_RDO_KEYWORD, static_cast<RDOEditorEditTheme*>(style->theme)->keywordStyle & RDOStyleFont::ITALIC    );
	sendEditor( SCI_STYLESETUNDERLINE, SCE_RDO_KEYWORD, static_cast<RDOEditorEditTheme*>(style->theme)->keywordStyle & RDOStyleFont::UNDERLINE );
	sendEditor( SCI_STYLESETBOLD     , SCE_RDO_FUNCTION, static_cast<RDOEditorEditTheme*>(style->theme)->functionsStyle & RDOStyleFont::BOLD      );
	sendEditor( SCI_STYLESETITALIC   , SCE_RDO_FUNCTION, static_cast<RDOEditorEditTheme*>(style->theme)->functionsStyle & RDOStyleFont::ITALIC    );
	sendEditor( SCI_STYLESETUNDERLINE, SCE_RDO_FUNCTION, static_cast<RDOEditorEditTheme*>(style->theme)->functionsStyle & RDOStyleFont::UNDERLINE );
	sendEditor( SCI_STYLESETBOLD     , SCE_RDO_TRACE, static_cast<RDOEditorEditTheme*>(style->theme)->traceStyle & RDOStyleFont::BOLD      );
	sendEditor( SCI_STYLESETITALIC   , SCE_RDO_TRACE, static_cast<RDOEditorEditTheme*>(style->theme)->traceStyle & RDOStyleFont::ITALIC    );
	sendEditor( SCI_STYLESETUNDERLINE, SCE_RDO_TRACE, static_cast<RDOEditorEditTheme*>(style->theme)->traceStyle & RDOStyleFont::UNDERLINE );
	sendEditor( SCI_STYLESETBOLD     , SCE_RDO_COMMENT, static_cast<RDOEditorEditTheme*>(style->theme)->commentStyle & RDOStyleFont::BOLD      );
	sendEditor( SCI_STYLESETITALIC   , SCE_RDO_COMMENT, static_cast<RDOEditorEditTheme*>(style->theme)->commentStyle & RDOStyleFont::ITALIC    );
	sendEditor( SCI_STYLESETUNDERLINE, SCE_RDO_COMMENT, static_cast<RDOEditorEditTheme*>(style->theme)->commentStyle & RDOStyleFont::UNDERLINE );
	sendEditor( SCI_STYLESETBOLD     , SCE_RDO_NUMBER, static_cast<RDOEditorEditTheme*>(style->theme)->numberStyle & RDOStyleFont::BOLD      );
	sendEditor( SCI_STYLESETITALIC   , SCE_RDO_NUMBER, static_cast<RDOEditorEditTheme*>(style->theme)->numberStyle & RDOStyleFont::ITALIC    );
	sendEditor( SCI_STYLESETUNDERLINE, SCE_RDO_NUMBER, static_cast<RDOEditorEditTheme*>(style->theme)->numberStyle & RDOStyleFont::UNDERLINE );
	sendEditor( SCI_STYLESETBOLD     , SCE_RDO_STRING, static_cast<RDOEditorEditTheme*>(style->theme)->stringStyle & RDOStyleFont::BOLD      );
	sendEditor( SCI_STYLESETITALIC   , SCE_RDO_STRING, static_cast<RDOEditorEditTheme*>(style->theme)->stringStyle & RDOStyleFont::ITALIC    );
	sendEditor( SCI_STYLESETUNDERLINE, SCE_RDO_STRING, static_cast<RDOEditorEditTheme*>(style->theme)->stringStyle & RDOStyleFont::UNDERLINE );
	sendEditor( SCI_STYLESETBOLD     , SCE_RDO_OPERATOR, static_cast<RDOEditorEditTheme*>(style->theme)->operatorStyle & RDOStyleFont::BOLD      );
	sendEditor( SCI_STYLESETITALIC   , SCE_RDO_OPERATOR, static_cast<RDOEditorEditTheme*>(style->theme)->operatorStyle & RDOStyleFont::ITALIC    );
	sendEditor( SCI_STYLESETUNDERLINE, SCE_RDO_OPERATOR, static_cast<RDOEditorEditTheme*>(style->theme)->operatorStyle & RDOStyleFont::UNDERLINE );

	// ----------
	// Font Name
	sendEditorString( SCI_STYLESETFONT, SCE_RDO_DEFAULT, style->font->name.c_str() );
	sendEditorString( SCI_STYLESETFONT, SCE_RDO_IDENTIFIER, style->font->name.c_str() );
	sendEditorString( SCI_STYLESETFONT, SCE_RDO_KEYWORD, style->font->name.c_str() );
	sendEditorString( SCI_STYLESETFONT, SCE_RDO_FUNCTION, style->font->name.c_str() );
	sendEditorString( SCI_STYLESETFONT, SCE_RDO_TRACE, style->font->name.c_str() );
	sendEditorString( SCI_STYLESETFONT, SCE_RDO_COMMENT, style->font->name.c_str() );
	sendEditorString( SCI_STYLESETFONT, SCE_RDO_NUMBER, style->font->name.c_str() );
	sendEditorString( SCI_STYLESETFONT, SCE_RDO_STRING, style->font->name.c_str() );
	sendEditorString( SCI_STYLESETFONT, SCE_RDO_OPERATOR, style->font->name.c_str() );

	// ----------
	// Font Size
	sendEditor( SCI_STYLESETSIZE, SCE_RDO_DEFAULT, style->font->size );
	sendEditor( SCI_STYLESETSIZE, SCE_RDO_IDENTIFIER, style->font->size );
	sendEditor( SCI_STYLESETSIZE, SCE_RDO_KEYWORD, style->font->size );
	sendEditor( SCI_STYLESETSIZE, SCE_RDO_FUNCTION, style->font->size );
	sendEditor( SCI_STYLESETSIZE, SCE_RDO_TRACE, style->font->size );
	sendEditor( SCI_STYLESETSIZE, SCE_RDO_COMMENT, style->font->size );
	sendEditor( SCI_STYLESETSIZE, SCE_RDO_NUMBER, style->font->size );
	sendEditor( SCI_STYLESETSIZE, SCE_RDO_STRING, style->font->size );
	sendEditor( SCI_STYLESETSIZE, SCE_RDO_OPERATOR, style->font->size );

	// ----------
	// Codepage and Characterset
	sendEditor( SCI_STYLESETCHARACTERSET, SCE_RDO_DEFAULT, style->font->characterSet );
	sendEditor( SCI_STYLESETCHARACTERSET, SCE_RDO_IDENTIFIER, style->font->characterSet );
	sendEditor( SCI_STYLESETCHARACTERSET, SCE_RDO_KEYWORD, style->font->characterSet );
	sendEditor( SCI_STYLESETCHARACTERSET, SCE_RDO_FUNCTION, style->font->characterSet );
	sendEditor( SCI_STYLESETCHARACTERSET, SCE_RDO_TRACE, style->font->characterSet );
	sendEditor( SCI_STYLESETCHARACTERSET, SCE_RDO_COMMENT, style->font->characterSet );
	sendEditor( SCI_STYLESETCHARACTERSET, SCE_RDO_NUMBER, style->font->characterSet );
	sendEditor( SCI_STYLESETCHARACTERSET, SCE_RDO_STRING, style->font->characterSet );
	sendEditor( SCI_STYLESETCHARACTERSET, SCE_RDO_OPERATOR, style->font->characterSet );
}

void RDOEditorBaseEdit::replaceCurrent( const string str, const int changePosValue ) const
{
	int pos = 0;
	if ( changePosValue != -1 ) pos = getCurrentPos();

	sendEditor( SCI_REPLACESEL, 0, (long)str.c_str() );

	if ( changePosValue != -1 ) {
		pos += changePosValue;
		setCurrentPos( pos );
	}
}
