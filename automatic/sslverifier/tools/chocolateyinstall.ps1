$ErrorActionPreference = 'Stop';
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
  packageName = $env:ChocolateyPackageName
  destination = "$toolsDir"
  fileType    = "EXE"
  file        = "$toolsDir\SSL Verifier-v1.5.7.exe"

  silentArgs    = "/qn /norestart /l*v `"$($env:TEMP)\$($packageName).$($env:chocolateyPackageVersion).MsiInstall.log`""
}

Install-ChocolateyInstallPackage @packageArgs

# Install start menu shortcut
$programs = [environment]::GetFolderPath([environment+specialfolder]::Programs)
$OSArchitectureWidth = Get-OSArchitectureWidth
$shortcutFilePath = Join-Path $programs 'SSLVerifier.lnk'
$targetPath = Join-Path $toolsDir "SSLVerifier-x{$OSArchitectureWidth}.exe"
Install-ChocolateyShortcut -shortcutFilePath $shortcutFilePath -targetPath $targetPath
