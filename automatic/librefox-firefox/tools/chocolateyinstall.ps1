$ErrorActionPreference = 'Stop';
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
  packageName = $env:ChocolateyPackageName
  destination = "$toolsDir"
  file        = "$toolsDir\Librefox-2.1-Firefox-Windows-64.0.0.zip"
}

Get-ChocolateyUnzip @packageArgs
Remove-Item -Path $packageArgs.file

foreach ($firefox_path in "C:\Program Files (x86)\Mozilla Firefox", "C:\Program Files\Mozilla Firefox"){
  if (Test-Path -PathType Container -Path "$firefox_path") {  
    Copy-Item -Recurse -Path "$toolsDir\defaults\pref\local-settings.js" -Destination "$firefox_path\defaults\pref\"
    New-Item -Force -Path "$firefox_path\distribution\" -ItemType "directory"
    Copy-Item -Recurse -Path "$toolsDir\distribution\policies.json" -Destination "$firefox_path\distribution\"
    Copy-Item -Recurse -Path "$toolsDir\mozilla.cfg" -Destination "$firefox_path"
  }
}