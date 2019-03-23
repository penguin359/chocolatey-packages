$ErrorActionPreference = 'Stop';
$silentArgs = '/S'

$pp = Get-PackageParameters
if ($pp['DIR']) {	
  $silentArgs += " /D=`"$($pp['DIR'])`""
}

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  fileType      = 'exe'
  
  url           = 'http://www.w1hkj.com/files/flrig/flrig-1.3.42_setup.exe'
  checksum      = '539DEDF22F4C6F28D9ADA852797ABE73747899326FBCDC08A3B714C45BFFFAAF'
  checksumType  = 'sha256'
  
  silentArgs   = $silentArgs
}

Install-ChocolateyPackage @packageArgs