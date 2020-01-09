$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
    
  url           = 'https://github.com/getstation/desktop-app-releases/releases/download/1.63.3/browserX-Setup-1.63.3.exe'
  checksum      = 'e35694b42ff8a604e94d77b4fbd80aed0bd402591688f588c3825f4c14e860a3'
  checksumType  = 'sha256'
}

Install-ChocolateyPackage @packageArgs
