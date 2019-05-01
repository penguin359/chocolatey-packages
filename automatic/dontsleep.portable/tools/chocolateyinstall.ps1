$ErrorActionPreference = 'Stop';
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  unzipLocation = $toolsDir

  url           = 'https://www.softwareok.com/Download/DontSleep_Portable.zip'
  checksum      = 'dec9125c7c2ebdc17e77be0562f324efb5ced8378ae628be6d8c0adcc19864bb'
  checksumType  = 'sha256'

  url64bit      = 'https://www.softwareok.com/Download/DontSleep_x64_Portable.zip'  
  checksum64    = '32bba5f071c9ad3f347a65673e7ba296e084e6dd4651f9f02e5550b10feef4be'
  checksumType64= 'sha256'  
}

Install-ChocolateyZipPackage @packageArgs
    
#Install start menu shortcuts
$programs = [environment]::GetFolderPath([environment+specialfolder]::Programs)
if (Get-OSArchitectureWidth -Compare "32") { $exe_file = "DontSleep_p.exe" } else { $exe_file = "DontSleep_x64_p.exe" }

$shortcutFilePath = Join-Path $programs "Dont Sleep.lnk"
$targetPath = Join-Path $toolsDir $exe_file
Install-ChocolateyShortcut -RunAsAdmin -shortcutFilePath $shortcutFilePath -targetPath $targetPath
