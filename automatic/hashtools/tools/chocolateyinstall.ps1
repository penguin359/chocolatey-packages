$ErrorActionPreference = 'Stop';
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName

  url           = 'https://binaryfortressdownloads.com/Download/BFSFiles/109/HashToolsSetup-4.2.exe'
  checksum      = 'AE52104E9C51D38A05416BC03D6F7AA4EB6736200259A10012D4D2D23B829883'
  checksumType  = 'sha256'
  
  silentArgs	= '/VERYSILENT /SILENT /SUPPRESSMSGBOXES /NORESTART /SP- /components=""'
}

Start-Process "AutoHotKey" -Verb runas -ArgumentList "`"$toolsDir\chocolateyinstall.ahk`""
Install-ChocolateyPackage @packageArgs