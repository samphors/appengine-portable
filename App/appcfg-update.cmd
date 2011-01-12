@rem copy into the gae-application directory (beside app.yaml) and run

@rem set APP_HOME=%1%

@set APP_HOME=%~dp0
@set GAEPY=\PortableApps\GAEPyPortable
@set PYTHONHOME=%GAEPY%\App\python-2.5.4-gae

@rem set PYTHONOPTIMIZE=1
@set PYTHONNOUSERSITE=1

@cd %GAEPY%\App\google_appengine
%PYTHONHOME%\python.exe appcfg.py update %APP_HOME%
@cd %APP_HOME%

pause
