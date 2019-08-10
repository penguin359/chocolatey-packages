$ErrorActionPreference = 'Stop';
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
  packageName = $env:ChocolateyPackageName
  url         = "$toolsDir\huggle_3.4.9.exe"
  checksum    = 'AA79F8F8C9879B02043A1879BFE6088E3824A77C9A347059D1828B69A0A383FA'
  file64      = "$toolsDir\huggle_3.4.9_x64.exe"
  checksum64  = '83E845D92AE4DC20474FEF1864FE66E34CFF090F8A58111227AF193E45200E52'
  silentArgs  = "/S"
}

Install-ChocolateyPackage @packageArgs