/*!
  \copyright (c) RDO-Team, 2003-2012
  \file      rdoeditorbaseedit.h
  \author    ������ ������ (rdo@rk9.bmstu.ru)
  \date      14.03.2003
  \brief     
  \indent    4T
*/

#ifndef _RDO_STUDIO_MFC_RDO_EDIT_RDOEDITORBASEEDIT_H_
#define _RDO_STUDIO_MFC_RDO_EDIT_RDOEDITORBASEEDIT_H_

// ----------------------------------------------------------------------- INCLUDES
// ----------------------------------------------------------------------- SYNOPSIS
#include "app/rdo_studio_mfc/edit_ctrls/rdobaseedit.h"
#include "app/rdo_studio_mfc/rdo_edit/rdoeditoreditstyle.h"
// --------------------------------------------------------------------------------

namespace rdoEditor {

// --------------------------------------------------------------------------------
// -------------------- RDOEditorBaseEdit
// --------------------------------------------------------------------------------
class RDOEditorBaseEdit: public rdoEditCtrl::RDOBaseEdit
{
public:
	RDOEditorBaseEdit(PTR(QWidget) pParent);
	virtual ~RDOEditorBaseEdit();

	void setEditorStyle(PTR(RDOEditorBaseEditStyle) pStyle);

	void replaceCurrent(CREF(tstring) str, int changePosValue = -1) const;

protected:
	tstring kw0;
	tstring kw1;
	tstring kw2;
	tstring kw3;
	tstring getAllKW() const;

	static tstring convertToLexer(CREF(tstring) kw);
};

}; // namespace rdoEditor

#endif // _RDO_STUDIO_MFC_RDO_EDIT_RDOEDITORBASEEDIT_H_
