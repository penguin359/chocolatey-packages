$ErrorActionPreference = 'Stop';
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName

  file          = "$toolsDir\sdsetup.exe"
  checksum      = 'EC999737F50B4EAEC71E02D1E46BCC1E50F5BFE89CD35E2764735D78FDCE5303'
  checksumType  = 'sha256'
  
  silentArgs	= '/VERYSILENT /SUPPRESSMSGBOXES /NORESTART /SP-'
}

Install-ChocolateyInstallPackage @packageArgs