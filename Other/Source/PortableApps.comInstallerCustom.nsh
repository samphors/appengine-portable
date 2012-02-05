# http://portableapps.com/development/portableapps.com_format
# http://nsis.sourceforge.net/Category:Disk,_Path_%26_File_Functions

; No Compression
;SetCompress off
; Fast Compression
;SetCompressor /FINAL zlib
; Best Compression
#SetCompress Auto
#SetCompressor /SOLID lzma
#SetCompressorDictSize 32

;XPStyle on
;TargetMinimalOS 5.1

# Variables:
# $INSTDIR

Var /GLOBAL AppName
Var /GLOBAL AppVersion
Var /GLOBAL PyVer

Var /GLOBAL RootDir
Var /GLOBAL RootTemp
Var /GLOBAL AppDir
Var /GLOBAL AppTemp
Var /GLOBAL DataDir
Var /GLOBAL DataTemp

Function setCustomVars
	BringToFront
	StrCpy $AppName "AppEngine_Python"
	StrCpy $AppVersion "1.6.1"
	StrCpy $PyVer "py25"

	StrCpy $RootDir "$INSTDIR"
	StrCpy $AppDir "$RootDir\App\$PyVer"
	StrCpy $DataDir "$RootDir\Data\$PyVer"

	StrCpy $RootTemp "$INSTDIR\Data\Temp\${AppName}25"
	; StrCpy $RootTemp "$INSTDIR\Data\Temp\$AppName"
	StrCpy $AppTemp "$RootTemp\App\$PyVer"
	StrCpy $DataTemp "$RootTemp\Data\$PyVer"
FunctionEnd

!macro CustomCodeOptionalCleanup
Call setCustomVars

# check if both files exist
IfFileExists "$DataDir\Google\google_appengine_launcher.ini" 0 inicheck1
IfFileExists "$DataDir\Google\google_appengine_projects.ini" 0 inicheck1
IfFileExists "$DataDir\metapath.ini" 0 inicheck1
IfFileExists "$DataDir\notepad2.ini" CustomCodeOptionalCleanup_end
inicheck1:
MessageBox MB_OKCANCEL|MB_ICONEXCLAMATION  "$AppName $AppVersion $PyVer:$\nInstallation of config files NOT SELECTED (unchecked),$\nand the configuration files do not already exist in$\n$INSTDIR\Data\*\*.ini$\n$\nContinue installation and configure launcher manually on first run ?" /SD IDOK IDOK CustomCodeOptionalCleanup_end
; Abort "Installation Aborted by User [CustomCodeOptionalCleanup]"
Quit
CustomCodeOptionalCleanup_end:
!macroend


!macro CustomCodePreInstall
Call setCustomVars

# skip message and backup on first install
IfFileExists "$DataDir\Google" 0 CustomCodePreInstall_end
# MessageBox MB_YESNO|MB_ICONQUESTION "$AppName $AppVersion:$\nConfig files already exist in$\n$DataDir\*\*.ini$\n$\nOverwrite Existing and Create backup copy (*.bak) or continue with installation ?$\n(*.dist files already created for manual review)" /SD IDYES IDYES config_backup
# Quit
MessageBox MB_YESNO|MB_ICONQUESTION "$AppName $AppVersion $PyVer:$\nConfig files already exist in$\n$INSTDIR\Data\py25\*\*.ini$\n$\nOverwrite Existing and Create backup copy (*.bak) or continue with installation ?$\n(*.dist files always created for manual review)" /SD IDYES IDNO CustomCodePreInstall_end
# config_backup:
CopyFiles /FILESONLY "$DataDir\Google\google_appengine_launcher.ini" "$DataDir\Google\google_appengine_launcher.ini.bak"
CopyFiles /FILESONLY "$DataDir\Google\google_appengine_projects.ini" "$DataDir\Google\google_appengine_projects.ini.bak"
CopyFiles /FILESONLY "$DataDir\metapath.ini" "$DataDir\metapath.ini.bak"
CopyFiles /FILESONLY "$DataDir\notepad2.ini" "$DataDir\notepad2.ini.bak"

