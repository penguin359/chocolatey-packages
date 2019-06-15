$ErrorActionPreference = 'Stop';
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"  

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  unzipLocation = $toolsDir

  url           = 'https://github.com/chrismaltby/gb-studio/releases/download/v1.1.0/GB.Studio-win32-ia32-squirrel-1.1.0.zip'
  checksum      = '8DF8AFC82AFF215BE8CE218CD7157950FBB0B80D5C7CA0C88532F765E0146AF5'
  checksumType  = 'sha256'
  
  url64bit      = 'https://github.com/chrismaltby/gb-studio/releases/download/v1.1.0/GB.Studio-win32-x64-squirrel-1.1.0.zip'
  checksum64    = '5C7AD41817685D0AF2E47C6B98CFBE8571C73DC5242495E22F5A8A2DAFF57A06'
  checksumType64= 'sha256'
}

Install-ChocolateyZipPackage @packageArgs

$packageArgs = @{
  packageName = $env:ChocolateyPackageName
  file32      = "$toolsDir\gb-studio-master-windows_x86-squirrel\GB Studio-1.1.0 Setup.exe"
  file64      = "$toolsDir\gb-studio-master-windows_x86_64-squirrel\GB Studio-1.1.0 Setup.exe"
  silentArgs  = '--silent'
}
Install-ChocolateyInstallPackage @packageArgs