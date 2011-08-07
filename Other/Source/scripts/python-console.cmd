
@rem call python comandline
@rem must be copied/moved into the application directory

set CWD=%~dp0
@set PYTHONHOME=%CWD%\python-2.5.4-gae

@set PYTHONOPTIMIZE=1
@set PYTHONNOUSERSITE=1

@cd .\google_appengine
%PYTHONHOME%\python.exe
@cd %CWD%

pause
