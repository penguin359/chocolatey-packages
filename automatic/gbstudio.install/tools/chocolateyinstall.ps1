$ErrorActionPreference = 'Stop';
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"  

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  unzipLocation = $toolsDir

  url           = 'https://github.com//chrismaltby/gb-studio/releases/download/v1.2.1/GB-Studio-Windows-32bit-squirrel-1.2.1.zip'
  checksum      = '5c3852eabe4fd8f7ad2dd263f607641ecd031a8c3f40c0ab212677e4acfc2846'
  checksumType  = 'sha256'
  
  url64         = 'https://github.com//chrismaltby/gb-studio/releases/download/v1.2.1/GB-Studio-Windows-64bit-squirrel-1.2.1.zip'
  checksum64    = '815362639328196850b71728c9c48aa9507aa19024476b4292c66ae8a60eb1e8'
  checksumType64= 'sha256'
}

Install-ChocolateyZipPackage @packageArgs

$packageArgs = @{
  packageName = $env:ChocolateyPackageName
  file32      = "$toolsDir\gb-studio-master-windows_x86-squirrel\GB Studio-1.2.1 Setup.exe"
  file64      = "$toolsDir\gb-studio-master-windows_x86_64-squirrel\GB Studio-1.2.1 Setup.exe"
  silentArgs  = '--silent'
}
Install-ChocolateyInstallPackage @packageArgs
