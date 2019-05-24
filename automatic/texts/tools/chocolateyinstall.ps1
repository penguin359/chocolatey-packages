$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  filetype      = "msi"

  url           = 'http://www.texts.io/Texts-1.5.msi'
  checksum      = 'F696FBF90D00315C179DE2E070C3BC6131488DE5D4E06F8DE150D952BA0A1C79'
  checksumType  = 'sha256'
  
  silentArgs	= "/qn /norestart /l*v `"$env:Temp\$env:ChocolateyPackageName.$env:chocolateyPackageVersion.MsiInstall.log`""
}

Install-ChocolateyPackage @packageArgs
