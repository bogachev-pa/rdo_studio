// This file is generated by omniidl (C++ backend)- omniORB_4_1. Do not edit.

#pragma warning(disable: 4996)
#include "RDOCorba.hh"
#include <omniORB4/IOP_S.h>
#include <omniORB4/IOP_C.h>
#include <omniORB4/callDescriptor.h>
#include <omniORB4/callHandle.h>
#include <omniORB4/objTracker.h>
#pragma warning(default: 4996)


OMNI_USING_NAMESPACE(omni)

static const char* _0RL_library_version = omniORB_4_1;



void
rdoParse::RDOCorba::Param::operator>>= (cdrStream &_n) const
{
  _n.marshalString(m_name,0);
  m_type >>= _n;
  _n.marshalBoolean(m_exist);
  m_id >>= _n;
  m_min_int >>= _n;
  m_max_int >>= _n;
  m_default_int >>= _n;
  m_min_double >>= _n;
  m_max_double >>= _n;
  m_default_double >>= _n;
  (const my_enum&) m_var_enum >>= _n;
  _n.marshalString(m_default_enum,0);

}

void
rdoParse::RDOCorba::Param::operator<<= (cdrStream &_n)
{
  m_name = _n.unmarshalString(0);
  (TypeParam&)m_type <<= _n;
  m_exist = _n.unmarshalBoolean();
  (::CORBA::Long&)m_id <<= _n;
  (::CORBA::Long&)m_min_int <<= _n;
  (::CORBA::Long&)m_max_int <<= _n;
  (::CORBA::Long&)m_default_int <<= _n;
  (::CORBA::Double&)m_min_double <<= _n;
  (::CORBA::Double&)m_max_double <<= _n;
  (::CORBA::Double&)m_default_double <<= _n;
  (my_enum&)m_var_enum <<= _n;
  m_default_enum = _n.unmarshalString(0);

}

void
rdoParse::RDOCorba::MY_RTP::operator>>= (cdrStream &_n) const
{
  _n.marshalString(m_name,0);
  m_type >>= _n;
  _n.marshalBoolean(m_exist);
  (const Params&) m_param >>= _n;

}

void
rdoParse::RDOCorba::MY_RTP::operator<<= (cdrStream &_n)
{
  m_name = _n.unmarshalString(0);
  (TypeRTP&)m_type <<= _n;
  m_exist = _n.unmarshalBoolean();
  (Params&)m_param <<= _n;

}

rdoParse::RDOCorba_ptr rdoParse::RDOCorba_Helper::_nil() {
  return ::rdoParse::RDOCorba::_nil();
}

::CORBA::Boolean rdoParse::RDOCorba_Helper::is_nil(::rdoParse::RDOCorba_ptr p) {
  return ::CORBA::is_nil(p);

}

void rdoParse::RDOCorba_Helper::release(::rdoParse::RDOCorba_ptr p) {
  ::CORBA::release(p);
}

void rdoParse::RDOCorba_Helper::marshalObjRef(::rdoParse::RDOCorba_ptr obj, cdrStream& s) {
  ::rdoParse::RDOCorba::_marshalObjRef(obj, s);
}

rdoParse::RDOCorba_ptr rdoParse::RDOCorba_Helper::unmarshalObjRef(cdrStream& s) {
  return ::rdoParse::RDOCorba::_unmarshalObjRef(s);
}

void rdoParse::RDOCorba_Helper::duplicate(::rdoParse::RDOCorba_ptr obj) {
  if( obj && !obj->_NP_is_nil() )  omni::duplicateObjRef(obj);
}

rdoParse::RDOCorba_ptr
rdoParse::RDOCorba::_duplicate(::rdoParse::RDOCorba_ptr obj)
{
  if( obj && !obj->_NP_is_nil() )  omni::duplicateObjRef(obj);
  return obj;
}

rdoParse::RDOCorba_ptr
rdoParse::RDOCorba::_narrow(::CORBA::Object_ptr obj)
{
  if( !obj || obj->_NP_is_nil() || obj->_NP_is_pseudo() ) return _nil();
  _ptr_type e = (_ptr_type) obj->_PR_getobj()->_realNarrow(_PD_repoId);
  return e ? e : _nil();
}


rdoParse::RDOCorba_ptr
rdoParse::RDOCorba::_unchecked_narrow(::CORBA::Object_ptr obj)
{
  if( !obj || obj->_NP_is_nil() || obj->_NP_is_pseudo() ) return _nil();
  _ptr_type e = (_ptr_type) obj->_PR_getobj()->_uncheckedNarrow(_PD_repoId);
  return e ? e : _nil();
}

