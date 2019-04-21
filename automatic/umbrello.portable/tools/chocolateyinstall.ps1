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
Get-ChildItem -Path $toolsDir\umbrello-2.27.3\bin -Recurse -Filter '*.exe' -Exclude 'umbrello.exe' | ForEach-Object {
  New-Item -path $toolsDir\umbrello-2.27.3\bin -name "$($_.Name).ignore" -type File -force | Out-Null
}

Install-ChocolateyZipPackage @packageArgs
    
# Install start menu shortcut
$programs = [environment]::GetFolderPath([environment+specialfolder]::Programs)
$shortcutFilePath = Join-Path $programs "Umbrello.lnk"
$targetPath = Join-Path $toolsDir "umbrello-2.27.3\bin\umbrello.exe"
Install-ChocolateyShortcut -shortcutFilePath $shortcutFilePath -targetPath $targetPath