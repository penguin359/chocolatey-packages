$ErrorActionPreference = 'Stop';
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  unzipLocation = $toolsDir

  url           = 'https://www.softwareok.com/Download/DontSleep_Portable.zip'
  checksum      = '4C0C1920743EF5EDCCFAFB443EC56EB044521AC6FB2A941014FCE5584B3637D9'
  checksumType  = 'sha256'

  url64bit      = 'https://www.softwareok.com/Download/DontSleep_x64_Portable.zip'  
  checksum64    = 'A8252DBF0009165F363B96A39B8149AE2A2AF4EE38EE92E80991284FB472C68C'
  checksumType64= 'sha256'  
}

Install-ChocolateyZipPackage @packageArgs
    
#Install start menu shortcuts
$programs = [environment]::GetFolderPath([environment+specialfolder]::Programs)
if (Get-OSArchitectureWidth -Compare "32") { $exe_file = "DontSleep_p.exe" } else { $exe_file = "DontSleep_x64_p.exe" }

$shortcutFilePath = Join-Path $programs "Dont Sleep.lnk"
$targetPath = Join-Path $toolsDir $exe_file
Install-ChocolateyShortcut -RunAsAdmin -shortcutFilePath $shortcutFilePath -targetPath $targetPath