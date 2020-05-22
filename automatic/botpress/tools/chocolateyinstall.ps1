$ErrorActionPreference = 'Stop';
# Install botpress to its own directory, not in the chocolatey lib folder
# If requesting per user install use $env:APPDATA else $env:ProgramData
$botpressDir = Join-Path $env:ProgramData $env:ChocolateyPackageName

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  unzipLocation = $botpressDir
  
  url           = 'https://s3.amazonaws.com/botpress-binaries/botpress-v12_9_3-win-x64.zip'  
  checksum      = '7557517fa6804d3ab64cb24f59bc58dbbc1664da061ff2c694700e9c912089ec'
  checksumType  = 'sha256'
}

Install-ChocolateyZipPackage @packageArgs

# Install start menu shortcut
$programs = [environment]::GetFolderPath([environment+specialfolder]::Programs)
$shortcutFilePath = Join-Path $programs "Botpress.lnk"
$targetPath = Join-Path $botpressDir "bp.exe"
Install-ChocolateyShortcut -shortcutFilePath $shortcutFilePath -targetPath $targetPath
