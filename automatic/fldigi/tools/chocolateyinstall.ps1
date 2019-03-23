$ErrorActionPreference = 'Stop';
$silentArgs = '/S'

$pp = Get-PackageParameters
if ($pp['DIR']){
  $silentArgs += " /D=`"$($pp['DIR'])`""
}

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  fileType      = 'exe'
  
  url           = 'http://www.w1hkj.com/files/fldigi/fldigi-4.1.01_setup.exe'
  checksum      = '26986F0938FB51E3E321205EB1509167FA7505D4310BBEB84735E407276D7B3F'
  checksumType  = 'sha256'
  
  silentArgs	= $silentArgs
}

Install-ChocolateyPackage @packageArgs