$ErrorActionPreference = 'Stop';
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  unzipLocation = "$toolsDir"
    
  url           = 'https://drive.google.com/u/0/uc?id=0B-_zVSBz8tNaSFVJTk4zc2dWTWM&export=download'
  checksum      = 'fe6c805b8bd63949176c9325fc64fd8db1a26b7eec8abfecad6ea8bd27545884'
  checksumType  = 'sha256'
  
  silentArgs    = "/qn /norestart /l*v `"$($env:TEMP)\$($packageName).$($env:chocolateyPackageVersion).MsiInstall.log`""
}

Install-ChocolateyZipPackage @packageArgs

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName  
  file          = "$toolsDir\RCKskimmer.exe"
  silentArgs    = '/VERYSILENT /SUPPRESSMSGBOXES /NORESTART /SP- /components=""'
}

Install-ChocolateyInstallPackage @packageArgs