$ErrorActionPreference = 'Stop';
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"  

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  unzipLocation = "$toolsDir"

  url           = 'http://www.sigord.co.uk/Submits/Morsetest.zip'
  checksum      = 'A33CC43EE94FE7DBD386282683BF071AB370D7B11A793FCA612DDBF506048775'
  checksumType  = 'sha256'  
}

Install-ChocolateyZipPackage @packageArgs

# Install start menu shortcuts
$programs = [environment]::GetFolderPath([environment+specialfolder]::Programs)

$shortcutFilePath = Join-Path $programs "MorseCode.lnk"
$targetPath = Join-Path $toolsDir "Morsetest\MorseCode.exe"
Install-ChocolateyShortcut -shortcutFilePath "$shortcutFilePath" -targetPath "$targetPath"

$shortcutFilePath = Join-Path $programs "MorseTest.lnk"
$targetPath = Join-Path $toolsDir "Morsetest2\Morsetest.exe"
Install-ChocolateyShortcut -shortcutFilePath "$shortcutFilePath" -targetPath "$targetPath"
