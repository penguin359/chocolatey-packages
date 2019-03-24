$ErrorActionPreference = 'Stop';
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
# Install botpress to its own directory, not in the chocolatey lib folder
# If requesting per user install use $env:APPDATA else $env:ProgramData
$botpressDir = Join-Path $env:ProgramData $env:ChocolateyPackageName

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  unzipLocation = $botpressDir
  
  url64bit      = 'https://s3.amazonaws.com/botpress-binaries/botpress-v11_6_3-win-x64.zip'  
  checksum64    = '5FAC8869804D92382145391BA308C785D2DA2478D972B8D826BDE9DCEA90C863'
  checksumType64= 'sha256'
}

Install-ChocolateyZipPackage @packageArgs
    
#Install start menu shortcuts
$programs = [environment]::GetFolderPath([environment+specialfolder]::Programs)

$shortcutFilePath = Join-Path $programs "Botpress.lnk"
$targetPath = Join-Path $botpressDir "bp.exe"
Install-ChocolateyShortcut -shortcutFilePath $shortcutFilePath -targetPath $targetPath