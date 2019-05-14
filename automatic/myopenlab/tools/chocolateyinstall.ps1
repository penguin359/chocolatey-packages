$ErrorActionPreference = 'Stop';
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"  

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  unzipLocation = $toolsDir
  
  url           = 'https://myopenlab.org/distribution_win32_3.11.0.zip'
  checksum      = '11EA91D3BE029BC4234FB8B2F9886B4D1113B1BC7B99643B714CD0F5D1BEA2DC'
  checksumType  = 'sha256'
  
  url64bit      = 'https://myopenlab.org/distribution_win64_java64_3.11.0.zip'
  checksum64    = '0A1462FD17A3586E7CEFF96E3A1E33F51B4AF5B2522E914ACDFC480E93E08EB8'
  checksumType64= 'sha256'  
}

Install-ChocolateyZipPackage @packageArgs

# Install start menu shortcut
$programs = [environment]::GetFolderPath([environment+specialfolder]::Programs)
$shortcutFilePath = Join-Path $programs "MyOpenLab.lnk"
$targetPath = Join-Path $toolsDir "start_Windows.bat"
Install-ChocolateyShortcut -shortcutFilePath $shortcutFilePath -targetPath $targetPath