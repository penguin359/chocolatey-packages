$ErrorActionPreference = 'Stop';
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"  

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  unzipLocation = "$toolsDir"

  url           = 'https://www.orfeo-toolbox.org/packages/OTB-7.3.0-Win32.zip'
  checksum      = '1a94e1a4ea0183f3d831c8b366504d3a915dafc86868adf698bc9fd4fcf500dd'
  checksumType  = 'sha256'

  url64         = 'https://www.orfeo-toolbox.org/packages/OTB-7.3.0-Win64.zip'
  checksum64    = '55eb7fec1087d4ca27df2d68c1ba225844207d863f167eb74e6d19e7ef492ef4'
  checksumType64= 'sha256'
}

Install-ChocolateyZipPackage @packageArgs

# Don't create shims for other executables
$files = Get-ChildItem "$toolsDir" -Recurse -Exclude mapla.bat,monteverdi.bat
foreach ($file in $files) {
  New-Item "$file.ignore" -type file -force | Out-Null
}

# Install start menu shortcuts
if (Get-OSArchitectureWidth -compare 32) {
    $architectureWidth = 32
} else {
    $architectureWidth = 64
}
$programs = [environment]::GetFolderPath([environment+specialfolder]::Programs)

$shortcutFilePath = Join-Path $programs "Orfeo Toolbox\Monteverdi.lnk"
$targetPath = Join-Path $toolsDir "OTB-7.0.0-Win${architectureWidth}\monteverdi.bat"
Install-ChocolateyShortcut -iconLocation "$toolsDir\orfeo-toolbox.ico" -shortcutFilePath $shortcutFilePath -targetPath $targetPath

$shortcutFilePath = Join-Path $programs "Orfeo Toolbox\OTB application browser - mapla.lnk"
$targetPath = Join-Path $toolsDir "OTB-7.0.0-Win${architectureWidth}\mapla.bat"
Install-ChocolateyShortcut -iconLocation "$toolsDir\orfeo-toolbox.ico" -shortcutFilePath $shortcutFilePath -targetPath $targetPath
