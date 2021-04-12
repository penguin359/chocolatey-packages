$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName  = $env:ChocolateyPackageName
  filetype     = 'MSI'

  url          = 'https://www.realpopup.it/files/RealPopupSetup.msi'
  checksum     = 'dedc1e05895dfdfa1bafc23992257bcbca150f4021c4cbf3aff063eadeb6c9d6'
  checksumType = 'sha256'

  silentArgs   = "/qn /norestart /l*v `"$env:TEMP\$($packageName).$($env:chocolateyPackageVersion).MsiInstall.log`""
}

Install-ChocolateyPackage @packageArgs
