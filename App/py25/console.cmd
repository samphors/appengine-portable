@echo ***
@echo path and environment set to google_appengine sdk python 2.5:
@echo %%HOME%%=%HOME%
@echo %%PYTHONHOME%%=%PYTHONHOME%
@rem echo PATH=%PATH%
@echo type 'python' for interactive interpreter, 'exit' to quit
@echo ***
@echo.
@cmd.exe /T:0B /X /D $*
