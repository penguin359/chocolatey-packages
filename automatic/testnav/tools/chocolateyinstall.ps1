$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  filetype      = 'MSI'

  url           = 'https://download.testnav.com/_testnavinstallers/testnav-1.9.7.msi'
  checksum      = '9bf198d2cc96444c483c56dc6b1ab98f2a94ba7bd2a99f89e59918198ed52ebc'
  checksumType  = 'sha256'

  silentArgs    = "/qn /norestart /l*v `"$($env:TEMP)\$($packageName).$($env:chocolateyPackageVersion).MsiInstall.log`""
}

Install-ChocolateyPackage @packageArgs