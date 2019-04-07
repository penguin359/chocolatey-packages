$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  file          = "$Env:PROGRAMFILES\$packageName\Uninstall.exe"
  
  silentArgs   = "/S _?=$Env:PROGRAMFILES\$packageName"
  validExitCodes= @(0, 3010, 1605, 1614, 1641)
}

Uninstall-ChocolateyPackage @packageArgs