$ErrorActionPreference = 'Stop';
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  unzipLocation = $toolsDir
    
  url           = 'https://netix.dl.sourceforge.net/project/qtpfsgui/luminance/2.5.1/Luminance-HDR-x64-v2.5.1.zip'
  checksum      = 'C6291E7A8D2B1CA0C3B2721C759F034B9895E8161318FA94DE3D44169E564F84'
  checksumType  = 'sha256'
}

Install-ChocolateyZipPackage @packageArgs

# Install start menu shortcut
$programs = [environment]::GetFolderPath([environment+specialfolder]::Programs)
$shortcutFilePath = Join-Path $programs "Luminance HDR.lnk"
$targetPath = Join-Path $toolsDir "Luminance HDR\luminance-hdr.exe"
Install-ChocolateyShortcut -shortcutFilePath $shortcutFilePath -targetPath $targetPath