rdoParse::RDOCorba_ptr
rdoParse::RDOCorba::_nil()
{
#ifdef OMNI_UNLOADABLE_STUBS
  static _objref_RDOCorba _the_nil_obj;
  return &_the_nil_obj;
#else
  static _objref_RDOCorba* _the_nil_ptr = 0;
  if( !_the_nil_ptr ) {
    omni::nilRefLock().lock();
    if( !_the_nil_ptr ) {
      _the_nil_ptr = new _objref_RDOCorba;
      registerNilCorbaObject(_the_nil_ptr);
    }
    omni::nilRefLock().unlock();
  }
  return _the_nil_ptr;
#endif
}

const char* rdoParse::RDOCorba::_PD_repoId = "IDL:rdoParse/RDOCorba:1.0";


rdoParse::_objref_RDOCorba::~_objref_RDOCorba() {
  
}


rdoParse::_objref_RDOCorba::_objref_RDOCorba(omniIOR* ior, omniIdentity* id) :
   omniObjRef(::rdoParse::RDOCorba::_PD_repoId, ior, id, 1)
   
   
{
  _PR_setobj(this);
}

void*
rdoParse::_objref_RDOCorba::_ptrToObjRef(const char* id)
{
  if( id == ::rdoParse::RDOCorba::_PD_repoId )
    return (::rdoParse::RDOCorba_ptr) this;
  
  if( id == ::CORBA::Object::_PD_repoId )
    return (::CORBA::Object_ptr) this;

  if( omni::strMatch(id, ::rdoParse::RDOCorba::_PD_repoId) )
    return (::rdoParse::RDOCorba_ptr) this;
  
  if( omni::strMatch(id, ::CORBA::Object::_PD_repoId) )
    return (::CORBA::Object_ptr) this;

  return 0;
}

// Proxy call descriptor class. Mangled signature:
//  void_n_clong
class _0RL_cd_0F93BA78401DC9EC_00000000
  : public omniCallDescriptor
{
public:
  inline _0RL_cd_0F93BA78401DC9EC_00000000(LocalCallFn lcfn,const char* op_,size_t oplen,_CORBA_Boolean upcall=0):
     omniCallDescriptor(lcfn, op_, oplen, 0, 0, 0, upcall)
  {
    
  }
  
  void marshalArguments(cdrStream&);
  void unmarshalArguments(cdrStream&);

  void unmarshalReturnedValues(cdrStream&);
  void marshalReturnedValues(cdrStream&);
  
  
  ::CORBA::Long arg_0_;
  ::CORBA::Long* arg_0;
};

void _0RL_cd_0F93BA78401DC9EC_00000000::marshalArguments(cdrStream& _n)
{
  *arg_0 >>= _n;

}

void _0RL_cd_0F93BA78401DC9EC_00000000::unmarshalArguments(cdrStream& _n)
{
  (::CORBA::Long&)arg_0_ <<= _n;
  arg_0 = &arg_0_;

}

void _0RL_cd_0F93BA78401DC9EC_00000000::marshalReturnedValues(cdrStream& _n)
{
  *arg_0 >>= _n;

}

void _0RL_cd_0F93BA78401DC9EC_00000000::unmarshalReturnedValues(cdrStream& _n)
{
  (::CORBA::Long&)*arg_0 <<= _n;

}

// Local call call-back function.
static void
_0RL_lcfn_0F93BA78401DC9EC_10000000(omniCallDescriptor* cd, omniServant* svnt)
{
  _0RL_cd_0F93BA78401DC9EC_00000000* tcd = (_0RL_cd_0F93BA78401DC9EC_00000000*)cd;
  rdoParse::_impl_RDOCorba* impl = (rdoParse::_impl_RDOCorba*) svnt->_ptrToInterface(rdoParse::RDOCorba::_PD_repoId);
  impl->getRDORTPcount(*tcd->arg_0);


}

void rdoParse::_objref_RDOCorba::getRDORTPcount(::CORBA::Long& rtp_count)
{
  _0RL_cd_0F93BA78401DC9EC_00000000 _call_desc(_0RL_lcfn_0F93BA78401DC9EC_10000000, "getRDORTPcount", 15);
  _call_desc.arg_0 = &(::CORBA::Long&) rtp_count;

  _invoke(_call_desc);



}
// Proxy call descriptor class. Mangled signature:
//  void_n_crdoParse_mRDOCorba_mPARAM__count_i_clong
class _0RL_cd_0F93BA78401DC9EC_20000000
  : public omniCallDescriptor
{
public:
  inline _0RL_cd_0F93BA78401DC9EC_20000000(LocalCallFn lcfn,const char* op_,size_t oplen,_CORBA_Boolean upcall=0):
     omniCallDescriptor(lcfn, op_, oplen, 0, 0, 0, upcall)
  {
    
  }
  
  void marshalArguments(cdrStream&);
  void unmarshalArguments(cdrStream&);

  void unmarshalReturnedValues(cdrStream&);
  void marshalReturnedValues(cdrStream&);
  
  
  rdoParse::RDOCorba::PARAM_count_var arg_0_;
  rdoParse::RDOCorba::PARAM_count* arg_0;
  ::CORBA::Long arg_1;
};

