$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName

  url           = 'https://www.klayout.org/downloads/Windows/klayout-0.26.8-win32-install.exe'
  checksum      = 'da51e35ef691cb1004c842015da5dc60b2fd41e3755e8712842d955e104609e0'
  checksumType  = 'sha256'

  url64         = 'https://www.klayout.org/downloads/Windows/klayout-0.26.8-win64-install.exe'
  checksum64    = 'ca8780450fa0928b96471deb6d40962ee1cef976cbcc22b0dd6c009f6ee86f66'

  checksumType64= 'sha256'

  silentArgs	= '/S'
}

Install-ChocolateyPackage @packageArgs
