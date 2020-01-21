$ErrorActionPreference = 'Stop';
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"  

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  unzipLocation = "$toolsDir"

  url           = 'https://www.orfeo-toolbox.org/packages/OTB-7.0.0-Win32.zip'
  checksum      = '351db080cb3f13540397c8bb32eee1b735be720234e4b76cd9368d93092c4785'
  checksumType  = 'sha256'

  url64         = 'https://www.orfeo-toolbox.org/packages/OTB-7.0.0-Win64.zip'
  checksum64    = '708d06aadca48497ead55a34b23286fff5147f446a5d7f6bec1042eeb6678bcf'
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
$targetPath = Join-Path $toolsDir "OTB-6.6.1-Win${architectureWidth}\monteverdi.bat"
Install-ChocolateyShortcut -iconLocation "$toolsDir\orfeo-toolbox.ico" -shortcutFilePath $shortcutFilePath -targetPath $targetPath

$shortcutFilePath = Join-Path $programs "Orfeo Toolbox\OTB application browser - mapla.lnk"
$targetPath = Join-Path $toolsDir "OTB-6.6.1-Win${architectureWidth}\mapla.bat"
Install-ChocolateyShortcut -iconLocation "$toolsDir\orfeo-toolbox.ico" -shortcutFilePath $shortcutFilePath -targetPath $targetPath
