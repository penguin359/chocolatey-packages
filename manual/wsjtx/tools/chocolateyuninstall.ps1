$ErrorActionPreference = 'Stop';
$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  validExitCodes= @(0, 3010, 1605, 1614, 1641)
  silentArgs   = '/S _?=C:\WSJT\wsjtx'
  file			= "c:\WSJT\wsjtx\Uninstall.exe"
}

Uninstall-ChocolateyPackage @packageArgs