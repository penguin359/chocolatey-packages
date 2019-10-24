$ErrorActionPreference = 'Stop';
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  unzipLocation = "$toolsDir"
  fileType      = 'exe'
  file          = "$toolsDir\zVirtualDesktop.exe"

  url           = 'https://zomp.co/Files.aspx?id=zVD'
  checksum      = '2C27697CF6BFED6B12CBD94CAD7BAD68FDB39DD09B967A75C0CD68F2BF239550'
  checksumType  = 'sha256'
}

if ((Get-Item "HKLM:SOFTWARE\Microsoft\Windows NT\CurrentVersion").GetValue('ReleaseID') -lt "1803") {
  Write-Error "This version of zVirtualDesktop runs only with Windows 10 version 1803 or greater"
  Return
} else {
  Install-ChocolateyZipPackage @packageArgs
  Start-Process -FilePath $packageArgs["file"]
}
