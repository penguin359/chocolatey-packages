$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName  = $env:ChocolateyPackageName

  url          = Get-RedirectedUrl 'http://file2.softsea.com/get.php?id=836900551' 'http://www.softsea.com/download/DjVu-Converter.html'
  checksum     = '600CDFB6A4093429EC792FAA46F5883EB662D9B6E674A24CD9D86408950A1122'
  checksumType = 'sha256'

  silentArgs   = '/VERYSILENT /SUPPRESSMSGBOXES /NORESTART /SP-'
}

Install-ChocolateyPackage @packageArgs -Options $options