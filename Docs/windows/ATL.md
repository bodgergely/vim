## Classes

### CAtlModule

This class is used by CAtlDllModuleT Class, CAtlExeModuleT Class, and CAtlServiceModuleT Class to provide support for DLL applications, EXE applications, and Windows services, respectively.

```
class ATL_NO_VTABLE CAtlModule : public _ATL_MODULE
```

### CAtlModuleT

CAtlModuleT, derived from CAtlModule, implements an Executable (EXE) or a Service (EXE) ATL module. 
An Executable module is a local, out-of-process server, whereas a Service module is a Windows application that runs in the background when Windows starts.

CAtlModuleT provides support for initializing, registering, and unregistering of the module.

```
template <class T>
class ATL_NO_VTABLE CAtlModuleT : public CAtlModule
```

### CAtlDllModuleT

CAtlDllModuleT represents the module for a dynamic-link library (DLL) and provides functions used
by all DLL projects. 
This specialization of CAtlModuleT class includes **support for registration**.

```
template <class T>
class ATL_NO_VTABLE CAtlDllModuleT : public CAtlModuleT<T>
```
