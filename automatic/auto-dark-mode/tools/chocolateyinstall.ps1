$ErrorActionPreference = 'Stop';
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
  packageName = $env:ChocolateyPackageName
  file        = "$toolsDir\AutoDarkMode_Setup.exe"
  silentArgs  = "/VERYSILENT /SUPPRESSMSGBOXES /NORESTART /SP-"
}

if ( [environment]::OSVersion.Version.Major -ne 10 )  {
  Write-Warning "Skipping installation because Auto Dark Mode supports only Windows 10."  
  return
}

Install-ChocolateyInstallPackage @packageArgs