$ErrorActionPreference = 'Stop';
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName

  url           = 'http://studio.download.atmel.com/7.0.1931/as-installer-7.0.1931-full.exe'
  checksum      = '4815F78C642968E8727E0B84AC79E8C0D9C8486678BD48224B72685CA4D695AB'
  checksumType  = 'sha256'
  
  silentArgs	= "-q"
}

# This is needed for unattended installation of Drivers
& "C:\Windows\System32\certutil.exe" -addstore "TrustedPublisher" "$toolsDir\certificates\Atmel Norway.cer"
& "C:\Windows\System32\certutil.exe" -addstore "TrustedPublisher" "$toolsDir\certificates\Microchip Technology Inc.cer"

Install-ChocolateyPackage @packageArgs

Write-Warning "Note: atmel-studio needs a reboot to finish automatically the installation."