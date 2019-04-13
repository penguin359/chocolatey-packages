$ErrorActionPreference = 'Stop';
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"  

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  unzipLocation = $toolsDir

  url           = 'https://github.com/jedisct1/dnscrypt-proxy/releases/download/2.0.22/dnscrypt-proxy-win32-2.0.22.zip'
  checksum      = '03B44A55B73C85028D76B81A934825E3EAE5EED10EEEC3FF35472D51ABFEE378'
  checksumType  = 'sha256'
  
  url64bit      = 'https://github.com/jedisct1/dnscrypt-proxy/releases/download/2.0.22/dnscrypt-proxy-win64-2.0.22.zip'
  checksum64    = 'DA9990CAF5DF0EA476015A1E752245774D153DD537227BAE3890E891A29E8BD9'
  checksumType64= 'sha256'  
}

Install-ChocolateyZipPackage @packageArgs
Write-Warning "DNSCrypt Proxy is installed in $toolsDir."