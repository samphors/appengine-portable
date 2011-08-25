@rem download datastore to %APP_HOME%\%DB_DIR%
@rem appcfg.py download_data --application=<app-id> --url=http://<appname>.appspot.com/[remote_api_path] --filename=<data-filename>
@rem appcfg.py upload_data --application=<app-id> --kind=<kind> --filename=<data-filename> <app-directory>

set APP_ID=***SETME***

@set API_PATH=/_ah/remote_api

@set APP_HOME=%~dp0
@set DB_DIR=%APP_HOME%db\
set DB_FILE=%APP_ID%.dump.sql3

@rem set GAEPY=\PortableApps\GAEPyPortable
@set GAEPY=\PortableApps\AppEngine_Portable
@set PYTHONHOME=%GAEPY%\App\python-2.5.4-gae
@set PYTHONNOUSERSITE=1

@if exist "%DB_DIR%%DB_FILE%" echo Database %DB_FILE% already exists. Delete and download again ?
@if exist "%DB_DIR%%DB_FILE%" del /P "%DB_DIR%%DB_FILE%"

@cd %GAEPY%\App\google_appengine

@if exist "%DB_DIR%%DB_FILE%" goto UPLOAD

del bulkloader-log-*
@rem set API_HOST=https://%APP_ID%.appspot.com
set API_HOST=http://%APP_ID%.appspot.com
@echo Download Database from %API_HOST%
%PYTHONHOME%\python.exe appcfg.py download_data --application=%APP_ID% --url=%API_HOST%%API_PATH% --filename=%DB_DIR%%DB_FILE%
@if errorlevel 1 goto ERROR
@echo %DB_FILE% downloaded from %API_HOST%
@del bulkloader-progress-*.sql3
@del bulkloader-results-*.sql3
@pause

:UPLOAD
del bulkloader-log-*
set API_HOST=http://localhost:8080
@echo Upload Database to %API_HOST%
%PYTHONHOME%\python.exe appcfg.py upload_data --url=%API_HOST%%API_PATH% --filename=%DB_DIR%%DB_FILE% %APP_HOME%
@if errorlevel 1 goto ERROR
@echo %DB_FILE% uploaded to %API_HOST%
@del bulkloader-progress-*.sql3
@pause
@del bulkloader-log-*.*
goto END

:ERROR
@echo *** ERROR ***
@pause

:END
@cd %APP_HOME%
@rem echo Finish.
