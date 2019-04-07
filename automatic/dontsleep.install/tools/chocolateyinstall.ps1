$ErrorActionPreference = 'Stop';
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  unzipLocation = $toolsDir
  fileType      = 'exe'  
    
  url           = 'https://www.softwareok.com/Download/DontSleep.zip'
  checksum      = '41B03DDA64701699F1CF91AA297B849F9303ABEF28BFF40BF07F1D1A04BD53DA'
  checksumType  = 'sha256'

  url64bit      = 'https://www.softwareok.com/Download/DontSleep_x64.zip'
  checksum64    = '6DB37AE36DED2536DE89A3A41AC190BDD8B37BB12BACCD0E89679D4ACB137CA7'
  checksumType64= 'sha256'  
}

Install-ChocolateyZipPackage @packageArgs

#if (Get-OSArchitectureWidth -Compare "32") { $file = "$toolsDir\dontsleep.exe" } else { $file = "$toolsDir\dontsleep_x64.exe" }
#Install-ChocolateyInstallPackage @packageArgs -File $file

#Install start menu shortcuts
$programs = [environment]::GetFolderPath([environment+specialfolder]::Programs)
if (Get-OSArchitectureWidth -Compare "32") { $exe_file = "DontSleep.exe" } else { $exe_file = "DontSleep_x64.exe" }

$shortcutFilePath = Join-Path $programs "Dont Sleep.lnk"
$targetPath = Join-Path $toolsDir $exe_file
Install-ChocolateyShortcut -RunAsAdmin -shortcutFilePath $shortcutFilePath -targetPath $targetPath