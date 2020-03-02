$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName  = $env:ChocolateyPackageName

  url          = 'https://uca4eefe326c88a1f4965430c032.dl.dropboxusercontent.com/cd/0/get/AzLIxaAXQiy-ceZAcIYXjR2Kl1kZlA9g53Thc5w3SvnUyuL26TvBVZJTX2vSDC93wjWOJcmt15vDA0oTAMvelruDzhQ871TRPH8fwvOhtj74AjkQY3U7JX8q21uOTKTlyCQ/file?dl=1#'
  checksum     = '87909ec012a152cb3fcf2ca191d1534e8d06ba2d0d77a3aa3e9436bea815c894'
  checksumType = 'sha256'

  silentArgs   = '/S'
}

Install-ChocolateyPackage @packageArgs
