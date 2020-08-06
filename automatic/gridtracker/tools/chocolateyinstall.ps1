$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName  = $env:ChocolateyPackageName

  url          = 'https://uc6238df92ea9996adf461a5bd29.dl.dropboxusercontent.com/cd/0/get/A89uQtB29iBh-_6zzLgvlGwKR1nMAiduX46vcEzyJmdEO9_nflYr6DBTT-nOErMrrPDWSNGNOcYt39KZd-W4nbOaBfZ5YRUw7r5KVhGlLo7Uhux7huRytIn_V5kIAXPgnAQ/file?dl=1#'
  checksum     = '3a2ff71d760675ad4c51006a193aa924a80529146efcf8365d7aaf7e56b22c00'
  checksumType = 'sha256'

  silentArgs   = '/S'
}

Install-ChocolateyPackage @packageArgs
