# The code structure for this from https://chocolatey.org/packages/hackfont
 
# create temp directory
do {
    $tempPath = Join-Path -Path $env:TEMP -ChildPath ([System.Guid]::NewGuid().ToString())
} while (Test-Path $tempPath)
New-Item -ItemType Directory -Path $tempPath | Out-Null
 
$packageArgs = @{
    packageName    = $env:ChocolateyPackageName
    unzipLocation  = $tempPath    

    url            = 'https://github.com/adobe-fonts/source-han-code-jp/archive/2.011R.zip'
    checksum       = '0F98BEB0A381D9D19067F9B58F65D2DD65C808A3012AC9CB9866E575AD6D2E7F'
    checksumType   = 'sha256'
}
 
Install-ChocolateyZipPackage @packageArgs
 
# Obtain system font folder for extraction
$shell = New-Object -ComObject Shell.Application
$fontsFolder = $shell.Namespace(0x14)
 
# Loop the extracted files and install them
Get-ChildItem -Path $tempPath\source-han-code-jp-$($env:ChocolateyPackageVersion)R\OTC -Recurse -Filter '*.ttc' -Exclude MyricaM.ttf, MyricaMM.ttf | ForEach-Object { 
    Write-Verbose "Registering font '$($_.Name)'."
    $fontsFolder.CopyHere($_.FullName)  # copying to fonts folder ignores a second param on CopyHere
}
 
# Remove our temporary files
# Remove-Item $tempPath -Recurse -ErrorAction SilentlyContinue
 
Write-Warning 'If the fonts are not available in your applications or receive any errors installing or upgrading, please reboot to release the font files.'