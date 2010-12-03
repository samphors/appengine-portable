
set PYTHONHOME=D:\Devel\Python25
@rem set PYTHONPATH=.
@set PYTHONCASEOK=1

set MINGW_DIR=D:\Devel\MinGW\bin
set GNUWIN32_DIR=D:\Devel\GnuWin32

@set PATH=%PYTHONHOME%;%MINGW_DIR%;%PATH%
@set PY=%PYTHONHOME%\python.exe


@rem python.exe setup.py --help-commands

@rem %PY% setup.py clean
@rem python.exe setup.py build --compiler=mingw32
@rem %PY% setup.py build -c mingw32

@rem python.exe setup.py install --compiler=mingw32
@rem %PY% setup.py bdist
@rem 
%PY% setup.py bdist_wininst --compiler=mingw32

pause
