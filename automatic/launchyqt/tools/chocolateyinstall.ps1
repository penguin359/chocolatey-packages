$ErrorActionPreference = 'Stop';
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  unzipLocation = $toolsDir
    
  url           = 'https://github.com/samsonwang/LaunchyQt/releases/download/v3.0.7/Launchy-3.0.7-win-x86.7z'
  checksum      = 'C367E422491EBC591B0B57D78D2C18CC63B44BF9C85C1326A121F920896CCB92'
  checksumType  = 'sha256'
  
  url64bit      = 'https://github.com/samsonwang/LaunchyQt/releases/download/v3.0.7/Launchy-3.0.7-win-amd64.7z'
  checksum64    = 'D580F66CDC44335DFDD9489F60417D89150DB255771E2253982500C3F18AF78C'
  checksumType64= 'sha256'
}

foreach ( $file in 'python.exe', 'pythonw.exe' ) {
  New-Item -path $toolsDir\Launchy-3.0.7-win-amd64 -name "$file.ignore" -type File -force | Out-Null
}

Install-ChocolateyZipPackage @packageArgs

# Install start menu shortcut
$programs = [environment]::GetFolderPath([environment+specialfolder]::Programs)
$shortcutFilePath = Join-Path $programs "Launchy.lnk"
$targetPath = Join-Path $toolsDir "Launchy-3.0.7-win-amd64\Launchy.exe"
Install-ChocolateyShortcut -shortcutFilePath $shortcutFilePath -targetPath $targetPath