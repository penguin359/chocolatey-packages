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

    url            = 'https://github.com/liberationfonts/liberation-fonts/files/2926169/liberation-fonts-ttf-2.00.5.tar.gz'
    checksum       = 'F14FF0A0BE87B5AEB672E669363B5A699DB76FEB1144B06798261C0FDCD2B24D'
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