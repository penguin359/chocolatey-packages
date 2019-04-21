$ErrorActionPreference = 'Stop';
$silentArgs = '/S'

$pp = Get-PackageParameters
if ($pp['DIR']){
  $silentArgs += " /D=`"$($pp['DIR'])`""
}

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  fileType      = 'exe'
  
  url           = 'http://www.w1hkj.com/files/fldigi/fldigi-4.1.03_setup.exe'
  checksum      = 'df64c718d880bf6c5884a51a85ef6feb0021d1b2b132ffa5346a57d0ef5c826a'
  checksumType  = 'sha256'
  
  silentArgs	= $silentArgs
}

Install-ChocolateyPackage @packageArgs
