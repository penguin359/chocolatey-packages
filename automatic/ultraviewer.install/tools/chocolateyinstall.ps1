$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName  = $env:ChocolateyPackageName

  url          = 'https://ultraviewer.net/en/UltraViewer_setup_6.4_en.exe'
  checksum     = '6993013f325fc4ea32bae149fb96001a33e86b22ce4d2f585761fad8bac8f4a1'
  checksumType = 'sha256'  

  silentArgs   = '/VERYSILENT /SUPPRESSMSGBOXES /NORESTART /SP-'
}

Install-ChocolateyPackage @packageArgs
