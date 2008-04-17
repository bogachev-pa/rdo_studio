#ifndef RDO_RUNTIME_H
#define RDO_RUNTIME_H

#include "rdotrace.h"
#include "simtrace.h"
#include "rdo_resource.h"
#include <rdocommon.h>

namespace rdoRuntime
{

// ----------------------------------------------------------------------------
// ---------- RDOResults
// ----------------------------------------------------------------------------
class RDOResults
{
private:
	std::ofstream out;
	virtual std::ostream& getOStream() { return out; }

protected:
	bool isNullResult;

public:
	RDOResults( const char* const fileName ):
		out( fileName, std::ios::out ),
		isNullResult( false )
	{
	}
	RDOResults():
		isNullResult( true )
	{
	}
	virtual ~RDOResults()
	{
	}
	int width( int w ) {
		return isNullResult ? 0 : getOStream().width(w);
	}
	template< class TN > RDOResults& operator << (TN str) {
		if ( !isNullResult ) getOStream() << str;
		return *this;
	}
};

// ----------------------------------------------------------------------------
// ---------- RDORuntime
// ----------------------------------------------------------------------------
class RDOIrregEvent;
class RDORule;
class RDOOperation;
class RDOPROCProcess;
class RDOPMDPokaz;
class RDOPattern;
class RDODPTSearchRuntime;
class RDOCalcEraseRes;
class RDOFRMFrame;
class RDOActivity;
class RDOCalcCreateNumberedResource;

class RDORuntime: public RDOSimulatorTrace
{
friend class RDOFunCalcSelect;
friend class RDOFunCalcExist;
friend class RDOFunCalcNotExist;
friend class RDOFunCalcForAll;
friend class RDOFunCalcNotForAll;
friend class RDOSelectResourceByTypeCalc;
friend class RDOSelectResourceByTypeCommonCalc;
friend class RDOPMDWatchQuant;
friend class RDOPMDWatchValue;
friend class RDOPMDWatchPar;	  
friend class RDOPMDWatchState;

private:
	std::vector< RDOResource* > allResourcesByID;      // ��� ������� ����������, ���� NULL (NULL ����� �� ����� ��� ���������� ���������� �������)
	std::list  < RDOResource* > allResourcesByTime;    // ��� ��, ������ ����������� �� ������� �������� � ��� NULL-��
	std::list  < RDOResource* > allResourcesBeforeSim; // ��� ��, ������ ����������� �� ���� ����� ��������
	std::list< RDOCalc* > initCalcs;

	class BreakPoint: public RDORuntimeObject {
	public:
		std::string name;
		RDOCalc*    calc;
		BreakPoint( RDORuntimeParent* _parent, const std::string& _name, RDOCalc* _calc ):
			RDORuntimeObject( _parent ),
			name( _name ),
			calc( _calc )
		{
		}
	};
	std::list< BreakPoint* > breakPointsCalcs;
	BreakPoint*              lastActiveBreakPoint;

	std::vector< RDOValue >     funcStack;
	std::vector< RDOResource* > groupFuncStack;
	int currFuncTop;
	int savedFuncTop;

	virtual void onInit();
	virtual void onDestroy();

	virtual std::list< RDOResource* > getResourcesBeforeSim() const {
		std::list< RDOResource* > list;
		std::list< RDOResource* >::const_iterator it = allResourcesBeforeSim.begin();
		while ( it != allResourcesBeforeSim.end() ) {
			list.push_back( *it );
			it++;
		}
		return list;
	}

	std::vector< RDOPMDPokaz* > allPokaz;

	RDOActivity* m_currActivity;

	std::vector<RDOValue> patternParameters;

	time_t physic_time;
	virtual void preProcess()
	{
		RDOSimulatorTrace::preProcess();
		physic_time = time(NULL);
	}

	RDOResults* results;
	RDOResults* results_info;

	RDOCalc* terminateIfCalc;
	std::vector< RDOValue > allConstants;

	virtual RDOSimulator* clone();
	virtual bool operator== ( RDOSimulator& other );

	void writeExitCode();

	bool key_found;
	virtual bool isKeyDown();

	typedef std::multimap< UINT, RDORuntimeObject* > Connected;
	Connected connected;

	virtual void onResetPokaz();
	virtual void onCheckPokaz();
	virtual void onAfterCheckPokaz();

public:
	// ������ � �������������
	enum Messages {
		RO_BEFOREDELETE = 0
	};
	void connect( RDORuntimeObject* to, unsigned int message );
	void disconnect( RDORuntimeObject* to );
	void disconnect( RDORuntimeObject* to, unsigned int message );
	void fireMessage( RDORuntimeObject* from, unsigned int message, void* param = NULL );

	std::vector< rdoSimulator::RDOSyntaxError > errors;
	void error( const std::string& message, const RDOCalc* calc = NULL );

	class RDOHotKeyToolkit {
	private:
		std::map< std::string, int > keys;
	public:
		RDOHotKeyToolkit();
		int codeFromString( const std::string& key );
	};
	RDOHotKeyToolkit rdoHotKeyToolkit;

