$ErrorActionPreference = 'Stop';
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  unzipLocation = $toolsDir
  fileType      = 'exe'  
    
  url           = 'https://www.softwareok.com/Download/DontSleep.zip'
  checksum      = 'e5ce32b388d7d6c190f5b47407aa5ee6c1b102a300cc090fc0d422f975554a8a'
  checksumType  = 'sha256'

  url64bit      = 'https://www.softwareok.com/Download/DontSleep_x64.zip'
  checksum64    = 'f13397afe4eea92e976d974c76cb1322643ad5704e33ad76b6bce460d0335372'
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
