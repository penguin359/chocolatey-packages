$ErrorActionPreference = 'Stop';
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  destination   = "$toolsDir"
  file          = "$toolsDir\Launchy-3.0.9-win-x86.7z"
  file64        = "$toolsDir\Launchy-3.0.9-win-amd64.7z"
}

if (Get-OSArchitectureWidth -Compare "32") {
  $arch = 'x86' ; $noarch = 'amd64'
} else {
  $arch = 'amd64' ; $noarch = 'x86'
}

New-Item -path $toolsDir\Launchy-3.0.9-win-${noarch} -name "$file.ignore" -type File -force | Out-Null

Get-ChocolateyUnzip @packageArgs

# Install start menu shortcut
$programs = [environment]::GetFolderPath([environment+specialfolder]::Programs)
$shortcutFilePath = Join-Path $programs "Launchy.lnk"
$targetPath = Join-Path $toolsDir "Launchy-3.0.9-win-${arch}\Launchy.exe"
Install-ChocolateyShortcut -shortcutFilePath $shortcutFilePath -targetPath $targetPath