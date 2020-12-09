$ErrorActionPreference = 'Stop';
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  unzipLocation = "$toolsDir"
  fileType      = 'exe'
  file          = "$toolsDir\zVirtualDesktop.exe"

  url           = 'https://zomp.co/Files.aspx?id=zVD'
  checksum      = '39F61190DC20E07F21D4B98092700E675E33756D1F51B772262AC413910406DC'
  checksumType  = 'sha256'
}

if ((Get-Item "HKLM:SOFTWARE\Microsoft\Windows NT\CurrentVersion").GetValue('ReleaseID') -lt "1803") {
  Write-Error "This version of zVirtualDesktop runs only with Windows 10 version 1803 or greater"
  Return
} else {
  Install-ChocolateyZipPackage @packageArgs
  Start-Process -FilePath $packageArgs["file"]
}
