$ErrorActionPreference = 'Stop';
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  destination   = "$toolsDir"
    
  url           = 'https://ftpmirror.gnu.org/octave/windows/octave-5.1.0-w32-installer.exe'
  checksum      = 'D2E4D5821496A0C7533ABB660810BB31C73CF6DC1BC19430B6B35586BC2F5FF9'
  checksumType  = 'sha256'
  
  url64         = 'https://ftpmirror.gnu.org/octave/windows/octave-5.1.0-w64-installer.exe'
  checksum64    = '9F80C37BAF041BD741C2660E7E5E12AFBD19DAAB7E59AABA96288E630282122B'
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