$ErrorActionPreference = 'Stop';
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  unzipLocation = $toolsDir
    
  file          = 'https://freefr.dl.sourceforge.net/project/vdfiltermod/VirtualDub%20pack/version%2020/VirtualDub2_43385.zip'
  checksum      = '9A87A5CD949251616A41D20CD2253BFD1B1E60090ED5BEFF79D9D2F9377F5D41'
  checksumType  = 'sha256'
}

# Shims
if (Get-OSArchitectureWidth -Compare "32"){
  foreach ( $file in 'vdub64.exe', 'VirtualDub64.exe'){
    New-Item -path $toolsDir -name "$file.ignore" -type File -force | Out-Null
  }
} else {
  foreach ( $file in 'vdub.exe', 'VirtualDub.exe'){
    New-Item -path $toolsDir -name "$file.ignore" -type File -force | Out-Null
  }
}
foreach ( $file in 'auxsetup.exe', 'vdlaunch.exe', 'vdlaunch64.exe'){
  New-Item -path $toolsDir\extra -name "$file.ignore" -type File -force | Out-Null
}

Install-ChocolateyZipPackage @packageArgs
    
# Install start menu shortcut
if (Get-OSArchitectureWidth -Compare "32") { $exe_file = "VirtualDub.exe" } else { $exe_file = "VirtualDub64.exe" }
$programs = [environment]::GetFolderPath([environment+specialfolder]::Programs)
$shortcutFilePath = Join-Path $programs "VirtualDub2.lnk"
$targetPath = Join-Path $toolsDir "$exe_file"
Install-ChocolateyShortcut -shortcutFilePath $shortcutFilePath -targetPath $targetPath
