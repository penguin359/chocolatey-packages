$ErrorActionPreference = 'Stop';
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
  packageName  = $env:ChocolateyPackageName
  destination  = "$toolsDir"
  fileType     = 'MSI'

  url          = 'https://www.wedev4you.com/Downloader.axd?ctx=app&uuid=4a55194a-5830-4cbf-8140-188e76fae213&fn=LammerContextMenu.v.1.0.3.19.zip&t=635719050030000000&dn=1'
  checksum     = '8a9f80e4102ba667ba9b6f2dcba7e39a4cd3a60c1b221ef03e05d5f47d524e35'
  checksumType = 'sha256' 
}
Install-ChocolateyZipPackage @packageArgs

$packageArgs = @{
  packageName = $env:ChocolateyPackageName  
  file        = "$toolsDir\LammerContextMenu.v1.0.3.19.exe"
  silentArgs  = '/S'
}
Install-ChocolateyInstallPackage @packageArgs