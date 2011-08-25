@rem GAEPyPortable: http://code.google.com/p/appengine-portable/
@rem compile all *.py into *.pyc, WARNING: removes *.py for redundancy
@rem Script must be copied/moved into the application directory

set CWD=%~dp0
@set PYTHONHOME=%CWD%App\python-2.5.4-gae
@rem set PYC=%PYTHONHOME%\python.exe %CWD%\compileall.py
@set PYC=%PYTHONHOME%\python.exe %CWD%Other\Source\Scripts\compileall-gae.py
@set UNLINK=-u
@rem set SAFE=-s

@rem set PYTHONOPTIMIZE=1	!DONT_SET!
@set PYTHONNOUSERSITE=1

cd %PYTHONHOME%

%PYC% %UNLINK% .\Lib
echo "directory precompiled - all *.py removed"> .\lib\_PRECOMPILED_.DIR

@rem todo: build library.zip

@cd %CWD%

pause
