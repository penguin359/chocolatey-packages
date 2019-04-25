$ErrorActionPreference = 'Stop';
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  unzipLocation = $toolsDir
  
  url           = 'https://github.com/gitextensions/gitextensions/releases/download/v3.0.2/GitExtensions-Portable-3.0.2.5232.zip'
  checksum      = 'A826E36826296C752EF6F37E8FEC629C4C7AF56DE5755435AE635CF305FF5A06'
  checksumType  = 'sha256'
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