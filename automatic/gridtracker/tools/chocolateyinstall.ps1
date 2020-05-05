$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName  = $env:ChocolateyPackageName

  url          = 'https://uc5d43b1e75df1e4ca0be856771e.dl.dropboxusercontent.com/cd/0/get/A3GDMa5OxUR8yI7GE8qM7-3yAwQxM5FjdcMWIhvPSy24fObx1Zwgu_TL9auQBBLzDYs-LXQTY6wadAzb-DJLytn9jnq06_DDw9JJR5igqG_5ToN0u39YfrV0zZ8ulKqU2ko/file?dl=1#'
  checksum     = '0a0cbd42c4ad36854dff1401f76228d29c8ed47d7df38dff128fb094c8c30dad'
  checksumType = 'sha256'

  silentArgs   = '/S'
}

Install-ChocolateyPackage @packageArgs
