$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName

  url           = 'https://github.com/azirevpn/azclient/releases/download/0.3/AzireVPN-0.3.exe'
  checksum      = 'AD5B961DCCA26687BA322EFDB1D49E8E044F0E1FA6588363B573810C55EB7DB7'
  checksumType  = 'sha256'
  
  silentArgs	= "/S _?=$Env:PROGRAMFILES\$packageName"
}

Install-ChocolateyPackage @packageArgs