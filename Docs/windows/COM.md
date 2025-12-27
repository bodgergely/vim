## Links
https://docs.microsoft.com/en-us/windows/win32/learnwin32/module-2--using-com-in-your-windows-program
https://docs.microsoft.com/en-us/windows/win32/com/component-object-model--com--portal


COM was introduced in 1993 to support Object Linking and Embedding (OLE) 2.0

COM is a *binary standard*, not a language standard
It defines the *binary interface* between an application and a software component


## CoInitializeEx

Any Windows program that uses COM must initialize the COM library by calling the *CoInitializeEx* function.
Each thread that uses a COM interface must make a separate call to this function.

For every successful call to CoInitializeEx, you must call *CoUninitialize* before the thread exits. 


## Creating objects

`CoCreateInstance`
