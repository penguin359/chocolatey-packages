$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName  = $env:ChocolateyPackageName
  filetype     = 'MSI'

  url          = 'https://www.realpopup.it/files/RealPopupSetup.msi'
  checksum     = 'e1e75f4f5dfdef1839a4663444e57cc5f2239e965a6042d0536f40dfa7f622cd'
  checksumType = 'sha256'

  silentArgs   = "/qn /norestart /l*v `"$env:TEMP\$($packageName).$($env:chocolateyPackageVersion).MsiInstall.log`""
}

Install-ChocolateyPackage @packageArgs
