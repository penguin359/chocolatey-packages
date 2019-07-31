$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName  = $env:ChocolateyPackageName

  url          = 'https://netcologne.dl.sourceforge.net/project/worldofpadman/wop-1.5-full.exe'
  checksum     = '14A8C9FFF681250E9228B2207A204B24127516573F63318251B645B36F65D64C'
  checksumType = 'sha256'
  
  silentArgs   = "/S"
}
Install-ChocolateyPackage @packageArgs

$packageArgs = @{
  packageName  = $env:ChocolateyPackageName
  destination  = "${env:ProgramFiles(x86)}\Padworld Entertainment\World of Padman 1.5"

  url          = 'https://netcologne.dl.sourceforge.net/project/worldofpadman/wop-1.5.x-to-1.6-patch-unified.zip'
  checksum     = 'FE120218823825D742C506B2F448E15BF6CA756B99BC1D11D12749191E12C4C7'
  checksumType = 'sha256'  
}
Install-ChocolateyZipPackage @packageArgs