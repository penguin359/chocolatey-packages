$ErrorActionPreference = 'Stop';
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
  packageName  = $env:ChocolateyPackageName

  url          = 'https://software.gopro.com/PC/GoPro_Quik-WinInstaller-2.7.0.945.exe'
  checksum     = 'A7B28741E415C5E4D04EAC2768B02A005F28EFF1DF3F6540457DCCD0F3542C66'
  checksumType = 'sha256'
  validExitCodes = @(1)
}

Start-Process "AutoHotKey" -Verb runas -ArgumentList "`"$toolsDir\chocolateyinstall.ahk`""
Install-ChocolateyPackage @packageArgs

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  filetype       = 'MSI'

  file           = "${env:ProgramData}\Package Cache\{AA5F7FCE-311C-46D8-B93A-ABF4DDCAB832}v0.1.945\GDA.msi"
  silentArgs     = "/qn /norestart /l*v `"$($env:TEMP)\$($packageName).$($env:chocolateyPackageVersion).MsiInstall.log`""
  validExitCodes = @(0, 3010, 1641)
}
Install-ChocolateyPackage @packageArgs
