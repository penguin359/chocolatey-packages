$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName  = $env:ChocolateyPackageName
    
  url          = 'https://download.getdoxie.com/DoxieSetup-2.12.2.exe'
  checksum     = '1FDA2D657ED1C8F54B88325E9CC1D3AE7283231F74DF812CCF17511B399E67D9'
  checksumType = 'sha256'

  silentArgs   = '/VERYSILENT /SUPPRESSMSGBOXES /NORESTART /SP-'
}

Install-ChocolateyPackage @packageArgs
