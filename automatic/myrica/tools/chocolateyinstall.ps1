# The code structure for this from https://chocolatey.org/packages/hackfont
 
# create temp directory
do {
    $tempPath = Join-Path -Path $env:TEMP -ChildPath ([System.Guid]::NewGuid().ToString())
} while (Test-Path $tempPath)
New-Item -ItemType Directory -Path $tempPath | Out-Null
 
$packageArgs = @{
    packageName    = $env:ChocolateyPackageName
    unzipLocation  = $tempPath
    # specificFolder = 'ttf'

    url            = 'https://github.com/tomokuni/Myrica/archive/2.006.20150301.zip'
    checksum       = 'AC85D476A7A8CC809BE015B9593AFFF2D998E7CEA3B9FD9AEE7D9D9A05BA449B'
    checksumType   = 'sha256'
}
 
Install-ChocolateyZipPackage @packageArgs
 
# Obtain system font folder for extraction
$shell = New-Object -ComObject Shell.Application
$fontsFolder = $shell.Namespace(0x14)
 
# Loop the extracted files and install them
Get-ChildItem -Path $tempPath\Myrica-$($env:ChocolateyPackageVersion)\Work -Recurse -Filter '*.ttf' -Exclude MyricaM.ttf, MyricaMM.ttf | ForEach-Object { 
    Write-Verbose "Registering font '$($_.Name)'."
    $fontsFolder.CopyHere($_.FullName)  # copying to fonts folder ignores a second param on CopyHere
}
 
# Remove our temporary files
Remove-Item $tempPath -Recurse -ErrorAction SilentlyContinue
 
Write-Warning 'If the fonts are not available in your applications or receive any errors installing or upgrading, please reboot to release the font files.'