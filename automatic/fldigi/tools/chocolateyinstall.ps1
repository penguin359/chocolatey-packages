$ErrorActionPreference = 'Stop';
$silentArgs = '/S'

$pp = Get-PackageParameters
if ($pp['DIR']){
  $silentArgs += " /D=`"$($pp['DIR'])`""
}

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  fileType      = 'exe'
  
  url           = 'http://www.w1hkj.com/files/fldigi/fldigi-4.1.02_setup.exe'
  checksum      = '46b145373aab8b8d8783ea32e783c3a26b6fcd0781bcc260a47c38c70a72adcb'
  checksumType  = 'sha256'
  
  silentArgs	= $silentArgs
}

Install-ChocolateyPackage @packageArgs
