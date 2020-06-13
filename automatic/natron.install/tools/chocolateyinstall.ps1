$ErrorActionPreference = 'Stop';
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName

  url64          = 'https://github.com/NatronGitHub/Natron/releases/download/v2.3.15/Natron-2.3.15-Windows-64.exe'
  checksum64     = '971a54f739da509b078864359028677e024ba400b863c88665889cf19b284318'
  checksumType64 = 'sha256'
}

$NatronDir = "${env:ProgramFiles}\INRIA\Natron-2.3.15"

If ((Test-Path "$NatronDir" -PathType Container) -And ((Get-ChildItem "$NatronDir" | Measure-Object ).Count -eq 1) -And (Test-Path "$NatronDir\NatronSetup.exe" -PathType Leaf)) {
  Remove-Item -Path "$NatronDir\NatronSetup.exe"
}

Start-Process "AutoHotKey" -Verb runas -ArgumentList "`"$toolsDir\chocolateyinstall.ahk`""
Install-ChocolateyPackage @packageArgs

# Close AutoHotKey
$autohotkey = Get-Process AutoHotKey -ErrorAction SilentlyContinue
if ($autohotkey) { $autohotkey | Stop-Process }
