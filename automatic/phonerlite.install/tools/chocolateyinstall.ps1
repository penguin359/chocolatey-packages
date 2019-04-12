$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
    
  url           = 'https://www.phoner.de/PhonerLiteSetup.exe'
  checksum      = '2E58A59EDF817B3F54D0444B649ADE866ABB51DBA9AD1B13A1F143A8CB37CBB1'
  checksumType  = 'sha256'  
  
  silentArgs	= "/VERYSILENT /SUPPRESSMSGBOXES /NORESTART /SP-"
}

Install-ChocolateyPackage @packageArgs