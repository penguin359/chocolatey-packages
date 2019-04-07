$ErrorActionPreference = 'Stop';
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  unzipLocation = $toolsDir  

  url           = 'https://github.com/olivierkes/manuskript/releases/download/0.9.0/manuskript-0.9.0-win32.zip'
  checksum      = '2C928D4FEE67FD4D94DE813218E9A23650E6880EB6DDD823A3FA5356EBC96DAF'
  checksumType  = 'sha256'
}

Install-ChocolateyZipPackage @packageArgs

#Install start menu shortcuts
$programs = [environment]::GetFolderPath([environment+specialfolder]::Programs)

$shortcutFilePath = Join-Path $programs "Manuskript.lnk"
$targetPath = Join-Path $toolsDir "manuskript\manuskript.exe"
Install-ChocolateyShortcut -shortcutFilePath $shortcutFilePath -targetPath $targetPath