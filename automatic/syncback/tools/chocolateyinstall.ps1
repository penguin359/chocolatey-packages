$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName  = $env:ChocolateyPackageName
    
  url          = 'https://www.2brightsparks.com/assets/software/SyncBack_Setup.exe'
  checksum     = 'D5AEF066B828AD2E33D9698B5417D3C2411F34C0777F70379ED650F48ACC2676'
  checksumType = 'sha256'  
  silentArgs   = '/VERYSILENT /SUPPRESSMSGBOXES /NORESTART /SP-'
}

Install-ChocolateyPackage @packageArgs
