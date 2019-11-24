$ErrorActionPreference = 'Stop';
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  unzipLocation = "$toolsDir"
  fileType      = 'exe'
  file          = "$toolsDir\zVirtualDesktop.exe"

  url           = 'https://zomp.co/Files.aspx?id=zVD'
  checksum      = 'DA3184B42678216EF780329E89CBDD307E19C9D1FC3474C80F049B1273A36E28'
  checksumType  = 'sha256'
}

if ((Get-Item "HKLM:SOFTWARE\Microsoft\Windows NT\CurrentVersion").GetValue('ReleaseID') -lt "1803") {
  Write-Error "This version of zVirtualDesktop runs only with Windows 10 version 1803 or greater"
  Return
} else {
  Install-ChocolateyZipPackage @packageArgs
  Start-Process -FilePath $packageArgs["file"]
}
