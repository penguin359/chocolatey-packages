$ErrorActionPreference = 'Stop';
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"  

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  unzipLocation = "$toolsDir" 

  url           = 'https://www.ne.jp/asahi/foresth/home/spdf330.zip'
  checksum      = '2ae6624415a88cfaac4c24885c5244ce36c576319b5b482903c53d1472ae1240'
  checksumType  = 'sha256'
}

Install-ChocolateyZipPackage @packageArgs

# Install start menu shortcut
$programs = [environment]::GetFolderPath([environment+specialfolder]::Programs)
$shortcutFilePath = Join-Path $programs "SepPDF.lnk"
$targetPath = Join-Path $toolsDir "SepPDF.exe"
Install-ChocolateyShortcut -shortcutFilePath $shortcutFilePath -targetPath $targetPath
