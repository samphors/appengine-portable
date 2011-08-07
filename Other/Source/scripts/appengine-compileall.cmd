
@rem compile all *.py into *.pyc, WARNING: removes *.py for redundancy
@rem script must be copied/moved into the App directory, accompanied by compileall.py

set CWD=%~dp0
@set PYTHONHOME=%CWD%\python-2.5.4-gae
@set PYC=%PYTHONHOME%\python.exe %CWD%\compileall.py
@set UNLINK=-u

@rem set PYTHONOPTIMIZE=1
@set PYTHONNOUSERSITE=1

cd .\google_appengine\

%PYC% -l .\
%PYC% .\demos\

%PYC% -l .\google\

%PYC% -l .\google\appengine\
%PYC% %UNLINK% .\google\appengine\api\
%PYC% %UNLINK% .\google\appengine\base\
%PYC% %UNLINK% .\google\appengine\cron\
%PYC% %UNLINK% .\google\appengine\datastore\
%PYC% %UNLINK% .\google\appengine\dist\
%PYC% %UNLINK% .\google\appengine\ext\
%PYC% %UNLINK% .\google\appengine\runtime\

@rem .\google\appengine\tools\*.py required
%PYC% .\google\appengine\tools\

%PYC% %UNLINK% .\google\net\
%PYC% %UNLINK% .\google\pyglib\
%PYC% %UNLINK% .\google\storage\


@rem todo: library.zip
%PYC% %UNLINK% .\lib\

%PYC% .\tools\

echo "directory precompiled - all *.py removed"> _PRECOMPILED_.WARN

@cd %CWD%

pause
