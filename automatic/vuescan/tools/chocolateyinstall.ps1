$ErrorActionPreference = 'Stop';
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName

  url           = 'https://d2bwyyzfw77fhf.cloudfront.net/vuex6496.exe'
  checksum      = '92C52C3C27A19E9353EDE74D30B98B91C44DB944913A21612D594F7C5EA2DC4A'
  checksumType  = 'sha256'
}

# This is needed for unattended installation of Drivers
& "C:\Windows\System32\certutil.exe" -addstore "TrustedPublisher" "$toolsDir\certificates\Hamrick Software.cer" | Out-Null

Start-Process "AutoHotKey" -Verb runas -ArgumentList "`"$toolsDir\chocolateyinstall.ahk`""
Install-ChocolateyPackage @packageArgs