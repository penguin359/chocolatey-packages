$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
    
  url           = 'https://github.com/getstation/desktop-app-releases/releases/download/1.43.2/browserX-Setup-1.43.2.exe'
  checksum      = '6b37db2469c5f85b875534722bcdcf843d08cac59e03ca0f06fc860f87531eb8'
  checksumType  = 'sha256'
}

Install-ChocolateyPackage @packageArgs
