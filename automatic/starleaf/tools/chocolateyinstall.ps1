$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
    
  url           = 'https://dl.starleaf.com/app/StarLeaf-Installer-Windows.exe'
  checksum      = '1531950A21A85F33C67700901AC6C1AE68B2661E9C8EB6CE8BA5D5A3C3777124'
  checksumType  = 'sha256'
  
  
  silentArgs    = "/S _?=$Env:PROGRAMFILES\$packageName"
}

Install-ChocolateyPackage @packageArgs
