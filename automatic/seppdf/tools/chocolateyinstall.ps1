$ErrorActionPreference = 'Stop';
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"  

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  unzipLocation = "$toolsDir" 

  url           = 'https://www.ne.jp/asahi/foresth/home/spdf326.zip'
  checksum      = '39bc148fedda71aed6ca28e2d2d5a3aa657ea376edf101fa434bf1040a99656e'
  checksumType  = 'sha256'
}

Install-ChocolateyZipPackage @packageArgs

# Install start menu shortcut
$programs = [environment]::GetFolderPath([environment+specialfolder]::Programs)
$shortcutFilePath = Join-Path $programs "SepPDF.lnk"
$targetPath = Join-Path $toolsDir "SepPDF.exe"
Install-ChocolateyShortcut -shortcutFilePath $shortcutFilePath -targetPath $targetPath
