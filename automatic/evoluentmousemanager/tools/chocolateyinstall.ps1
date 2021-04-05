$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  filetype      = 'MSI'

  url           = 'https://evoluent.com/download/EvoSetup-6.0.9.2.msi'
  checksum      = 'D5850394230E8B60A9A3E4EE75B71B99F78316EFF2586626D6F1CCBB47D43F78'
  checksumType  = 'sha256'

  silentArgs    = "/qn /norestart /l*v `"$env:TEMP\$($packageName).$($env:chocolateyPackageVersion).MsiInstall.log`""
}

Install-ChocolateyPackage @packageArgs
