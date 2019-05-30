$ErrorActionPreference = 'Stop';
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName

  url            = 'https://github.com/NatronGitHub/Natron/releases/download/2.3.14/Natron-2.3.14-Windows-x86_32bit-setup.exe'
  checksum       = 'A87339879E8B59DD6D0F3D32B349EC3B42C989CA55E108F95E70B03ADFA04A57'
  checksumType   = 'sha256'
  
  url64          = 'https://github.com/NatronGitHub/Natron/releases/download/2.3.14/Natron-2.3.14-Windows-x86_64bit-setup.exe'
  checksum64     = '7E5365B3964FA2F662719B9EB4748E11F88BE37734659BADAB03E32FC5E01834'
  checksumType64 = 'sha256'
}

$NatronDir = "${env:ProgramFiles}\INRIA\Natron-2.3.14"

If ((Test-Path "$NatronDir" -PathType Container) -And ((Get-ChildItem "$NatronDir" | Measure-Object ).Count -eq 1) -And (Test-Path "$NatronDir\NatronSetup.exe" -PathType Leaf)) {
  Remove-Item -Path "$NatronDir\NatronSetup.exe"
}

Start-Process "AutoHotKey" -Verb runas -ArgumentList "`"$toolsDir\chocolateyinstall.ahk`""
Install-ChocolateyPackage @packageArgs