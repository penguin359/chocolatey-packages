$ErrorActionPreference = 'Stop';
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  url           = 'https://binaryfortressdownloads.com/Download/BFSFiles/109/HashToolsSetup-4.1.exe'

  checksum      = 'E1BA84C5A76EB5EE73BFA1E1BED94141DAB0F6961A29CAF621007A1E0DE185E3'
  checksumType  = 'sha256'
  
  silentArgs	= '/VERYSILENT /SILENT /SUPPRESSMSGBOXES /NORESTART /SP- /components=""'
}

# silent install requires AutoHotKey
$ahkFile = Join-Path $toolsDir 'chocolateyinstall.ahk'
$ahkEXE = Get-ChildItem "$env:ChocolateyInstall\lib\autohotkey.portable" -Recurse -filter autohotkey.exe
$ahkProc = Start-Process -FilePath $ahkEXE.FullName -ArgumentList "$ahkFile" -PassThru

Install-ChocolateyPackage @packageArgs

# Close HashTools due to the automatic startup after installation
Get-Process "HashTools" | Stop-Process