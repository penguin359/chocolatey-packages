$ErrorActionPreference = 'Stop';
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
    
  file          = 'https://freefr.dl.sourceforge.net/project/vdfiltermod/VirtualDub%20pack/version%2020/VirtualDub2_43385.zip'
  checksum      = '9A87A5CD949251616A41D20CD2253BFD1B1E60090ED5BEFF79D9D2F9377F5D41'
  checksumType  = 'sha256'
}

Install-ChocolateyZipPackage @packageArgs
    
# Install start menu shortcut
if (Get-OSArchitectureWidth -Compare "32") { $exe_file = "VirtualDub.exe" } else { $exe_file = "VirtualDub64.exe" }
$programs = [environment]::GetFolderPath([environment+specialfolder]::Programs)
$shortcutFilePath = Join-Path $programs "VirtualDub2.lnk"
$targetPath = Join-Path $toolsDir "portable\$exe_file"
Install-ChocolateyShortcut -shortcutFilePath $shortcutFilePath -targetPath $targetPath
