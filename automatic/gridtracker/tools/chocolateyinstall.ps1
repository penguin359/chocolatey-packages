$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName  = $env:ChocolateyPackageName

  url          = 'https://ucc15d5766f83b65d8119958e120.dl.dropboxusercontent.com/cd/0/get/AwUzzIbuMZPOwrFg6BMDY6Dnj7Oc0nnRKFEciELsCikRO1ji7NmyaPv-Jy3GUfnfBRVPKbE9-TYMFq9qLeb3S5FzG3cIANd3GJECw4ABFxfTbAIObEgz7VTWNiYVaQjvaSM/file?dl=1#'
  checksum     = 'adb08fa53bc75b070a7657b86140f14d87ec7b4d7515ba0fd97ed855cba03c9e'
  checksumType = 'sha256'

  silentArgs   = '/S'
}

Install-ChocolateyPackage @packageArgs
