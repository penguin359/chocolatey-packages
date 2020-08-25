$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName

  url           = 'http://www.kafkatool.com/download2/kafkatool.exe'
  checksum      = '150bb85a78023a6fb5d9cab233ea551657a38089fc28ce390761e1b69823145e'
  checksumType  = 'sha256'

  url64bit      = 'http://www.kafkatool.com/download2/kafkatool_64bit.exe'
  checksum64    = '02190c8db5d87e49dc39bf3ebff6d9e907107db782bb9a2caae86e7163ccbb27'
  checksumType64= 'sha256'

  silentArgs    = "-q"
}

Install-ChocolateyPackage @packageArgs
