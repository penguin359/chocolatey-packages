$ErrorActionPreference = 'Stop';
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"  

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  unzipLocation = $toolsDir

  url           = 'https://github.com//chrismaltby/gb-studio/releases/download/v1.2.0/GB-Studio-Windows-32bit-squirrel-1.2.0.zip'
  checksum      = '3924c9832f5f4edd577fc0aacfe00c7b3a995b6ba364006a40ecaae18db83864'
  checksumType  = 'sha256'
  
  url64         = 'https://github.com//chrismaltby/gb-studio/releases/download/v1.2.0/GB-Studio-Windows-64bit-squirrel-1.2.0.zip'
  checksum64    = '0b57324c47509ca8e33488169f21c2faa3b3297653cd6856ee91982f6ba603ca'
  checksumType64= 'sha256'
}

Install-ChocolateyZipPackage @packageArgs

$packageArgs = @{
  packageName = $env:ChocolateyPackageName
  file32      = "$toolsDir\gb-studio-master-windows_x86-squirrel\GB Studio-1.2.0 Setup.exe"
  file64      = "$toolsDir\gb-studio-master-windows_x86_64-squirrel\GB Studio-1.2.0 Setup.exe"
  silentArgs  = '--silent'
}
Install-ChocolateyInstallPackage @packageArgs
