$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
    
  url           = 'https://download.sublimetext.com/sublime_merge_build_2020_x64_setup.exe'
  checksum      = 'e8af5a38e0a05365bda56e432bbe7968360e48aa5cfbc0c9cb9b32dacd9e4e75'
  checksumType  = 'sha256'
  
  
  silentArgs	= "/VERYSILENT /SUPPRESSMSGBOXES /NORESTART /SP-"
}

Install-ChocolateyPackage @packageArgs
