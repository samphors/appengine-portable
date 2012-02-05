@echo on
@rem Clean out the package, intended to run before packaging
@rem Script must be copied/moved into the application directory
@rem App Engine Portable: http://code.google.com/p/appengine-portable/

set CWD=%~dp0
@rem set GAEHOME="%CWD%App\google_appengine"
set GAEHOME="%CWD%App\py25\google_appengine"

cd %GAEHOME%

del /Q /F .\lib\antlr3\*.*
rmdir /S /Q .\lib\antlr3\antlr_python_runtime.egg-info

del /Q /F .\lib\django_0_96\*.*
rmdir /S /Q .\lib\django_0_96\django\test
rmdir /S /Q .\lib\django_0_96\docs
rmdir /S /Q .\lib\django_0_96\scripts

del /Q /F .\lib\django_1_2\*.*
rmdir /S /Q .\lib\django_1_2\django\test
rmdir /S /Q .\lib\django_1_2\docs
rmdir /S /Q .\lib\django_1_2\extras
rmdir /S /Q .\lib\django_1_2\scripts
rmdir /S /Q .\lib\django_1_2\tests

@rem del /Q /F .\lib\webapp2\*
rmdir /S /Q .\lib\webapp2\docs
rmdir /S /Q .\lib\webapp2\tests
rmdir /S /Q .\lib\webapp\webapp2.egg-info

del /Q /F .\lib\webob\*.*
rmdir /S /Q .\lib\webob\docs
rmdir /S /Q .\lib\webob\tests
rmdir /S /Q .\lib\webob\WebOb.egg-info

del /Q /F .\lib\yaml\*.*
rmdir /S /Q .\lib\yaml\examples

@rem if exist _PRECOMPILED_.DIR goto END
@rem del /Q /F *.bak
@rem del /Q /F *.tmp
@rem del /Q /F *.orig

@rem :END
cd %CWD%
pause