void _0RL_cd_0F93BA78401DC9EC_20000000::marshalArguments(cdrStream& _n)
{
  (const rdoParse::RDOCorba::PARAM_count&) *arg_0 >>= _n;
  arg_1 >>= _n;

}

void _0RL_cd_0F93BA78401DC9EC_20000000::unmarshalArguments(cdrStream& _n)
{
  arg_0_ = new rdoParse::RDOCorba::PARAM_count;
  (rdoParse::RDOCorba::PARAM_count&)arg_0_ <<= _n;
  arg_0 = &arg_0_.inout();
  (::CORBA::Long&)arg_1 <<= _n;

}

void _0RL_cd_0F93BA78401DC9EC_20000000::marshalReturnedValues(cdrStream& _n)
{
  (const rdoParse::RDOCorba::PARAM_count&) *arg_0 >>= _n;

}

void _0RL_cd_0F93BA78401DC9EC_20000000::unmarshalReturnedValues(cdrStream& _n)
{
  (rdoParse::RDOCorba::PARAM_count&)*arg_0 <<= _n;

}

// Local call call-back function.
static void
_0RL_lcfn_0F93BA78401DC9EC_30000000(omniCallDescriptor* cd, omniServant* svnt)
{
  _0RL_cd_0F93BA78401DC9EC_20000000* tcd = (_0RL_cd_0F93BA78401DC9EC_20000000*)cd;
  rdoParse::_impl_RDOCorba* impl = (rdoParse::_impl_RDOCorba*) svnt->_ptrToInterface(rdoParse::RDOCorba::_PD_repoId);
  impl->getRDORTPParamscount(*tcd->arg_0, tcd->arg_1);


}

void rdoParse::_objref_RDOCorba::getRDORTPParamscount(RDOCorba::PARAM_count& params_count, ::CORBA::Long rtp_count)
{
  _0RL_cd_0F93BA78401DC9EC_20000000 _call_desc(_0RL_lcfn_0F93BA78401DC9EC_30000000, "getRDORTPParamscount", 21);
  _call_desc.arg_0 = &(RDOCorba::PARAM_count&) params_count;
  _call_desc.arg_1 = rtp_count;

  _invoke(_call_desc);



}
// Proxy call descriptor class. Mangled signature:
//  void_n_crdoParse_mRDOCorba_mGetRTP_i_crdoParse_mRDOCorba_mPARAM__count_i_clong
class _0RL_cd_0F93BA78401DC9EC_40000000
  : public omniCallDescriptor
{
public:
  inline _0RL_cd_0F93BA78401DC9EC_40000000(LocalCallFn lcfn,const char* op_,size_t oplen,_CORBA_Boolean upcall=0):
     omniCallDescriptor(lcfn, op_, oplen, 0, 0, 0, upcall)
  {
    
  }
  
  void marshalArguments(cdrStream&);
  void unmarshalArguments(cdrStream&);

  void unmarshalReturnedValues(cdrStream&);
  void marshalReturnedValues(cdrStream&);
  
  
  rdoParse::RDOCorba::GetRTP_var arg_0_;
  rdoParse::RDOCorba::GetRTP* arg_0;
  rdoParse::RDOCorba::PARAM_count_var arg_1_;
  const rdoParse::RDOCorba::PARAM_count* arg_1;
  ::CORBA::Long arg_2;
};

void _0RL_cd_0F93BA78401DC9EC_40000000::marshalArguments(cdrStream& _n)
{
  (const rdoParse::RDOCorba::GetRTP&) *arg_0 >>= _n;
  (const rdoParse::RDOCorba::PARAM_count&) *arg_1 >>= _n;
  arg_2 >>= _n;

}

void _0RL_cd_0F93BA78401DC9EC_40000000::unmarshalArguments(cdrStream& _n)
{
  arg_0_ = new rdoParse::RDOCorba::GetRTP;
  (rdoParse::RDOCorba::GetRTP&)arg_0_ <<= _n;
  arg_0 = &arg_0_.inout();
  arg_1_ = new rdoParse::RDOCorba::PARAM_count;
  (rdoParse::RDOCorba::PARAM_count&)arg_1_ <<= _n;
  arg_1 = &arg_1_.in();
  (::CORBA::Long&)arg_2 <<= _n;

}

