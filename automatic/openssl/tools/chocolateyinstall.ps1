$ErrorActionPreference = 'Stop';
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
  packageName = $env:ChocolateyPackageName
  file        = "$toolsDir\Win32OpenSSL-1_1_1d.exe"
  file64      = "$toolsDir\Win64OpenSSL-1_1_1d.exe"
  silentArgs  = "/VERYSILENT /SUPPRESSMSGBOXES /NORESTART /SP-"
}

Install-ChocolateyInstallPackage @packageArgs
$path = Get-AppInstallLocation OpenSSL-Win

Install-ChocolateyPath -PathToInstall "$path\bin"

Set-EnvironmentVariable -Name OPENSSL_CONF -Value "$path\bin\openssl.cfg"
Write-Warning "OPENSSL_CONF has been set to $path\bin\openssl.cfg"