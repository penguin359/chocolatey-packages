$ErrorActionPreference = 'Stop';
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  unzipLocation  = "$toolsDir"

  url            = 'https://github.com/mifi/lossless-cut/releases/download/v3.27.0/LosslessCut-win.zip'
  checksum       = '193684287f5b71b621d5734c7d6d7135130f55b426274fe16fabfc1caa2894ae'
  checksumType   = 'sha256'
}

Install-ChocolateyZipPackage @packageArgs

# Don't create shims for other executables
$files = Get-ChildItem "$toolsDir" -Recurse -Include *.exe -Exclude LosslessCut.exe
foreach ($file in $files) {
    New-Item "$file.ignore" -type file -force | Out-Null
}

# Install start menu shortcut
$programs = "$env:ProgramData\Microsoft\Windows\Start Menu\Programs\"
$shortcutFilePath = Join-Path $programs "LosslessCut.lnk"
$targetPath = Join-Path $toolsDir "LosslessCut.exe"
Install-ChocolateyShortcut -shortcutFilePath $shortcutFilePath -targetPath $targetPath

# Set File Association for .MP4
if((Test-Path -LiteralPath "HKLM:\SOFTWARE\Classes\SystemFileAssociations\.mp4\Shell\cut") -ne $true) {  New-Item "HKLM:\SOFTWARE\Classes\SystemFileAssociations\.mp4\Shell\cut" -force -ea SilentlyContinue };
if((Test-Path -LiteralPath "HKLM:\SOFTWARE\Classes\SystemFileAssociations\.mp4\Shell\cut\command") -ne $true) {  New-Item "HKLM:\SOFTWARE\Classes\SystemFileAssociations\.mp4\Shell\cut\command" -force -ea SilentlyContinue };
if((Test-Path -LiteralPath "HKLM:\SOFTWARE\Classes\Applications\LosslessCut.exe") -ne $true) {  New-Item "HKLM:\SOFTWARE\Classes\Applications\LosslessCut.exe" -force -ea SilentlyContinue };
if((Test-Path -LiteralPath "HKLM:\SOFTWARE\Classes\Applications\LosslessCut.exe\DefaultIcon") -ne $true) {  New-Item "HKLM:\SOFTWARE\Classes\Applications\LosslessCut.exe\DefaultIcon" -force -ea SilentlyContinue };
if((Test-Path -LiteralPath "HKLM:\SOFTWARE\Classes\Applications\LosslessCut.exe\shell") -ne $true) {  New-Item "HKLM:\SOFTWARE\Classes\Applications\LosslessCut.exe\shell" -force -ea SilentlyContinue };
if((Test-Path -LiteralPath "HKLM:\SOFTWARE\Classes\Applications\LosslessCut.exe\shell\cut") -ne $true) {  New-Item "HKLM:\SOFTWARE\Classes\Applications\LosslessCut.exe\shell\cut" -force -ea SilentlyContinue };
if((Test-Path -LiteralPath "HKLM:\SOFTWARE\Classes\Applications\LosslessCut.exe\shell\cut\command") -ne $true) {  New-Item "HKLM:\SOFTWARE\Classes\Applications\LosslessCut.exe\shell\cut\command" -force -ea SilentlyContinue };
if((Test-Path -LiteralPath "HKLM:\SOFTWARE\Classes\Applications\LosslessCut.exe\SupportedTypes") -ne $true) {  New-Item "HKLM:\SOFTWARE\Classes\Applications\LosslessCut.exe\SupportedTypes" -force -ea SilentlyContinue };
New-ItemProperty -LiteralPath 'HKLM:\SOFTWARE\Classes\SystemFileAssociations\.mp4\Shell\cut' -Name '(default)' -Value 'Cut' -PropertyType String -Force -ea SilentlyContinue;
New-ItemProperty -LiteralPath 'HKLM:\SOFTWARE\Classes\SystemFileAssociations\.mp4\Shell\cut' -Name 'Icon' -Value '"C:\ProgramData\chocolatey\lib\lossless-cut\tools\LosslessCut.exe",0' -PropertyType String -Force -ea SilentlyContinue;
New-ItemProperty -LiteralPath 'HKLM:\SOFTWARE\Classes\SystemFileAssociations\.mp4\Shell\cut\command' -Name '(default)' -Value '"C:\ProgramData\chocolatey\lib\lossless-cut\tools\LosslessCut.exe" "%1"' -PropertyType String -Force -ea SilentlyContinue;
New-ItemProperty -LiteralPath 'HKLM:\SOFTWARE\Classes\Applications\LosslessCut.exe' -Name '(default)' -Value 'LosslessCut' -PropertyType String -Force -ea SilentlyContinue;
New-ItemProperty -LiteralPath 'HKLM:\SOFTWARE\Classes\Applications\LosslessCut.exe\DefaultIcon' -Name '(default)' -Value '"C:\ProgramData\chocolatey\lib\lossless-cut\tools\LosslessCut.exe",0' -PropertyType ExpandString -Force -ea SilentlyContinue;
New-ItemProperty -LiteralPath 'HKLM:\SOFTWARE\Classes\Applications\LosslessCut.exe\shell' -Name '(default)' -Value 'Cut' -PropertyType String -Force -ea SilentlyContinue;
New-ItemProperty -LiteralPath 'HKLM:\SOFTWARE\Classes\Applications\LosslessCut.exe\shell\cut' -Name '(default)' -Value 'Cut' -PropertyType String -Force -ea SilentlyContinue;
New-ItemProperty -LiteralPath 'HKLM:\SOFTWARE\Classes\Applications\LosslessCut.exe\shell\cut' -Name 'Icon' -Value '"C:\ProgramData\chocolatey\lib\lossless-cut\tools\LosslessCut.exe",0' -PropertyType String -Force -ea SilentlyContinue;
New-ItemProperty -LiteralPath 'HKLM:\SOFTWARE\Classes\Applications\LosslessCut.exe\shell\cut\command' -Name '(default)' -Value '"C:\ProgramData\chocolatey\lib\lossless-cut\tools\LosslessCut.exe" "%1"' -PropertyType ExpandString -Force -ea SilentlyContinue;
New-ItemProperty -LiteralPath 'HKLM:\SOFTWARE\Classes\Applications\LosslessCut.exe\SupportedTypes' -Name '.mp4' -Value '' -PropertyType String -Force -ea SilentlyContinue;