$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName

  url            = 'https://miktex.org/download/ctan/systems/win32/miktex/setup/windows-x86/basic-miktex-2.9.7442.exe'
  checksum       = '358D58B8DF64E7E610A26FAC4B6BE805DA486B5DEA5D7D44CB2F1CBD465F0DDB'
  checksumType   = 'sha256'

  url64bit       = 'https://miktex.org/download/ctan/systems/win32/miktex/setup/windows-x64/basic-miktex-2.9.7442-x64.exe'
  checksum64     = 'E31E54504550187B9259AA95F92157458690030D0059473238B8B587854A238B'
  checksumType64 = 'sha256'

  silentArgs     = '--unattended --shared'
}

Install-ChocolateyPackage @packageArgs