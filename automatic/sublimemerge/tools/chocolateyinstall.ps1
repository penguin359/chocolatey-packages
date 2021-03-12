$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
    
  url           = 'https://download.sublimetext.com/sublime_merge_build_2049_x64_setup.exe'
  checksum      = 'd15c3bf66e0c26b75f1c35aa39d514256d6e3453c2f64f047580a9497f1805eb'
  checksumType  = 'sha256'
  
  
  silentArgs	= "/VERYSILENT /SUPPRESSMSGBOXES /NORESTART /SP-"
}

Install-ChocolateyPackage @packageArgs