	std::vector< unsigned int > using_scan_codes;
	bool keyDown( unsigned int scan_code );
	void keyUp( unsigned int scan_code );
	bool checkKeyPressed( unsigned int scan_code, bool shift, bool control );
	bool checkAreaActivated( const std::string& oprName );

	void setConstValue( int numberOfConst, RDOValue value );
	RDOValue getConstValue( int numberOfConst );
	void rdoInit( RDOTrace* tracer, RDOResults* customResults, RDOResults* customResultsInfo );

	RDOResults& getResults()     { return *results;      }
	RDOResults& getResultsInfo() { return *results_info; }

	double getTimeNow() { return getCurrentTime(); }
	double getSeconds() { return (time(NULL) - physic_time); }

	RDOActivity* getCurrentActivity() const                   { return m_currActivity;      }
	void         setCurrentActivity( RDOActivity* activity )  { m_currActivity = activity;  }

	void addRuntimeIE       ( RDOIrregEvent *ie   );
	void addRuntimeRule     ( RDORule       *rule );
	void addRuntimeOperation( RDOOperation  *opr  );
	void addRuntimeProcess( RDOPROCProcess* process );
	void addRuntimeDPT( RDODPTSearchRuntime* dpt );
	void addRuntimePokaz( RDOPMDPokaz* pok );
	void addRuntimeFrame( RDOFRMFrame* frame );
	RDOFRMFrame* lastFrame() const;

	const std::vector< RDOPMDPokaz* >& getPokaz() const { return allPokaz; }

	void addInitCalc( RDOCalc* initCalc) { initCalcs.push_back( initCalc ); }

	// ��������� �������
	RDOValue getResParamVal( unsigned int res_id, unsigned int param_id ) const
	{
		RDOResource* res = getResourceByID( res_id );
		return res->getParam( param_id );
	}
	void setResParamVal( unsigned int res_id, unsigned int param_id, const RDOValue& value ) {
		RDOResource* res = getResourceByID( res_id );
		res->setParam( param_id, value );
	}

#ifdef _DEBUG
	std::vector< std::vector< RDOValue > > state;
	bool checkState();
	void showResources( int node ) const;
#endif

	void onEraseRes( const int res_id, const RDOCalcEraseRes* calc );
	RDOResource* createNewResource( unsigned int type, RDOCalcCreateNumberedResource* calc );
	RDOResource* createNewResource( unsigned int type, bool trace );
	void insertNewResource( RDOResource* res );
	RDORuntime();
	~RDORuntime();

	RDOValue getFuncArgument(int numberOfParam); 
	RDOResource* getGroupFuncRes()         { return groupFuncStack.back();                         }
	void pushFuncArgument( RDOValue arg )  { funcStack.push_back( arg );                           }
	void pushGroupFunc( RDOResource* res ) { groupFuncStack.push_back( res );                      }
	void popFuncArgument()                 { funcStack.pop_back();                                 }
	void popGroupFunc()                    { groupFuncStack.pop_back();                            }
	void pushFuncTop()                     { funcStack.push_back( RDOValue(currFuncTop) );         }
	void resetFuncTop( int numArg )        { currFuncTop = funcStack.size() - numArg;              }
	void popFuncTop()                      { currFuncTop = funcStack.back().getInt(); funcStack.pop_back(); }

	virtual bool endCondition();
	void setTerminateIf( RDOCalc* _terminateIfCalc );

	virtual bool breakPoints();
	void insertBreakPoint( const std::string& name, RDOCalc* calc );
	RDOCalc* findBreakPoint( const std::string& name );
	std::string getLastBreakPointName() const;

	RDOResource* getResourceByID( const int num ) const { return num >= 0 ? allResourcesByID.at( num ) : NULL; }

	void setPatternParameter(int parNumb, RDOValue val) 
	{ 
		if(patternParameters.size() <= parNumb) 
			patternParameters.resize(parNumb + 1);

		patternParameters.at(parNumb) = val;
	}
	RDOValue getPatternParameter(int parNumb) 
	{ 
		return patternParameters.at(parNumb);
	}
	std::string writeActivitiesStructure( int& counter );

	std::vector< std::string >  activeAreasMouseClicked;
	std::list< unsigned int >   keysDown;
	std::vector< RDOFRMFrame* > allFrames;

	virtual void onPutToTreeNode();

	rdoSimulator::RDOExitCode whyStop;
	virtual void onNothingMoreToDo() { whyStop = rdoSimulator::EC_NoMoreEvents; }
	virtual void onEndCondition()    { whyStop = rdoSimulator::EC_OK;           }
	virtual void onRuntimeError()    { whyStop = rdoSimulator::EC_RunTimeError; }
	virtual void onUserBreak()       { whyStop = rdoSimulator::EC_UserBreak;    }

	virtual void postProcess();
};

} // namespace rdoRuntime

#endif // RDO_RUNTIME_H
