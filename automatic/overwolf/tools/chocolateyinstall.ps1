$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName

  url            = 'https://download.overwolf.com/installer/web_dl_btn2/OverwolfInstaller.exe' 
  file           = "$env:temp\OverwolfInstaller.exe"
  checksum32     = 'D1EEAD86272D3BE627CA223D5D74578A33756FE3F3369BADF16BF7DFCACE1AEE'
  checksumType   = 'sha256'

  silentArgs     = '-silent'
  validExitCodes = @(1223)
}

$result = Invoke-WebRequest -method GET -Uri $packageArgs.url
[System.IO.File]::WriteAllBytes("$env:temp\OverwolfInstaller.exe", $result.content)

Install-ChocolateyInstallPackage @packageArgs

Stop-Process -Name overwolf