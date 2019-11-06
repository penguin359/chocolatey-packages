$ErrorActionPreference = 'Stop';
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  unzipLocation = $toolsDir  

  url           = 'https://dennisbabkin.com/php/downloads/WakeupOnStandBy.zip'
  checksum      = '44f69df199b1476930d7f9db8fce96493ee90ea3651b49f8749a47559594531a'
  checksumType  = 'sha256'
}

Install-ChocolateyZipPackage @packageArgs

#Install start menu shortcuts
$programs = [environment]::GetFolderPath([environment+specialfolder]::Programs)

$shortcutFilePath = Join-Path $programs "WakeupOnStandBy.lnk"
$targetPath = Join-Path $toolsDir "wosb.exe"
Install-ChocolateyShortcut -shortcutFilePath $shortcutFilePath -targetPath $targetPath
