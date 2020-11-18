$ErrorActionPreference = 'Stop';
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  unzipLocation = "$toolsDir"
  fileType      = 'exe'
  file          = "$toolsDir\zVirtualDesktop.exe"

  url           = 'https://zomp.co/Files.aspx?id=zVD'
  checksum      = '9B04797710882F7E934C84FFADD7FC61FA5BB6C30864B226E63D87223AE4D464'
  checksumType  = 'sha256'
}

if ((Get-Item "HKLM:SOFTWARE\Microsoft\Windows NT\CurrentVersion").GetValue('ReleaseID') -lt "1803") {
  Write-Error "This version of zVirtualDesktop runs only with Windows 10 version 1803 or greater"
  Return
} else {
  Install-ChocolateyZipPackage @packageArgs
  Start-Process -FilePath $packageArgs["file"]
}
