#include "pch.h"
#include "rdoparser_corba.h"
#include "rdortp.h"
#include <rdo_resources.h>
#include <rdoruntime_object.h>

namespace rdoParse
{

// ----------------------------------------------------------------------------
// ---------- RDOParserCorbaRTP
// ----------------------------------------------------------------------------
void RDOParserCorbaRTP::parse()
{
/*
	// ��� ���� ��������� ��� ���� �������� � ������� ���,
	// ������ � ������� ����� ����� �����, ������� ������ ���� ��������
	// � ��������� RTP � ����������� ���� �����


	// ���������� ���������� ����� ��������
	unsigned int rtp_count = 1;

	// �������� ������ ���� ����� ��������
	rdoMBuilder::RDOResTypeList rtpList( m_parser );

	for ( unsigned int i = 0; i < rtp_count; i++ )
	{
		// ������� ����� ��� �������
		rdoMBuilder::RDOResType rtp( "MyRTP" );
		// ��������� ��� �����������
		rtp.m_params.append( rdoMBuilder::RDOResType::Param("p1", rdoRuntime::g_int) );
		rtp.m_params.append( rdoMBuilder::RDOResType::Param("p2", rdoRuntime::g_int) );
		// �������� ��� � ������ ������������
		if ( rtpList.append( rtp ) )
		{
			// �������� �������
		}
		else
		{
			// �������, ��������, ��� � ����� ������ ��� ����
		}
	}
*/
}

// ----------------------------------------------------------------------------
// ---------- RDOParserCorbaRSS
// ----------------------------------------------------------------------------
void RDOParserCorbaRSS::parse()
{
	// ��� ���� ��������� ��� ������� � ������� ���

	// ���������� ���������� ��������
	unsigned int rss_count = 1;

	// �������� ������ ���� ����� ��������
	rdoMBuilder::RDOResTypeList rtpList( m_parser );
	// �������� ������ ���� ��������
	rdoMBuilder::RDOResourceList rssList( m_parser );

	for ( unsigned int i = 0; i < rss_count; i++ )
	{
		// ������� ����� ������
		rdoMBuilder::RDOResource rss( rtpList["�����������"], "MyRSS1" );
		// ��������� ��� ���������
		rss["������������_max"] = 174;
		// ��������� ��� � ������ ������������
		if ( rssList.append<rdoParse::RDORSSResource>( rss ) )
		{
			// �������� �������
		}
		else
		{
			// �������
		}
		// ������ �������� ������� �� �������������
		if ( rssList.exist("qqq") )
		{
		}
	}
}

} // namespace rdoParse
