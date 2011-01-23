#ifndef RDOLOGSTYLE_H
#define RDOLOGSTYLE_H
#pragma once

#include "rdo_studio/rdostudiostyle.h"

namespace rdoTracerLog {

// ----------------------------------------------------------------------------
// ---------- RDOLogColorPair
// ----------------------------------------------------------------------------
class RDOLogColorPair
{
public:
	RDOLogColorPair();
	virtual ~RDOLogColorPair();

	RDOLogColorPair& operator =( const RDOLogColorPair& colors );
	bool operator ==( const RDOLogColorPair& colors ) const;
	bool operator !=( const RDOLogColorPair& colors ) const;

	virtual void load( std::string regPath, std::string regParam );
	virtual void save( std::string regPath, std::string regParam ) const;

	COLORREF foregroundColor;
	COLORREF backgroundColor;
};

// ----------------------------------------------------------------------------
// ---------- RDOLogTheme
// ----------------------------------------------------------------------------
class RDOLogTheme
{
public:
	RDOLogTheme();
	virtual ~RDOLogTheme();

	RDOLogTheme& operator =( const RDOLogTheme& theme );
	bool operator ==( const RDOLogTheme& theme ) const;
	bool operator !=( const RDOLogTheme& theme ) const;

	virtual void load( std::string regPath );
	virtual void save( std::string regPath ) const;

	rdoStyle::RDOStyleFont::style style;

	RDOLogColorPair defaultColor;
};

// ----------------------------------------------------------------------------
// ---------- RDOLogBorders
// ----------------------------------------------------------------------------
class RDOLogBorders
{
public:
	RDOLogBorders();
	virtual ~RDOLogBorders();

	RDOLogBorders& operator =( const RDOLogBorders& borders );
	bool operator ==( const RDOLogBorders& borders ) const;
	bool operator !=( const RDOLogBorders& borders ) const;

	virtual void load( std::string regPath );
	virtual void save( std::string regPath ) const;

	int vertBorder;
	int horzBorder;
};

// ----------------------------------------------------------------------------
// ---------- RDOLogStyle
// ----------------------------------------------------------------------------
class RDOLogStyle: public rdoStyle::RDOStyle
{
protected:
	virtual void initTheme();
	virtual void initBorders();

public:
	RDOLogStyle();
	virtual ~RDOLogStyle();

	virtual bool getItemColors( const int index, RDOLogColorPair* &colors ) const;
	virtual bool getItemColors( const std::string& item, RDOLogColorPair* &colors ) const;

	RDOLogStyle& operator =( const RDOLogStyle& style );
	bool operator ==( const RDOLogStyle& style ) const;
	bool operator !=( const RDOLogStyle& style ) const;

	virtual void init( const std::string& _regPath = "" );
	virtual bool load();
	virtual bool save() const;

	RDOLogTheme*   theme;
	RDOLogBorders* borders;

	//static RDOLogStyle getDefaultStyle();
};

}; // namespace rdoTracerLog

#endif // RDOLOGSTYLE_H
