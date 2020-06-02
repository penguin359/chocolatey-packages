$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
    
  url            = 'https://www.ocenaudio.com/downloads/index.php/ocenaudio.exe'
  checksum       = '1d1139337c583ca73b8a38bb92ec7bf3dfb3e460567a03a30996e16e91a766c7'
  checksumType   = 'sha256'

  url64          = 'https://www.ocenaudio.com/downloads/index.php/ocenaudio64.exe'
  checksum64     = 'c231e4ec2d95e8bc17a1743fa5ce4bc1be0337c0b195da4cfc5ebda085f1c1c9'
  checksumType64 = 'sha256'

  silentArgs     = "/S"
}

Install-ChocolateyPackage @packageArgs
