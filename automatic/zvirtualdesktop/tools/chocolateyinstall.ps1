$ErrorActionPreference = 'Stop';
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  unzipLocation = "$toolsDir"
  fileType      = 'exe'
  file          = "$toolsDir\zVirtualDesktop.exe"
      
  url           = 'https://zomp.co/Files.aspx?id=zVD'
  checksum      = 'E0C15F3A67505C1DDAED0181F074A2D8EE4AA413C7713411EDF72BBA4CBE7114'
  checksumType  = 'sha256'
}

if ((Get-Item "HKLM:SOFTWARE\Microsoft\Windows NT\CurrentVersion").GetValue('ReleaseID') -ge "1803") {
  Install-ChocolateyZipPackage @packageArgs
  Start-Process -FilePath $packageArgs["file"]
} else {
  Write-Error "This version of zVirtualDesktop runs only with Windows 10 version 1803 or greater"
  Return
}
