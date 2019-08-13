$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName = $env:ChocolateyPackageName  
  silentArgs  = '/S _?=C:\WSJT\wsjtx'
  file        = 'c:\WSJT\wsjtx\Uninstall.exe'
}

Uninstall-ChocolateyPackage @packageArgs