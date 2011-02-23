#include "rdo_studio/stdafx.h"
#include "rdo_studio/rdostudioframestyle.h"

#ifdef _DEBUG
#define new DEBUG_NEW
#undef THIS_FILE
static char THIS_FILE[] = __FILE__;
#endif

using namespace rdoStyle;

// ----------------------------------------------------------------------------
// ---------- RDOStudioFrameTheme
// ----------------------------------------------------------------------------
RDOStudioFrameTheme::RDOStudioFrameTheme(): RDOStyleTheme()
{
	defaultColor    = RGB( 0x00, 0x00, 0x00 );
	backgroundColor = RGB( 0x00, 0x80, 0x80 );

	defaultStyle = RDOStyleFont::NONE;
}

RDOStudioFrameTheme::~RDOStudioFrameTheme()
{
}

RDOStudioFrameTheme& RDOStudioFrameTheme::operator =( const RDOStudioFrameTheme& theme )
{
	RDOStyleTheme::operator=( theme );
	return *this;
}

bool RDOStudioFrameTheme::operator ==( const RDOStudioFrameTheme& theme ) const
{
	return RDOStyleTheme::operator==( theme );
}

bool RDOStudioFrameTheme::operator !=( const RDOStudioFrameTheme& theme ) const
{
	return !(*this == theme);
}

RDOStudioFrameTheme RDOStudioFrameTheme::getDefaultTheme()
{
	RDOStudioFrameTheme theme;
	return theme;
}

// ----------------------------------------------------------------------------
// ---------- RDOStudioFrameStyle
// ----------------------------------------------------------------------------
RDOStudioFrameStyle::RDOStudioFrameStyle(): RDOStyleWithTheme()
{
}

RDOStudioFrameStyle::~RDOStudioFrameStyle()
{
}

void RDOStudioFrameStyle::initTheme()
{
	theme = new RDOStudioFrameTheme;
}

RDOStudioFrameStyle& RDOStudioFrameStyle::operator =( const RDOStudioFrameStyle& style )
{
	RDOStyleWithTheme::operator=( style );
	if ( theme  && style.theme )  *static_cast<RDOStudioFrameTheme*>(theme) = *static_cast<RDOStudioFrameTheme*>(style.theme);

	return *this;
}

bool RDOStudioFrameStyle::operator ==( const RDOStudioFrameStyle& style ) const
{
	bool flag = RDOStyleWithTheme::operator==( style );
	if ( theme  && style.theme && flag ) flag &= *static_cast<RDOStudioFrameTheme*>(theme) == *static_cast<RDOStudioFrameTheme*>(style.theme);
	return flag;
}

bool RDOStudioFrameStyle::operator !=( const RDOStudioFrameStyle& style ) const
{
	return !(*this == style);
}

void RDOStudioFrameStyle::init( const std::string& _regPath )
{
	RDOStyleWithTheme::init( _regPath );
	*font = rdoStyle::RDOStyleFont::getFrameFont();
}
