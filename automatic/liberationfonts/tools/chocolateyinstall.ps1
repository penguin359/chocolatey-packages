$ErrorActionPreference = 'Stop'
# The code structure for this from https://chocolatey.org/packages/hackfont
 
# create temp directory
do {
    $tempPath = Join-Path -Path $env:TEMP -ChildPath ([System.Guid]::NewGuid().ToString())
} while (Test-Path $tempPath)
New-Item -ItemType Directory -Path $tempPath | Out-Null
 
$packageArgs = @{
    packageName    = $env:ChocolateyPackageName
    unzipLocation  = $tempPath
    specificFolder = 'ttf'

    url            = 'https://github.com/liberationfonts/liberation-fonts/files/6026893/liberation-fonts-ttf-2.1.3.tar.gz'
    checksum       = '8947bb7c0ad4d0d25b6ae93d40ec5fbe3dbbd4de21b81a62aa0c41a801e36fdd'
    checksumType   = 'sha256'
}
 
Install-ChocolateyZipPackage @packageArgs
 
# Obtain system font folder for extraction
$shell = New-Object -ComObject Shell.Application
$fontsFolder = $shell.Namespace(0x14)
 
# Loop the extracted files and install them
Get-ChildItem -Path $tempPath -Recurse -Filter '*.ttf' | ForEach-Object { 
    Write-Verbose "Registering font '$($_.Name)'."
    $fontsFolder.CopyHere($_.FullName)  # copying to fonts folder ignores a second param on CopyHere
}
 
# Remove our temporary files
Remove-Item $tempPath -Recurse -ErrorAction SilentlyContinue
 
Write-Warning 'If the fonts are not available in your applications or receive any errors installing or upgrading, please reboot to release the font files.'
