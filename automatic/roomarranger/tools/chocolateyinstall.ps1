$ErrorActionPreference = 'Stop';
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  destination   = $toolsDir    
  file          = "$toolsDir\rooarr955.exe"
  file64        = "$toolsDir\rooarr955_64bit.exe"  
  silentArgs	= "/S"
}

Install-ChocolateyInstallPackage @packageArgs

$pp = Get-PackageParameters
 
if ($pp['licenseCode'] -And $pp['licenseName']) {
    $licenseCode = $pp["licenseCode"]
    $licenseName = $pp["licenseName"]
 
    $registrationFile = Join-Path ([environment]::getfolderpath("mydocuments")) "Room Arranger\regbak.rrg"
    "[Options]" > $registrationFile
    "RegName=$licenseName" >> $registrationFile
    "RegNumber=$licenseCode" >> $registrationFile
}