$ErrorActionPreference = 'Stop';
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"  

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  unzipLocation = $toolsDir    

  url           = 'https://files.soramimi.jp/skympc/1.6.4/SkyMPC-1.6.4-windows.zip'
  checksum      = '9A1B83017225E5761AACB77C7CA560CF7BF92FC7B83B8BFAB7E12E0AFA37C1F8'
  checksumType  = 'sha256'
}

Install-ChocolateyZipPackage @packageArgs

#Install start menu shortcuts
$programs = [environment]::GetFolderPath([environment+specialfolder]::Programs)

$shortcutFilePath = Join-Path $programs "SkyMPC.lnk"
$targetPath = Join-Path $toolsDir "SkyMPC\SkyMPC.exe"
Install-ChocolateyShortcut -shortcutFilePath $shortcutFilePath -targetPath $targetPath