$ErrorActionPreference = 'Stop';
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  url           = 'https://binaryfortressdownloads.com/Download/BFSFiles/109/HashToolsSetup-4.1.exe'

  checksum      = 'E1BA84C5A76EB5EE73BFA1E1BED94141DAB0F6961A29CAF621007A1E0DE185E3'
  checksumType  = 'sha256'
  
  silentArgs	= '/VERYSILENT /SILENT /SUPPRESSMSGBOXES /NORESTART /SP- /components=""'
}

Start-Process "AutoHotKey" -Verb runas -ArgumentList "`"$toolsDir\chocolateyinstall.ahk`""
Install-ChocolateyPackage @packageArgs