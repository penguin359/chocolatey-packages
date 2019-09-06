$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
    
  url           = 'https://github.com/getstation/desktop-app-releases/releases/download/1.48.1/browserX-Setup-1.48.1.exe'
  checksum      = '28a8642b8fa802c21ba2527e935f4685a9ea9d3d42b9b7f304c3a23ae2b1074c'
  checksumType  = 'sha256'
}

Install-ChocolateyPackage @packageArgs
