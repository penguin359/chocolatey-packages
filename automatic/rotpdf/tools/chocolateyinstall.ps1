$ErrorActionPreference = 'Stop';
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"  

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  unzipLocation = "$toolsDir"

  url           = 'https://www.ne.jp/asahi/foresth/home/rpdf080.zip'
  checksum      = 'DE62E51B1333C26459A6CEAF50515839EC0D2F5A61CB280CC92CFC25C0E0DFF7'
  checksumType  = 'sha256'  
}

Install-ChocolateyZipPackage @packageArgs

# Install start menu shortcut
$programs = [environment]::GetFolderPath([environment+specialfolder]::Programs)
$shortcutFilePath = Join-Path $programs "RotPDF.lnk"
$targetPath = Join-Path $toolsDir "RotPDF.exe"
Install-ChocolateyShortcut -shortcutFilePath $shortcutFilePath -targetPath $targetPath
