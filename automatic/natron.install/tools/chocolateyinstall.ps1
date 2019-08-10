$ErrorActionPreference = 'Stop';
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName

  url            = 'https://github.com/NatronGitHub/Natron/releases/download/v2.3.14/Natron-2.3.14-Windows-x86_32bit-setup.exe'
  checksum       = 'a87339879e8b59dd6d0f3d32b349ec3b42c989ca55e108f95e70b03adfa04a57'
  checksumType   = 'sha256'

  url64          = 'https://github.com/NatronGitHub/Natron/releases/download/v2.3.14/Natron-2.3.14-Windows-x86_64bit-setup.exe'
  checksum64     = '7e5365b3964fa2f662719b9eb4748e11f88be37734659badab03e32fc5e01834'
  checksumType64 = 'sha256'
}

$NatronDir = "${env:ProgramFiles}\INRIA\Natron-2.3.14"

If ((Test-Path "$NatronDir" -PathType Container) -And ((Get-ChildItem "$NatronDir" | Measure-Object ).Count -eq 1) -And (Test-Path "$NatronDir\NatronSetup.exe" -PathType Leaf)) {
  Remove-Item -Path "$NatronDir\NatronSetup.exe"
}

Start-Process "AutoHotKey" -Verb runas -ArgumentList "`"$toolsDir\chocolateyinstall.ahk`""
Install-ChocolateyPackage @packageArgs

# Close AutoHotKey
$autohotkey = Get-Process AutoHotKey -ErrorAction SilentlyContinue
if ($autohotkey) { $autohotkey | Stop-Process }