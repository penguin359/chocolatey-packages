$ErrorActionPreference = 'Stop';
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$win32Dir   = Join-Path $toolsDir 'die_win32_portable'
$programs   = [environment]::GetFolderPath([environment+specialfolder]::Programs)

#Remove the folder from previous versions that were win32 only
if (Test-Path $win32Dir) { Remove-Item -Recurse -Path $win32Dir -ea 0 }

#Remove old shortcut for diel.exe
$shortcutFilePath = Join-Path $programs "Detect It Easy Lite.lnk"
if(Test-Path $shortcutFilePath) { Remove-Item $shortcutFilePath }

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  destination   = "$toolsDir"
  file          = "$toolsDir\die_win32_portable_3.01.zip"
  file64        = "$toolsDir\die_win64_portable_3.01.zip"
}

Get-ChocolateyUnzip @packageArgs

# Install start menu shortcuts
if ((Get-OSArchitectureWidth -compare 32) -or ($env:chocolateyForceX86 -eq $true)) {
    $targetPath = [System.IO.Path]::Combine("$toolsDir", "die_win32_portable", "die.exe")
} else {
    $targetPath = [System.IO.Path]::Combine("$toolsDir", "die_win64_portable", "die.exe")
}

$shortcutFilePath = Join-Path $programs "Detect It Easy.lnk"
Install-ChocolateyShortcut -shortcutFilePath $shortcutFilePath -targetPath $targetPath