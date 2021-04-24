$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName  = $env:ChocolateyPackageName
  filetype     = 'MSI'

  url          = 'https://egnyte-cdn.egnyte.com/egnytedrive/win/en-us/3.11.0/EgnyteDesktopApp_3.11.0_47.msi'
  checksum     = 'ba299f9a96a2923aeda87c06ec9ecb1157431dbbe6fbbecf39e7e2240dc43537'
  checksumType = 'sha256'  

  silentArgs   = "/qn /norestart /l*v `"$env:TEMP\$($packageName).$($env:chocolateyPackageVersion).MsiInstall.log`""
}

Install-ChocolateyPackage @packageArgs
