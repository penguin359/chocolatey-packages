$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
    
  url           = 'https://download.sublimetext.com/sublime_merge_build_2056_x64_setup.exe'
  checksum      = '009e2736badba37226de3e2ac2bb77113e25be5e46944bf5206c4a88b90d94af'
  checksumType  = 'sha256'
  
  
  silentArgs	= "/VERYSILENT /SUPPRESSMSGBOXES /NORESTART /SP-"
}

Install-ChocolateyPackage @packageArgs
