$ErrorActionPreference = 'Stop';
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  unzipLocation = $toolsDir

  url           = 'https://download.kde.org/stable/umbrello/latest/win32/umbrello-i686-w64-mingw32-2.27.3-10.4-bin.7z'
  checksum      = 'A31186E99A82DF32D46B12778F1DB4E19DFFB91F0EB2B9FD20CF9247B553EB21'
  checksumType  = 'sha256'
  
  url64bit      = 'https://download.kde.org/stable/umbrello/latest/win64/umbrello-x86_64-w64-mingw32-2.27.3-82.4-bin.7z'
  checksum64    = '629E445C4EC5E42917F3FCAF154BD0700E9D9F39119155A784777106CD7B8BBF'
  checksumType64= 'sha256'  
}

# Shim only umbrello.exe
foreach ( $file in 'dbus-daemon.exe', 'dbus-launch.exe', 'dbus-monitor.exe', 'dbus-send.exe', 'dbus-update-activation-environment.exe', 'drkonqi.exe', 'enchant-lsmod.exe', 'enchant.exe', 'gspawn-win64-helper-console.exe', 'gspawn-win64-helper.exe', 'kbuildsycoca4.exe', 'kcmshell4.exe', 'kconfig_compiler.exe', 'kconf_update.exe', 'kcookiejar4.exe', 'kdbgwin.exe', 'kde4-config.exe', 'kdebugdialog.exe', 'kded4.exe', 'kdeinit4.exe', 'khc_indexbuilder.exe', 'khelpcenter.exe', 'kioslave.exe', 'kio_http_cache_cleaner.exe', 'kjs.exe', 'kjscmd.exe', 'klauncher.exe', 'kmailservice.exe', 'kross.exe', 'ksendbugmail.exe', 'ktelnetservice.exe', 'ktrash.exe', 'kuiserver.exe', 'kwalletd.exe', 'kwinshutdown.exe', 'kwinstartmenu.exe', 'kwrapper4.exe', 'makekdewidgets.exe', 'po2xmi.exe', 'qdbus.exe', 'qdbusviewer.exe', 'update-mime-database.exe', 'xmi2pot.exe' ){
  New-Item -path $toolsDir\umbrello-2.27.3\bin -name "$file.ignore" -type File -force | Out-Null
}

Install-ChocolateyZipPackage @packageArgs
    
# Install start menu shortcut
$programs = [environment]::GetFolderPath([environment+specialfolder]::Programs)
$shortcutFilePath = Join-Path $programs "Umbrello.lnk"
$targetPath = Join-Path $toolsDir "umbrello-2.27.3\bin\umbrello.exe"
Install-ChocolateyShortcut -shortcutFilePath $shortcutFilePath -targetPath $targetPath