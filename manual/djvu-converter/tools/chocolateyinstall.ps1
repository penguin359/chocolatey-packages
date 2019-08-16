$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName  = $env:ChocolateyPackageName

  url          = 'http://file2.softsea.com/Image_Utility/djvuconverter_setup.exe'
  checksum     = '600CDFB6A4093429EC792FAA46F5883EB662D9B6E674A24CD9D86408950A1122'
  checksumType = 'sha256'
  options      = @{ Headers = @{ Referer = 'http://www.softsea.com/download/DjVu-Converter.html'}}

  silentArgs   = "/VERYSILENT /SUPPRESSMSGBOXES /NORESTART /SP-"
}

Install-ChocolateyPackage @packageArgs