@echo On
@rem Compile all *.py into *.pyc, WARNING: removes *.py for redundancy
@rem Script must be copied/moved into the application directory
@rem GAEPyPortable: http://code.google.com/p/appengine-portable/

set CWD=%~dp0
@set PYTHONHOME=%CWD%App\python-2.5.4-gae
@rem set PYC=%PYTHONHOME%\python.exe %CWD%compileall-gae.py
@set PYC=%PYTHONHOME%\python.exe %CWD%Other\Source\Scripts\compileall-gae.py
@set UNLINK=-u
@set SAFE=-s

@rem set PYTHONOPTIMIZE=1	!DONT_SET!
@set PYTHONNOUSERSITE=1

cd %CWD%App\google_appengine

%PYC% -l .\
%PYC% .\demos\

%PYC% -l .\google\

%PYC% -l .\google\appengine\
%PYC% %UNLINK% .\google\appengine\api\
%PYC% %UNLINK% .\google\appengine\base\
%PYC% %UNLINK% .\google\appengine\cron\
%PYC% %UNLINK% .\google\appengine\datastore\
%PYC% %UNLINK% .\google\appengine\dist\
%PYC% %UNLINK% %SAFE% .\google\appengine\ext\
%PYC% %UNLINK% .\google\appengine\runtime\

@rem .\google\appengine\tools\*.py required
%PYC% .\google\appengine\tools\

%PYC% %UNLINK% .\google\net\
%PYC% %UNLINK% .\google\pyglib\
%PYC% %UNLINK% .\google\storage\


@rem todo: library.zip
%PYC% %UNLINK% .\lib\

%PYC% .\tools\

echo "directory precompiled - all *.py removed"> _PRECOMPILED_.DIR

@cd %CWD%

pause
