$ErrorActionPreference = 'Stop';
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName  
  unzipLocation = "$toolsDir"

  url           = 'https://download.microsoft.com/download/0/d/9/0d9d81cf-4ef2-4aa5-8cea-95a935ee09c9/PortQryV2.exe'
  checksum      = 'CD9C75B72EE50D2F59D812533CB38B35F67EB31E92F92319842CDC5EFEECFCF4'
  checksumType  = 'sha256'
}

Install-ChocolateyZipPackage @packageArgs

$packageArgs = @{
  packageName = $packageName
  fileType    = 'exe'
  file        = "$toolsDir\PORTQR~1.EXE"
  silentArgs  = "/auto"
}

Install-ChocolateyInstallPackage @packageArgs
Remove-Item -Path $packageArgs.file

Install-BinFile -Name PortQry -Path "C:\PortQryV2\PortQry.exe"