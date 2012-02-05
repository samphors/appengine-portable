@rem copy into the gae-application directory (beside app.yaml) and run

@rem set APP_HOME=%1%

@set APP_HOME=%~dp0
@rem set GAEPY=\PortableApps\GAEPyPortable
@rem set GAEPY=\PortableApps\AppEngine_Python
@set GAEPY=\PortableApps\AppEngine_Python25
@set PYTHONHOME=%GAEPY%\App\python-2.5.4-gae

@rem set PYTHONOPTIMIZE=1	# DONT_SET
@set PYTHONNOUSERSITE=1

@cd %GAEPY%\App\google_appengine
%PYTHONHOME%\python.exe appcfg.py update %APP_HOME%
@cd %APP_HOME%

pause
