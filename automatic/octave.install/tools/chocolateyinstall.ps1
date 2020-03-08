$ErrorActionPreference = 'Stop';
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  destination   = "$toolsDir"
    
  url           = 'https://mirror.cyberbits.eu/gnu/octave/windows/octave-5.2.0_1-w32-installer.exe'
  checksum      = '9b9a3f17014ce1aec9d97d417db9e469d2523408a77415c2b1eebeedd6a28da9'
  checksumType  = 'sha256'
  
  url64         = 'https://mirror.cyberbits.eu/gnu/octave/windows/octave-5.2.0_1-w64-installer.exe'
  checksum64    = 'b35f85c93dea126922560c04e6cb472c19e457c44d9a8898b4561db1107e9094'
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
