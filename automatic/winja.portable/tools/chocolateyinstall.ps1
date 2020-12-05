$ErrorActionPreference = 'Stop';
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"  

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  unzipLocation = "$toolsDir"  

  url           = 'https://s3.eu-central-1.amazonaws.com/www.phrozen.io/uploads/winja7-1.zip'
  checksum      = 'DD3685B45F833E10DACCC85EA7D1838E4DD0E99E7C32812C06DD0BDAEBA9A6C6'
  checksumType  = 'sha256'  
}

Install-ChocolateyZipPackage @packageArgs

Remove-Item "$toolsDir\setup.exe"

$OSArchitectureWidth = Get-OSArchitectureWidth
if ($OSArchitectureWidth -eq '32') {
  New-Item "$toolsDir\Portable Version\64bit\Winja.exe.ignore" -type file -force
} else {
  New-Item "$toolsDir\Portable Version\32bit\Winja.exe.ignore" -type file -force
}

# Install start menu shortcut
$programs = [environment]::GetFolderPath([environment+specialfolder]::Programs)
$shortcutFilePath = Join-Path $programs "Winja.lnk"
$targetPath = Join-Path "$toolsDir" "Portable Version\${OSArchitectureWidth}bit\Winja.exe"
Install-ChocolateyShortcut -ShortcutFilePath "$shortcutFilePath" -TargetPath "$targetPath"
