$ErrorActionPreference = 'Stop';
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$silentArgs = '/S'

$pp = Get-PackageParameters
if ($pp['DIR']){
  $silentArgs += " /D=`"$($pp['DIR'])`""
}

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  fileType      = 'exe'
  
  file          = "$toolsDir\fldigi-4.1.01_setup.exe"
  checksum      = '26986F0938FB51E3E321205EB1509167FA7505D4310BBEB84735E407276D7B3F'
  checksumType  = 'sha256'
  
  silentArgs	= "$silentArgs"
}

Install-ChocolateyInstallPackage @packageArgs