$ErrorActionPreference = 'Stop';
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  unzipLocation = $toolsDir

  url           = 'http://apache.mediamirrors.org/incubator/netbeans/incubating-netbeans/incubating-11.0/incubating-netbeans-11.0-bin.zip'
  checksum      = 'D0A9C8BFE8F22E5A4504573AB57A09580BE6EDA24268330C6AA8FF67ECD7B0FE'
  checksumType  = 'sha256'
}

Install-ChocolateyZipPackage @packageArgs

#Install start menu shortcuts
$programs = [environment]::GetFolderPath([environment+specialfolder]::Programs)
if (Get-OSArchitectureWidth -Compare "32") { $exe_file = "netbeans.exe" } else { $exe_file = "netbeans64.exe" }

$shortcutFilePath = Join-Path $programs "Apache NetBeans.lnk"
$targetPath = Join-Path $toolsDir "netbeans\bin\$exe_file"
Install-ChocolateyShortcut -shortcutFilePath $shortcutFilePath -targetPath $targetPath

Write-Warn "NetBeans needs JDK 8 and above to be used."