void _0RL_cd_0F93BA78401DC9EC_40000000::marshalReturnedValues(cdrStream& _n)
{
  (const rdoParse::RDOCorba::GetRTP&) *arg_0 >>= _n;

}

void _0RL_cd_0F93BA78401DC9EC_40000000::unmarshalReturnedValues(cdrStream& _n)
{
  (rdoParse::RDOCorba::GetRTP&)*arg_0 <<= _n;

}

// Local call call-back function.
static void
_0RL_lcfn_0F93BA78401DC9EC_50000000(omniCallDescriptor* cd, omniServant* svnt)
{
  _0RL_cd_0F93BA78401DC9EC_40000000* tcd = (_0RL_cd_0F93BA78401DC9EC_40000000*)cd;
  rdoParse::_impl_RDOCorba* impl = (rdoParse::_impl_RDOCorba*) svnt->_ptrToInterface(rdoParse::RDOCorba::_PD_repoId);
  impl->getRDORTPlist(*tcd->arg_0, *tcd->arg_1, tcd->arg_2);


}

void rdoParse::_objref_RDOCorba::getRDORTPlist(RDOCorba::GetRTP& my_rtpList, const RDOCorba::PARAM_count& params_count, ::CORBA::Long rtp_count)
{
  _0RL_cd_0F93BA78401DC9EC_40000000 _call_desc(_0RL_lcfn_0F93BA78401DC9EC_50000000, "getRDORTPlist", 14);
  _call_desc.arg_0 = &(RDOCorba::GetRTP&) my_rtpList;
  _call_desc.arg_1 = &(RDOCorba::PARAM_count&) params_count;
  _call_desc.arg_2 = rtp_count;

  _invoke(_call_desc);



}
rdoParse::_pof_RDOCorba::~_pof_RDOCorba() {}


omniObjRef*
rdoParse::_pof_RDOCorba::newObjRef(omniIOR* ior, omniIdentity* id)
{
  return new ::rdoParse::_objref_RDOCorba(ior, id);
}


::CORBA::Boolean
rdoParse::_pof_RDOCorba::is_a(const char* id) const
{
  if( omni::ptrStrMatch(id, ::rdoParse::RDOCorba::_PD_repoId) )
    return 1;
  
  return 0;
}

const rdoParse::_pof_RDOCorba _the_pof_rdoParse_mRDOCorba;

rdoParse::_impl_RDOCorba::~_impl_RDOCorba() {}


::CORBA::Boolean
rdoParse::_impl_RDOCorba::_dispatch(omniCallHandle& _handle)
{
  const char* op = _handle.operation_name();

  if( omni::strMatch(op, "getRDORTPcount") ) {

    _0RL_cd_0F93BA78401DC9EC_00000000 _call_desc(_0RL_lcfn_0F93BA78401DC9EC_10000000, "getRDORTPcount", 15, 1);
    
    _handle.upcall(this,_call_desc);
    return 1;
  }

  if( omni::strMatch(op, "getRDORTPParamscount") ) {

    _0RL_cd_0F93BA78401DC9EC_20000000 _call_desc(_0RL_lcfn_0F93BA78401DC9EC_30000000, "getRDORTPParamscount", 21, 1);
    
    _handle.upcall(this,_call_desc);
    return 1;
  }

  if( omni::strMatch(op, "getRDORTPlist") ) {

    _0RL_cd_0F93BA78401DC9EC_40000000 _call_desc(_0RL_lcfn_0F93BA78401DC9EC_50000000, "getRDORTPlist", 14, 1);
    
    _handle.upcall(this,_call_desc);
    return 1;
  }


  return 0;
}

void*
rdoParse::_impl_RDOCorba::_ptrToInterface(const char* id)
{
  if( id == ::rdoParse::RDOCorba::_PD_repoId )
    return (::rdoParse::_impl_RDOCorba*) this;
  
  if( id == ::CORBA::Object::_PD_repoId )
    return (void*) 1;

  if( omni::strMatch(id, ::rdoParse::RDOCorba::_PD_repoId) )
    return (::rdoParse::_impl_RDOCorba*) this;
  
  if( omni::strMatch(id, ::CORBA::Object::_PD_repoId) )
    return (void*) 1;
  return 0;
}

const char*
rdoParse::_impl_RDOCorba::_mostDerivedRepoId()
{
  return ::rdoParse::RDOCorba::_PD_repoId;
}

POA_rdoParse::RDOCorba::~RDOCorba() {}

