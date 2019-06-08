$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
    
  url           = 'https://download.sublimetext.com/sublime_merge_build_1116_x64_setup.exe'
  checksum      = '6ec76dc241755b6bacb075bd0c575e25b04979cf8a35a725249dbee1c8ebeb9f'
  checksumType  = 'sha256'
  
  
  silentArgs	= "/VERYSILENT /SUPPRESSMSGBOXES /NORESTART /SP-"
}

Install-ChocolateyPackage @packageArgs
