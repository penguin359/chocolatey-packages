$ErrorActionPreference = 'Stop';
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  destination   = "$toolsDir"
  file          = "$toolsDir\GitExtensions-Portable-3.5.1.12196-9099a1e76.zip"
}

# Prevent chocolatey from creating shims for supplementary executables
foreach ( $file in 'ConEmu.exe', 'ConEmu64.exe', 'ConEmuc.exe', 'ConEmuc64.exe') {
  New-Item -path $toolsDir\GitExtensions\ConEmu -name "$file.ignore" -type File -force | Out-Null
}
foreach ( $file in 'pageant.exe', 'plink.exe', 'puttygen.exe' ) {
  New-Item -path $toolsDir\GitExtensions\PuTTY -name "$file.ignore" -type File -force | Out-Null
}

Install-ChocolateyZipPackage @packageArgs

# Install start menu shortcut
$programs = [environment]::GetFolderPath([environment+specialfolder]::Programs)
$shortcutFilePath = Join-Path $programs "Git Extensions.lnk"
$targetPath = Join-Path $toolsDir "GitExtensions\GitExtensions.exe"
Install-ChocolateyShortcut -RunAsAdmin -shortcutFilePath $shortcutFilePath -targetPath $targetPath
