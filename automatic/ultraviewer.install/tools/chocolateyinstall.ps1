$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName  = $env:ChocolateyPackageName

  url          = 'https://ultraviewer.net/en/UltraViewer_setup_6.2_en.exe'
  checksum     = 'b07baee9b2d75e3f53366fd716c127f32a302dedc7b8a9fe3e01704688ace5a1'
  checksumType = 'sha256'  

  silentArgs   = '/VERYSILENT /SUPPRESSMSGBOXES /NORESTART /SP-'
}

Install-ChocolateyPackage @packageArgs
