$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName  = $env:ChocolateyPackageName
  softwareName = 'QRQ'
  fileType     = 'exe'
  silentArgs   = '/S'
}

$qrq_dir = Get-AppInstallLocation $packageArgs.packageName
Start-Process -Wait -FilePath "$qrq_dir\qrquninstall.exe" -ArgumentList $packageArgs['silentArgs']