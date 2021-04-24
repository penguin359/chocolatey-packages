$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName

  url           = 'https://download.qoppa.com/pdfstudio/PDFStudio_win.exe'
  checksum      = 'BB9449E96362AB4438742461CED50F0789D492E5204B4A85D18F00A896F59EC4'
  checksumType  = 'sha256'

  url64bit      = 'https://download.qoppa.com/pdfstudio/PDFStudio_win64.exe'
  checksum64    = 'F2C51CAD86931F697100769B52AD96EBC8727DD5867CFA5B93984BBCB80917CF'
  checksumType64= 'sha256'

  silentArgs    = '-q'
}

Install-ChocolateyPackage @packageArgs