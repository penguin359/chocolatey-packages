$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
    
  url           = 'https://download.sublimetext.com/sublime_merge_build_2054_x64_setup.exe'
  checksum      = 'f11dce6602f9e167ff26fec24e50638d478f0f1073a983e5d64805a0d7c444b8'
  checksumType  = 'sha256'
  
  
  silentArgs	= "/VERYSILENT /SUPPRESSMSGBOXES /NORESTART /SP-"
}

Install-ChocolateyPackage @packageArgs
