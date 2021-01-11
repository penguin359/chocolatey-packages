$ErrorActionPreference = 'Stop';
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  unzipLocation  = "$toolsDir"

  url            = 'https://github.com/mifi/lossless-cut/releases/download/v3.30.0/LosslessCut-win.zip'
  checksum       = '575ff9c2cbc37e041b04e26ffcc212cd2ab82b893c81d65d590d599a6a2c9a16'
  checksumType   = 'sha256'
}

Install-ChocolateyZipPackage @packageArgs

# Don't create shims for other executables
$files = Get-ChildItem "$toolsDir" -Recurse -Include *.exe -Exclude LosslessCut.exe
foreach ($file in $files) {
    New-Item "$file.ignore" -type file -force | Out-Null
}

$targetPath = Join-Path $toolsDir "LosslessCut.exe"

# Add start menu shortcut
$programsPath = "$env:ProgramData\Microsoft\Windows\Start Menu\Programs\"
$programsFilePath = Join-Path $programsPath "LosslessCut.lnk"
Install-ChocolateyShortcut -shortcutFilePath $programsFilePath -targetPath $targetPath

# Add send to menu shortcut
$sendtoPath = "$env:APPDATA\Microsoft\Windows\SendTo\"
$sendtoFilePath = Join-Path $sendtoPath "Merge videos in LosslessCut.lnk"
Install-ChocolateyShortcut -shortcutFilePath $sendtoFilePath -targetPath $targetPath

# Set File Association for .MP4
if((Test-Path -LiteralPath "HKLM:\SOFTWARE\Classes\SystemFileAssociations\.mp4\Shell\cut") -ne $true) {  New-Item "HKLM:\SOFTWARE\Classes\SystemFileAssociations\.mp4\Shell\cut" -force -ea SilentlyContinue };
if((Test-Path -LiteralPath "HKLM:\SOFTWARE\Classes\SystemFileAssociations\.mp4\Shell\cut\command") -ne $true) {  New-Item "HKLM:\SOFTWARE\Classes\SystemFileAssociations\.mp4\Shell\cut\command" -force -ea SilentlyContinue };
if((Test-Path -LiteralPath "HKLM:\SOFTWARE\Classes\Applications\LosslessCut.exe") -ne $true) {  New-Item "HKLM:\SOFTWARE\Classes\Applications\LosslessCut.exe" -force -ea SilentlyContinue };
if((Test-Path -LiteralPath "HKLM:\SOFTWARE\Classes\Applications\LosslessCut.exe\DefaultIcon") -ne $true) {  New-Item "HKLM:\SOFTWARE\Classes\Applications\LosslessCut.exe\DefaultIcon" -force -ea SilentlyContinue };
if((Test-Path -LiteralPath "HKLM:\SOFTWARE\Classes\Applications\LosslessCut.exe\shell") -ne $true) {  New-Item "HKLM:\SOFTWARE\Classes\Applications\LosslessCut.exe\shell" -force -ea SilentlyContinue };
if((Test-Path -LiteralPath "HKLM:\SOFTWARE\Classes\Applications\LosslessCut.exe\shell\cut") -ne $true) {  New-Item "HKLM:\SOFTWARE\Classes\Applications\LosslessCut.exe\shell\cut" -force -ea SilentlyContinue };
if((Test-Path -LiteralPath "HKLM:\SOFTWARE\Classes\Applications\LosslessCut.exe\shell\cut\command") -ne $true) {  New-Item "HKLM:\SOFTWARE\Classes\Applications\LosslessCut.exe\shell\cut\command" -force -ea SilentlyContinue };
if((Test-Path -LiteralPath "HKLM:\SOFTWARE\Classes\Applications\LosslessCut.exe\SupportedTypes") -ne $true) {  New-Item "HKLM:\SOFTWARE\Classes\Applications\LosslessCut.exe\SupportedTypes" -force -ea SilentlyContinue };
New-ItemProperty -LiteralPath 'HKLM:\SOFTWARE\Classes\SystemFileAssociations\.mp4\Shell\cut' -Name '(default)' -Value 'Cut video in LosslessCut' -PropertyType String -Force -ea SilentlyContinue;
New-ItemProperty -LiteralPath 'HKLM:\SOFTWARE\Classes\SystemFileAssociations\.mp4\Shell\cut' -Name 'Icon' -Value '"C:\ProgramData\chocolatey\lib\lossless-cut\tools\LosslessCut.exe",0' -PropertyType String -Force -ea SilentlyContinue;
New-ItemProperty -LiteralPath 'HKLM:\SOFTWARE\Classes\SystemFileAssociations\.mp4\Shell\cut\command' -Name '(default)' -Value '"C:\ProgramData\chocolatey\lib\lossless-cut\tools\LosslessCut.exe" "%1"' -PropertyType String -Force -ea SilentlyContinue;
New-ItemProperty -LiteralPath 'HKLM:\SOFTWARE\Classes\Applications\LosslessCut.exe' -Name '(default)' -Value 'LosslessCut' -PropertyType String -Force -ea SilentlyContinue;
New-ItemProperty -LiteralPath 'HKLM:\SOFTWARE\Classes\Applications\LosslessCut.exe\DefaultIcon' -Name '(default)' -Value '"C:\ProgramData\chocolatey\lib\lossless-cut\tools\LosslessCut.exe",0' -PropertyType ExpandString -Force -ea SilentlyContinue;
New-ItemProperty -LiteralPath 'HKLM:\SOFTWARE\Classes\Applications\LosslessCut.exe\shell' -Name '(default)' -Value 'cut' -PropertyType String -Force -ea SilentlyContinue;
New-ItemProperty -LiteralPath 'HKLM:\SOFTWARE\Classes\Applications\LosslessCut.exe\shell\cut' -Name '(default)' -Value 'Cut video in LosslessCut' -PropertyType String -Force -ea SilentlyContinue;
New-ItemProperty -LiteralPath 'HKLM:\SOFTWARE\Classes\Applications\LosslessCut.exe\shell\cut' -Name 'Icon' -Value '"C:\ProgramData\chocolatey\lib\lossless-cut\tools\LosslessCut.exe",0' -PropertyType String -Force -ea SilentlyContinue;
New-ItemProperty -LiteralPath 'HKLM:\SOFTWARE\Classes\Applications\LosslessCut.exe\shell\cut\command' -Name '(default)' -Value '"C:\ProgramData\chocolatey\lib\lossless-cut\tools\LosslessCut.exe" "%1"' -PropertyType ExpandString -Force -ea SilentlyContinue;
New-ItemProperty -LiteralPath 'HKLM:\SOFTWARE\Classes\Applications\LosslessCut.exe\SupportedTypes' -Name '.mp4' -Value '' -PropertyType String -Force -ea SilentlyContinue;