CustomCodePreInstall_end:
!macroend

!macro CustomCodePostInstall
Call setCustomVars

IfFileExists "$RootTemp" 0 renameskip
# move dirs from Temp to App

rename1:
IfFileExists "$RootTemp\App\bin" 0 rename2
RMDir /r "$RootDir\App\bin"
Rename "$RootTemp\App\bin" "$RootDir\App\bin"

rename2:
# todo: preserve content
IfFileExists "$AppTemp" 0 rename5
RMDir /r "$AppDir"
Rename "$AppTemp" "$AppDir"

#rename2:
## todo: preserve content
#IfFileExists "$AppTemp\site-packages" 0 rename3
#RMDir /r "$AppDir\site-packages"
#Rename "$AppTemp\site-packages" "$AppDir\site-packages"

#rename3:
#IfFileExists "$AppTemp\google_appengine" 0 rename4
#RMDir /r "$AppDir\google_appengine"
#Rename "$AppTemp\google_appengine" "$AppDir\google_appengine"

#rename4:
#IfFileExists "$AppTemp\python-gae" 0 rename5
#RMDir /r "$AppDir\python-gae"
#Rename "$AppTemp\python-gae" "$AppDir\python-gae"

rename5:
# optional documentation, fail silent if not exist
Rename "$RootTemp\Python25_Documentation.chm" "$RootDir\Python25_Documentation.chm"
Rename "$RootTemp\Python25_Documentation.URL" "$RootDir\Python25_Documentation.URL"
Rename "$RootTemp\AppEngine_Python_Documentation.URL" "$RootDir\AppEngine_Python_Documentation.URL"


# aleays create *.dist
IfFileExists "$DataDir\Google" dist1
CopyFiles "$DataTemp\Google" "$DataDir\Google"
dist1:
CopyFiles /FILESONLY "$DataTemp\Google\google_appengine_launcher.ini" "$DataDir\Google\google_appengine_launcher.ini.dist"
CopyFiles /FILESONLY "$DataTemp\Google\google_appengine_projects.ini" "$DataDir\Google\google_appengine_projects.ini.dist"

IfFileExists "$DataDir" dist2
CopyFiles "$DataTemp" "$DataDir"
dist2:
CopyFiles /FILESONLY "$DataTemp\metapath.ini" "$DataDir\metapath.ini.dist"
CopyFiles /FILESONLY "$DataTemp\notepad2.ini" "$DataDir\notepad2.ini.dist"


# remove remaining
RMDir /r "$RootTemp\*.*"
renameskip:

Delete "$RootDir\App\AppInfo\installer.ini"
# Delete "$RootDir\App\AppInfo\appicon.ico"
# Delete "$RootDir\App\AppInfo\appicon1.ico"
# Delete "$RootDir\App\AppInfo\appicon2.ico"
# Delete "$RootDir\App\AppInfo\appicon3.ico"
Delete "$RootDir\App\AppInfo\appicon4.ico"
Delete "$RootDir\App\AppInfo\appicon_16.png"
Delete "$RootDir\App\AppInfo\appicon_32.png"
Delete "$RootDir\App\AppInfo\Launcher\Custom.nsh"
Delete "$RootDir\App\AppInfo\Launcher\Debug.nsh"
#RMDir /r "$RootDir\Data\PortableApps.comInstaller"
Delete "$RootDir\Other\Source\EULA.txt"
Delete "$RootDir\Other\Source\pluginEULA.txt"
Delete "$RootDir\Other\Source\PortableApps.comInstallerCustom.nsh"

MessageBox MB_YESNO|MB_ICONQUESTION "$AppName $AppVersion $PyVer installed into:$\n$INSTDIR$\n$\nExplore Application directory now ?" /SD IDYES IDNO CustomCodePostInstall_end
ExecShell "explore" "$INSTDIR"
; ExecShell "open" "$INSTDIR"
; ExecShell "open" "file:///$INSTDIR\help.html"
; ExecShell "open" "$WEBSITE"

BringToFront
CustomCodePostInstall_end:
!macroend
