
set APP_HOME=%1%

@set CWD=%~dp0
@set PYTHONHOME=%CWD%\python-2.5.4-gae

@set PYTHONOPTIMIZE=1
@set PYTHONNOUSERSITE=1

@cd .\google_appengine
%PYTHONHOME%\python.exe appcfg.py rollback %APP_HOME%
@cd %CDW%

pause
