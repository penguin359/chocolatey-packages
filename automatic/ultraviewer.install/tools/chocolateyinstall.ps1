$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName  = $env:ChocolateyPackageName

  url          = 'https://ultraviewer.net/en/UltraViewer_setup_6.3_en.exe'
  checksum     = '7731a6b479d55d8d2fc2b01d0df2dd9261f5cbcb3996758140dbe674897775ef'
  checksumType = 'sha256'  

  silentArgs   = '/VERYSILENT /SUPPRESSMSGBOXES /NORESTART /SP-'
}

Install-ChocolateyPackage @packageArgs
