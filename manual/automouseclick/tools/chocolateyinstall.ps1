$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
    
  url           = 'https://www.murgee.com/auto-mouse-click/download/setup.exe'
  checksum      = 'E4D7F2E9BB6B958A739264F9361EB84CC5F5726793C90928545D83EE2DCF3E55'
  checksumType  = 'sha256'  
  
  silentArgs	= "/VERYSILENT /SUPPRESSMSGBOXES /NORESTART /SP-"
}

Install-ChocolateyPackage @packageArgs