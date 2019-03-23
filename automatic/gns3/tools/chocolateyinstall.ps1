$ErrorActionPreference = 'Stop';
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName  
  
  url           = 'https://github.com/GNS3/gns3-gui/releases/download/v2.1.15/GNS3-2.1.15-all-in-one.exe'
  checksum      = '98DE258AF4D0190260E232891B44440552E591B6465059A0AE2DE45245BABAEC'
  checksumType  = 'sha256'
  
  #silentArgs	= "_?=$Env:PROGRAMFILES\GNS3"
}

# silent install requires AutoHotKey
$ahkFile = Join-Path $toolsDir 'chocolateyinstall.ahk'
$ahkEXE = Get-ChildItem "$env:ChocolateyInstall\lib\autohotkey.portable" -Recurse -filter autohotkey.exe
$ahkProc = Start-Process -FilePath $ahkEXE.FullName -ArgumentList "$ahkFile" -PassThru

Install-ChocolateyPackage @packageArgs