@rem script to clean out the package, always run before packaging

@echo off

set PYTHONHOME="%~dp0\python-2.5.4-gae"

rmdir /S /Q %PYTHONHOME%\Doc
del %PYTHONHOME%\DLLs\_ctypes_test.pyd
del %PYTHONHOME%\DLLs\_msi.pyd
del %PYTHONHOME%\DLLs\_testcapi.pyd
del %PYTHONHOME%\DLLs\_tkinter.pyd
del %PYTHONHOME%\DLLs\winsound.pyd
del %PYTHONHOME%\DLLs\*84.dll
rmdir /S /Q %PYTHONHOME%\include
rmdir /S /Q %PYTHONHOME%\Lib\bsddb\test
rmdir /S /Q %PYTHONHOME%\Lib\ctypes\test
rmdir /S /Q %PYTHONHOME%\Lib\distutils\tests
rmdir /S /Q %PYTHONHOME%\Lib\email\test
rmdir /S /Q %PYTHONHOME%\Lib\idlelib
rmdir /S /Q %PYTHONHOME%\Lib\lib-tk
rmdir /S /Q %PYTHONHOME%\Lib\msilib
@rem rmdir /S /Q %PYTHONHOME%\Lib\site-packages
rmdir /S /Q %PYTHONHOME%\Lib\sqlite3\test
rmdir /S /Q %PYTHONHOME%\Lib\test
del %PYTHONHOME%\libs\_ctypes_test.lib
del %PYTHONHOME%\libs\_msi.lib
del %PYTHONHOME%\libs\_testcapi.lib
del %PYTHONHOME%\libs\_tkinter.lib
del %PYTHONHOME%\libs\winsound.lib

rmdir /S /Q %PYTHONHOME%\tcl
rmdir /S /Q %PYTHONHOME%\Tools

del %PYTHONHOME%\w9xpopen.exe

del /S *.msi
del /S *.pyc
del /S *.pyo
del /S *.bak

pause
