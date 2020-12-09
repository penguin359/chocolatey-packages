$ErrorActionPreference = 'Stop';
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
  packageName = $env:ChocolateyPackageName
  file        = "$toolsDir\Win32OpenSSL-1_1_1i.exe"
  file64      = "$toolsDir\Win64OpenSSL-1_1_1i.exe"
  silentArgs  = '/VERYSILENT /SUPPRESSMSGBOXES /NORESTART /SP-'
}

Install-ChocolateyInstallPackage @packageArgs

New-Item -ItemType File -Path ($packageArgs.file   + '.ignore') -Force | Out-Null
New-Item -ItemType File -Path ($packageArgs.file64 + '.ignore') -Force | Out-Null

$path = Get-AppInstallLocation OpenSSL-Win

Install-ChocolateyPath -PathToInstall "$path\bin"

Install-ChocolateyEnvironmentVariable -VariableName OPENSSL_CONF -VariableValue "$path\bin\openssl.cfg"
Write-Warning "OPENSSL_CONF has been set to $path\bin\openssl.cfg"
