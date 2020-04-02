$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName  = $env:ChocolateyPackageName

  url          = 'https://cdn.textexpander.com/windows/211.31.0/TextExpanderSetup-2.1.1.exe'
  checksum     = 'B25742BFFC81B0C2DDEB378E0C40EB128B027A2911FA4C769983A80240737F63'
  checksumType = 'sha256'

  silentArgs   = '/install /q'
}

Install-ChocolateyPackage @packageArgs
