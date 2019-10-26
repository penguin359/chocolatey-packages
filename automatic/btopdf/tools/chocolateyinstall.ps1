$ErrorActionPreference = 'Stop';
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"  

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  unzipLocation = "$toolsDir"

  url           = 'https://www.ne.jp/asahi/foresth/home/bpdf085.zip'
  checksum      = '51A9C749DF03D6CFDE36F9BB8186301490FA301AF361F3FE23C94964DF23BB81'
  checksumType  = 'sha256'  
}

Install-ChocolateyZipPackage @packageArgs

# Install start menu shortcuts
$programs = [environment]::GetFolderPath([environment+specialfolder]::Programs)
$shortcutFilePath = Join-Path $programs "BtoPDF.lnk"
$targetPath = Join-Path $toolsDir "BtoPDF.exe"
Install-ChocolateyShortcut -shortcutFilePath $shortcutFilePath -targetPath $targetPath

$programs = [environment]::GetFolderPath([environment+specialfolder]::Programs)
$shortcutFilePath = Join-Path $programs "PtoBMP.lnk"
$targetPath = Join-Path $toolsDir "PtoBMP.exe"
Install-ChocolateyShortcut -shortcutFilePath $shortcutFilePath -targetPath $targetPath
