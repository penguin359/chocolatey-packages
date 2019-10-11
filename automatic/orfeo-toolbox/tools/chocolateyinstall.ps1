$ErrorActionPreference = 'Stop';
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"  

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  unzipLocation = "$toolsDir"

  url           = 'https://www.orfeo-toolbox.org/packages/OTB-6.6.1-Win32.zip'
  checksum      = '683E7B2D6CC3090FAD6688241D091F65F175C4A2B540B3AD181E18714713C490'
  checksumType  = 'sha256'

  url64bit      = 'https://www.orfeo-toolbox.org/packages/OTB-6.6.1-Win64.zip'
  checksum64    = 'E88241444E7BE392B604019FB8AC3554295251BD85019EABA346C9D058F1EB89'
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