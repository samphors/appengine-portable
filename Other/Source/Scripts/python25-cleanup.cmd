@echo off
@rem Clean out the package, intended to run before packaging
@rem Script must be copied/moved into the application directory
@rem App Engine Portable: http://code.google.com/p/appengine-portable/

set CWD=%~dp0
set PYTHONHOME="%CWD%App\python-2.5.4-gae"

cd %PTHONHOME%

rmdir /S /Q .\Doc
del .\DLLs\_ctypes_test.pyd
del .\DLLs\_msi.pyd
del .\DLLs\_testcapi.pyd
del .\DLLs\_tkinter.pyd
del .\DLLs\winsound.pyd
del .\DLLs\*84.dll
rmdir /S /Q .\include
rmdir /S /Q .\Lib\bsddb\test
rmdir /S /Q .\Lib\ctypes\test
rmdir /S /Q .\Lib\distutils\tests
rmdir /S /Q .\Lib\email\test
rmdir /S /Q .\Lib\idlelib
rmdir /S /Q .\Lib\lib-tk
rmdir /S /Q .\Lib\msilib
@rem rmdir /S /Q .\Lib\site-packages
rmdir /S /Q .\Lib\sqlite3\test
rmdir /S /Q .\Lib\test
del .\libs\_ctypes_test.lib
del .\libs\_msi.lib
del .\libs\_testcapi.lib
del .\libs\_tkinter.lib
del .\libs\winsound.lib

rmdir /S /Q .\tcl
rmdir /S /Q .\Tools

@rem del .\w9xpopen.exe

del /Q /F *.bak
del /Q /F *.msi
@rem del /Q /F *.orig
del /Q /F *.tmp

@rem if exist _PRECOMPILED_.DIR goto END
@rem del /Q /F *.pyc
del /Q /F *.pyo


:END
cd %CWD%
pause
