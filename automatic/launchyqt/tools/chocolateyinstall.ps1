$ErrorActionPreference = 'Stop';
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
destination     = "$toolsDir"

  file          = "$toolsDir\Launchy-3.0.7-win-x86.7z"
  file64        = "$toolsDir\Launchy-3.0.7-win-amd64.7z"
}

foreach ( $file in 'python.exe', 'pythonw.exe' ) {
  New-Item -path $toolsDir\Launchy-3.0.7-win-amd64 -name "$file.ignore" -type File -force | Out-Null
}

Get-ChocolateyUnzip @packageArgs

# Install start menu shortcut
$programs = [environment]::GetFolderPath([environment+specialfolder]::Programs)
$shortcutFilePath = Join-Path $programs "Launchy.lnk"
$targetPath = Join-Path $toolsDir "Launchy-3.0.7-win-amd64\Launchy.exe"
Install-ChocolateyShortcut -shortcutFilePath $shortcutFilePath -targetPath $targetPath