$ErrorActionPreference = 'Stop';
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  destination   = $toolsDir
    
  file          = "$toolsDir\ccenhancer-install-4.5.4.exe"
  checksum      = '7C7E2B281FEBB2C6F2CE346601D96F8C667A4C9827EE082DCD2E219F6E49C075'
  checksumType  = 'sha256'  

  silentArgs	= "/VERYSILENT /SUPPRESSMSGBOXES /NORESTART /SP-"
}

Install-ChocolateyInstallPackage @packageArgs
