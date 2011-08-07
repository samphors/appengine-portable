
@rem compile all *.py into *.pyc, WARNING: removes *.py for redundancy
@rem script must be copied/moved into the App directory, accompanied by compileall.py

set CWD=%~dp0
@set PYTHONHOME=%CWD%\python-2.5.4-gae
@set PYC=%PYTHONHOME%\python.exe %CWD%\compileall.py
@set UNLINK=-u

@rem set PYTHONOPTIMIZE=1
@set PYTHONNOUSERSITE=1

cd %PYTHONHOME%\

%PYC% %UNLINK% .\Lib\
echo "directory precompiled - all *.py removed"> .\lib\_PRECOMPILED_.WARN

@rem todo: library.zip

@cd %CWD%

pause
