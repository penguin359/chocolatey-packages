$ErrorActionPreference = 'Stop';
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

[Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls11;

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  destination   = "$toolsDir"

  url           = 'https://ftpmirror.gnu.org/octave/windows/octave-6.3.0-w32-installer.exe'
  checksum      = '01f311d31269bee8e7162bcb08b4df8733957ad136adbd92bf4777360c8aec87'
  checksumType  = 'sha256'

  url64         = 'https://ftpmirror.gnu.org/octave/windows/octave-6.3.0-w64-installer.exe'
  checksum64    = '11faffb1379ac5a6fc25106392f3ae75463712eb98ea4bd086b966d396ff7a30'
  checksumType64= 'sha256'

  # Note: silentArgs doesn't work as expected for octave.install
  # An autohotkey is used as workaround.
  # silentArgs	= "/S"
}

# Don't create shims for any executables
$files = Get-ChildItem "$toolsDir"  -Recurse -Include *.exe -Exclude 'octave-cli.exe'
foreach ($file in $files) {
    New-Item "$file.ignore" -type file -force | Out-Null
}

Start-Process "AutoHotKey" -Verb runas -ArgumentList "`"$toolsDir\chocolateyinstall.ahk`""
Install-ChocolateyPackage @packageArgs
