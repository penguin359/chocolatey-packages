$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
    
  url           = 'https://github.com/getstation/desktop-app-releases/releases/download/1.63.1/browserX-Setup-1.63.1.exe'
  checksum      = '82aec7f9e946198026e191098a8578dc35656b7222e467ce8022bb08eaa5a735'
  checksumType  = 'sha256'
}

Install-ChocolateyPackage @packageArgs
