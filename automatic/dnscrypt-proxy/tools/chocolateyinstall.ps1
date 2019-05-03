$ErrorActionPreference = 'Stop';
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"  

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  destination   = "$toolsDir"
  file          = 'https://github.com/jedisct1/dnscrypt-proxy/releases/download/2.0.22/dnscrypt-proxy-win32-2.0.22.zip'
  file64        = 'https://github.com/jedisct1/dnscrypt-proxy/releases/download/2.0.22/dnscrypt-proxy-win64-2.0.22.zip'
}

Get-ChocolateyUnzip @packageArgs