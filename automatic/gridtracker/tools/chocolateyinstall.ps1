$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName  = $env:ChocolateyPackageName

  url          = 'https://uce99d3187ce58c7e352c2e21c22.dl.dropboxusercontent.com/cd/0/get/AykOAUbrsiGDgkqxE1aSkZYKe9L2BSsukF1UKBzLu5wdHgJX-xIhKhQGBq2KSR6dYg4Y61aAJRvzKJCPAlKe3S_f7s59M097tDxf-gjwYEiJ90ApYLDzgCXh_7oAKum66Z8/file?dl=1#'
  checksum     = '04258dfcb7cb63e7cae62068b764d8e1c78d74db8adbdff35d9907fdaebc93e8'
  checksumType = 'sha256'

  silentArgs   = '/S'
}

Install-ChocolateyPackage @packageArgs
