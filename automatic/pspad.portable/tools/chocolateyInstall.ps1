$ErrorActionPreference = 'Stop'
$toolsDir = Split-Path -parent $MyInvocation.MyCommand.Definition

$packageArgs = @{
  packageName	= $ENV:ChocolateyPackageName
  unzipLocation = $toolsDir
  file          = Get-Item -path $toolsDir\*.zip

  url			= 'https://www.pspad.com/files/pspad/pspad501en.zip'
  checksumType	= 'sha256'
  checksum		= 'D3B19FDC3FF879282C3671081BEE53B4A9CB61D5857DF29DD2D7F2BF81E34EB8'
    
  validExitCodes =  @(0)
}

# prevent chocolatey from creating shims for supplementary executables
foreach ( $file in 'phpCB.exe', 'TiDy.exe' ) {
  New-Item -path $toolsDir -name "$file.ignore" -type File -force | Out-Null
}

Install-ChocolateyZipPackage @packageArgs

#Install start menu shortcuts
$programs = [environment]::GetFolderPath([environment+specialfolder]::Programs)
$shortcutFilePath = Join-Path $programs "PSPad.lnk"
$targetPath = Join-Path $toolsDir "PSPad.exe"
Install-ChocolateyShortcut -shortcutFilePath $shortcutFilePath -targetPath $targetPath

Remove-Item -path $toolsDir\pspad*.zip -errorAction SilentlyContinue