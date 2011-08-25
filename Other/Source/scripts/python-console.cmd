@rem Call up Python commandline from Windows Explorer, setup env like launcher
@rem Script must be copied/moved into the application directory
@rem GAEPyPortable: http://code.google.com/p/appengine-portable/

set CWD=%~dp0
@set PYTHONHOME=%CWD%App\python-2.5.4-gae
@set PYTHONUSERBASE=%CWD%Data

@rem set PYTHONOPTIMIZE=1	!DONT_SET!
@set PYTHONNOUSERSITE=1
@rem set PYTHONVERBOSE=1

@cd %CWD%App\google_appengine

%PYTHONHOME%\python.exe

@cd %CWD%

pause
