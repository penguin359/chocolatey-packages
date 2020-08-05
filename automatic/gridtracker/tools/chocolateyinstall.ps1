$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName  = $env:ChocolateyPackageName

  url          = 'https://ucee774f5108203302886de47f81.dl.dropboxusercontent.com/cd/0/get/A87QrRIHkbXagWl-puXQnYOrOdFnxoTcvmsf9v6ZLxbgtHx-l0rg8ehgM0p7UM2yJTLWuxqZWYn0KfPdg1ZEcVGdPcwImo5SPZ0c59RZvPSZOW3UdqvwxqzmSszKuK1T_E8/file?dl=1#'
  checksum     = '2ffe1e83216d79c83a8bc756f2510730ad4a045f14c8fb691318992d378d0fbd'
  checksumType = 'sha256'

  silentArgs   = '/S'
}

Install-ChocolateyPackage @packageArgs
