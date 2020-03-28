$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  fileType      = 'MSI'

  url           = 'https://download.adobe.com/pub/connect/updaters/meeting/10_6/Connect2020_1_5.msi'
  checksum      = '6834E6ADCB988A43AC2838C7676AF6E2E8823214A3749378EB3103CBE2734EEF'
  checksumType  = 'sha256'

  silentArgs    = "/qn /norestart /l*v `"$env:TEMP\$($packageName).$($env:chocolateyPackageVersion).MsiInstall.log`""
}

Install-ChocolateyPackage @packageArgs