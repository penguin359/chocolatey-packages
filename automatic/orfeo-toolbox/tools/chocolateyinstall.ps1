$ErrorActionPreference = 'Stop';
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"  

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  unzipLocation = "$toolsDir"

  url           = 'https://www.orfeo-toolbox.org/packages/OTB-7.2.0-Win32.zip'
  checksum      = '9b33bb04b44e0faf071dc8d5f28433d4473b174fad0f7f0d8f7decee881e35fd'
  checksumType  = 'sha256'

  url64         = 'https://www.orfeo-toolbox.org/packages/OTB-7.2.0-Win64.zip'
  checksum64    = 'abffc801be74da5451159a91412b16a1fc74ed06b44b75ef97d8943b3a313bc5'
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
