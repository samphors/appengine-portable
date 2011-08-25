# http://portableapps.com/development/portableapps.com_format

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
Var /GLOBAL AppTemp

Function setCustomVars
	BringToFront
	StrCpy $AppName "AppEngine_Python"
	StrCpy $AppVersion "1.5.3-r1"
	; StrCpy $AppTemp "$INSTDIR\Data\Temp\GAEPyPortable"
	StrCpy $AppTemp "$INSTDIR\Data\Temp\$AppName"
FunctionEnd

!macro CustomCodeOptionalCleanup
Call setCustomVars
# check if both files exist
IfFileExists "$INSTDIR\Data\Google\google_appengine_launcher.ini" 0 inicheck1
IfFileExists "$INSTDIR\Data\Google\google_appengine_projects.ini" 0 inicheck1
IfFileExists "$INSTDIR\Data\settings\metapath.ini" 0 inicheck1
IfFileExists "$INSTDIR\Data\settings\notepad2.ini" CustomCodeOptionalCleanup_end
inicheck1:
MessageBox MB_OKCANCEL|MB_ICONEXCLAMATION  "$AppName $AppVersion:$\nInstallation of config files NOT SELECTED (unchecked),$\nand the configuration files do not already exist in$\n$INSTDIR\Data\*\*.ini$\n$\nContinue installation and configure launcher manually on first run ?" /SD IDOK IDOK CustomCodeOptionalCleanup_end
; Abort "Installation Aborted by User [CustomCodeOptionalCleanup]"
Quit
CustomCodeOptionalCleanup_end:
!macroend


!macro CustomCodePreInstall
Call setCustomVars

# skip message and backup on first install
IfFileExists "$INSTDIR\Data\Google" 0 CustomCodePreInstall_end
MessageBox MB_YESNO|MB_ICONQUESTION "$AppName $AppVersion:$\nConfig files already exist in$\n$INSTDIR\Data\Google\google_appengine_*.ini$\n$\nCreate backup copy (*.bak) and continue with installation ?" /SD IDYES IDYES config_backup
Quit
# Goto CustomCodePreInstall_end

config_backup:

CopyFiles /FILESONLY "$INSTDIR\Data\Google\google_appengine_launcher.ini" "$INSTDIR\Data\Google\google_appengine_launcher.ini.bak"
CopyFiles /FILESONLY "$INSTDIR\Data\Google\google_appengine_projects.ini" "$INSTDIR\Data\Google\google_appengine_projects.ini.bak"
CopyFiles /FILESONLY "$INSTDIR\Data\settings\metapath.ini" "$INSTDIR\Data\settings\metapath.ini.bak"
CopyFiles /FILESONLY "$INSTDIR\Data\settings\notepad2.ini" "$INSTDIR\Data\settings\notepad2.ini.bak"

; Copy "$INSTDIR\Data\Google\google_appengine_launcher.ini" "$INSTDIR\Data\Google\google_appengine_launcher.ini.bak"
; Copy "$INSTDIR\Data\Google\google_appengine_projects.ini" "$INSTDIR\Data\Google\google_appengine_projects.ini.bak"

CustomCodePreInstall_end:
!macroend

!macro CustomCodePostInstall
Call setCustomVars
IfFileExists "$AppTemp" 0 renameskip

# move dirs from Temp to App
IfFileExists "$AppTemp\App\google_appengine" 0 rename2
RMDir /r "$INSTDIR\App\google_appengine"
Rename "$AppTemp\App\google_appengine" "$INSTDIR\App\google_appengine"

rename2:
IfFileExists "$AppTemp\App\python-2.5.4-gae" 0 rename3
RMDir /r "$INSTDIR\App\python-2.5.4-gae"
Rename "$AppTemp\App\python-2.5.4-gae" "$INSTDIR\App\python-2.5.4-gae"

rename3:
IfFileExists "$AppTemp\App\bin" 0 rename4
RMDir /r "$INSTDIR\App\bin"
Rename "$AppTemp\App\bin" "$INSTDIR\App\bin"
;CreateShortCut "$INSTDIR\Notepad2.lnk" "$INSTDIR\App\bin\Notepad2.exe"

rename4:

RMDir /r "$AppTemp"
renameskip:

Delete "$INSTDIR\App\AppInfo\installer.ini"
#Delete "$INSTDIR\App\AppInfo\appicon.ico"
#Delete "$INSTDIR\App\AppInfo\appicon_16.png"
#Delete "$INSTDIR\App\AppInfo\appicon_32.png"
Delete "$INSTDIR\App\AppInfo\Launcher\Custom.nsh"
Delete "$INSTDIR\App\AppInfo\Launcher\Debug.nsh"
#RMDir /r "$INSTDIR\Data\PortableApps.comInstaller"
#Delete "$INSTDIR\Other\Source\EULA.txt"
#Delete "$INSTDIR\Other\Source\pluginEULA.txt"
Delete "$INSTDIR\Other\Source\PortableApps.comInstallerCustom.nsh"

MessageBox MB_YESNO|MB_ICONQUESTION "$AppName $AppVersion installed into:$\n$INSTDIR$\n$\nExplore Application directory now ?" /SD IDYES IDNO CustomCodePostInstall_end
ExecShell "explore" "$INSTDIR"
; ExecShell "open" "$INSTDIR"
; ExecShell "open" "file:///$INSTDIR\help.html"
; ExecShell "open" "$WEBSITE"

BringToFront
CustomCodePostInstall_end:
!macroend
