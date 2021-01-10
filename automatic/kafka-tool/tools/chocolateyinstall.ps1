$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName

  url           = 'http://www.kafkatool.com/download2/kafkatool.exe'
  checksum      = '16d4ba7450bd49a48ec47b0eda935c15cc3f3e4627ee4a5c2e1066fc761513f3'
  checksumType  = 'sha256'

  url64bit      = 'http://www.kafkatool.com/download2/kafkatool_64bit.exe'
  checksum64    = '69c186d3942a225dc46ec54389fa2f32e3128def787bd75507d9a5e40271700e'
  checksumType64= 'sha256'

  silentArgs    = "-q"
}

Install-ChocolateyPackage @packageArgs
