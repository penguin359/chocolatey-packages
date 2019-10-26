$ErrorActionPreference = 'Stop';
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"  

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  unzipLocation = "$toolsDir"

  url           = 'https://www.ne.jp/asahi/foresth/home/cpdfc107.zip'
  checksum      = '728EFE0F52D7A724B2EB34E0364C151EE2E5314551CD82721E6CF172D6365C55'
  checksumType  = 'sha256'
}

Install-ChocolateyZipPackage @packageArgs

# Don't create shims for other executables
$files = Get-ChildItem "$toolsDir" -Recurse -Include *.exe -Exclude ComPDFC.exe
foreach ($file in $files) {
  New-Item "$file.ignore" -type file -force | Out-Null
}