$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName

  url          = 'https://www.n3fjp.com/programs/CWTEACHER.exe'
  checksum     = '3908583F86D3840556944A9F3D5404B8C58A0BF184EC75E96377B8D7D7024E85'
  checksumType = 'sha256'

  silentArgs   = '/S /v/qn'
}

Install-ChocolateyPackage @packageArgs