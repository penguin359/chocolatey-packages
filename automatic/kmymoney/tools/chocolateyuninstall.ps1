$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  validExitCodes= @(0, 3010, 1605, 1614, 1641)
  silentArgs   = "/S _?=$Env:PROGRAMFILES\$packageName"
  file			= "$Env:PROGRAMFILES\$packageName\Uninstall.exe"
}

Uninstall-ChocolateyPackage @packageArgs