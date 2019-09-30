$ErrorActionPreference = 'Stop';
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
  packageName = $env:ChocolateyPackageName
  destination = "$toolsDir"
  file64      = "$12.2-win64-sdk.zip"
}

Get-ChocolateyUnzip @packageArgs

foreach ($file in 'embree3.dll', 'OpenImageIO.dll', 'tbb.dll'){
    if (-Not (Test-Path ${env:SystemRoot}\System32\$file -PathType Leaf)){
    Copy-Item $12.2-win64-sdk\lib\$file ${env:SystemRoot}\System32
    }
}

# Install start menu shortcut
$programs = [environment]::GetFolderPath([environment+specialfolder]::Programs)
$shortcutFilePath = Join-Path $programs "Lux Core Render.lnk"
$targetPath = $12.2-win64-sdk\bin\luxcoreui.exe"
Install-ChocolateyShortcut -shortcutFilePath $shortcutFilePath -targetPath $targetPath
