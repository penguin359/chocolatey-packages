$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName

  url           = 'https://www.bandlab.com/download/assistant/windows'
  checksum      = '7f8ff1e8886caed93ab6dd916acedc641d1463ee596dbd730cc5d6202b9ad1143f798cdd4a697f4b1069ed65c191f679da2d4f140608d9a522c5048ed09b1ab2'
  checksumType  = 'sha512'

  silentArgs    = '/S'
}

Install-ChocolateyPackage @packageArgs
