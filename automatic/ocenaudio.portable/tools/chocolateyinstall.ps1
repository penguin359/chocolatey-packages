$ErrorActionPreference = 'Stop';
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"  

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  unzipLocation = $toolsDir

  url           = 'https://www.ocenaudio.com/downloads/index.php/ocenaudio_portable.zip'
  checksum      = 'b3356cbb44f9d2eb4665c040f4f317ef881123a6cdd85d0c696a5584e582f724'
  checksumType  = 'sha256'

  url64bit      = 'https://www.ocenaudio.com/downloads/index.php/ocenaudio64_portable.zip'
  checksum64    = '132fb9903228d9513eefc1b5a567c6f7403ab090abdfd1e2f36c1d8ba1f6bb25'
  checksumType64= 'sha256'
}

Install-ChocolateyZipPackage @packageArgs

# Install start menu shortcut
$programs = [environment]::GetFolderPath([environment+specialfolder]::Programs)
$shortcutFilePath = Join-Path $programs "Ocenaudio.lnk"
$targetPath = Join-Path $toolsDir "ocenaudio.exe"
Install-ChocolateyShortcut -shortcutFilePath $shortcutFilePath -targetPath $targetPath