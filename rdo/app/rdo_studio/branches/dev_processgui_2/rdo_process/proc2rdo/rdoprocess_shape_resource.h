// rdoprocess_shape_resource.h: interface for the RPShapeResource_MJ class.
//
//////////////////////////////////////////////////////////////////////

#if !defined(AFX_RDOPROCESS_SHAPE_RESOURCE_H__108AB1F9_8742_446F_9CB2_ABD461A09C12__INCLUDED_)
#define AFX_RDOPROCESS_SHAPE_RESOURCE_H__108AB1F9_8742_446F_9CB2_ABD461A09C12__INCLUDED_

#if _MSC_VER > 1000
#pragma once
#endif // _MSC_VER > 1000

#include "app/rdo_studio_mfc/rdo_process/proc2rdo/rdoprocess_shape.h"

class RPShapeResource_MJ : public RPShape_MJ
{
friend class RPMethodProc2RDO_MJ;

private:
	static RPObject* newObject( RPObject* parent );

public:
	RPShapeResource_MJ( RPObject* parent );
	virtual ~RPShapeResource_MJ();

	virtual rp::string getClassName() const { return "RPShapeResource_MJ"; }

	virtual void onLButtonDblClk( UINT nFlags, CPoint global_chart_pos );
	virtual void generate();

	int gamount;

	// ���������������� ����������� ������� saveToXML ��� RPShapeResource_MJ:
	void saveToXML(REF(pugi::xml_node) parentNode);
};

#endif // !defined(AFX_RDOPROCESS_SHAPE_RESOURCE_H__108AB1F9_8742_446F_9CB2_ABD461A09C12__INCLUDED_)
