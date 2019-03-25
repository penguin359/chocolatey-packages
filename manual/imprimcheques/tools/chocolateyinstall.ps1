$ErrorActionPreference = 'Stop';
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  softwareName  = 'ImprimChèques *'

  unzipLocation = $toolsDir
  fileType      = 'exe'
  file          = "$toolsDir\\imprimcheques\\Install_ImprChq.exe"
  
  url           = 'http://lalimacefolle.com/download/imprimcheques.zip'
  checksum      = '933D45BBD7623105BE19804B96D58E5BB674DC2E054D917B5A76CEF7EBAC0774'
  checksumType  = 'sha256'
  
  silentArgs	= "/VERYSILENT /SUPPRESSMSGBOXES /NORESTART /SP-"
}

Install-ChocolateyZipPackage @packageArgs
Install-ChocolateyInstallPackage @packageArgs