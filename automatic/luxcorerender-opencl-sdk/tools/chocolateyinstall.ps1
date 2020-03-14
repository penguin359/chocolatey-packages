$ErrorActionPreference = 'Stop';
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
  packageName = $env:ChocolateyPackageName
  destination = "$toolsDir"
  file64      = "$toolsDir\luxcorerender-v2.3-win64-opencl-sdk.zip"
}

Get-ChocolateyUnzip @packageArgs

foreach ($file in 'embree3.dll', 'OpenImageIO.dll', 'tbb.dll'){
    if (-Not (Test-Path ${env:SystemRoot}\System32\$file -PathType Leaf)){
    Copy-Item $toolsDir\luxcorerender-v2.3-win64-opencl-sdk\lib\$file ${env:SystemRoot}\System32
    }
}

# Install start menu shortcut
$programs = [environment]::GetFolderPath([environment+specialfolder]::Programs)
$shortcutFilePath = Join-Path $programs "Lux Core Render.lnk"
$targetPath = Join-Path $toolsDir "luxcorerender-v2.3-win64-opencl-sdk\bin\luxcoreui.exe"
Install-ChocolateyShortcut -shortcutFilePath $shortcutFilePath -targetPath $targetPath
