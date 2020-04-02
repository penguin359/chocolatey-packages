$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
    
  url           = 'https://s3-eu-west-1.amazonaws.com/iawriter/windows/ia_writer_installer_1.2.7320.18263.exe'
  checksum      = 'DB8A3FFC1C4D4A391DEAAAFFAF0770EAA40063A1ED2B583C9F81C21DD2116847'
  checksumType  = 'sha256'

  silentArgs    = "/qn /norestart /l*v `"$env:TEMP\$($packageName).$($env:chocolateyPackageVersion).MsiInstall.log`""
}

Install-ChocolateyPackage @packageArgs
