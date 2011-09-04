#include "app/rdo_studio_mfc/pch/pch.h"
#include "app/rdo_studio_mfc/src/thread.h"
#include "app/rdo_studio_mfc/src/model/model.h"
#include "app/rdo_studio_mfc/rdo_tracer/rdotracer.h"

#ifdef _DEBUG
#define new DEBUG_NEW
#undef THIS_FILE
static char THIS_FILE[] = __FILE__;
#endif

#ifdef RDO_MT
// --------------------------------------------------------------------------------
// -------------------- RDOThreadStudio
// --------------------------------------------------------------------------------
RDOThreadStudio::RDOThreadStudio(): RDOThread( "RDOThreadStudio", RDOThread::threadFun )
{
	after_constructor();
}

void RDOThreadStudio::proc( RDOMessageInfo& msg )
{
	switch ( msg.message ) {
		case RT_STUDIO_MODEL_NEW     :
		case RT_STUDIO_MODEL_OPEN    :
		case RT_STUDIO_MODEL_SAVE    :
		case RT_STUDIO_MODEL_SAVE_AS :
		case RT_STUDIO_MODEL_CLOSE   :
		case RT_STUDIO_MODEL_BUILD   :
		case RT_STUDIO_MODEL_RUN     :
		case RT_STUDIO_MODEL_STOP    :
		{
			broadcastMessage( msg.message, msg.param, true );
			break;
		}
	}
}

// --------------------------------------------------------------------------------
// -------------------- RDOThreadStudioGUI
// --------------------------------------------------------------------------------
RDOThreadStudioGUI::RDOThreadStudioGUI(): RDOKernelGUI( "RDOThreadStudioGUI" )
{
	after_constructor();
}
#endif

/*
// --------------------------------------------------------------------------------
// -------------------- RDOThreadStudio1
// --------------------------------------------------------------------------------
RDOThreadStudio1::RDOThreadStudio1(): RDOThreadMT( "RDOThreadStudio1" )
{
	notifies.push_back( RT_RUNTIME_TRACE_STRING );
	after_constructor();
}

void RDOThreadStudio1::proc( RDOMessageInfo& msg )
{
	switch ( msg.message ) {
		case RT_RUNTIME_TRACE_STRING: {
//			::Sleep( 1000 );
			break;
		}
	}
}

// --------------------------------------------------------------------------------
// -------------------- RDOThreadStudio2
// --------------------------------------------------------------------------------
RDOThreadStudio2::RDOThreadStudio2(): RDOThreadMT( "RDOThreadStudio2" )
{
	notifies.push_back( RT_RUNTIME_TRACE_STRING );
	after_constructor();
}

void RDOThreadStudio2::proc( RDOMessageInfo& msg )
{
	switch ( msg.message ) {
		case RT_RUNTIME_TRACE_STRING: {
//			::Sleep( 1000 );
			break;
		}
	}
}
*/
