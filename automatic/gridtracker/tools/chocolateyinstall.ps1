$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName  = $env:ChocolateyPackageName

  url          = 'https://uc505d0726d8cd2eaad086c01062.dl.dropboxusercontent.com/cd/0/get/A8z1AIj4D1EC61FV_WNIX08eqSt-nmFrAIukmkgI-MhRgYUYQY2OIYQvU6tjYnNXs49MTxHYy28i3T8vDO8w0JNDgGK2EPwGG8Vag2htII3w3MOb-R8out-M4sQTzIBmAqg/file?dl=1#'
  checksum     = 'a2d808e7ed27a90a561a78f80b23c0ccc0a7e5523701046bf96424fe49c36441'
  checksumType = 'sha256'

  silentArgs   = '/S'
}

Install-ChocolateyPackage @packageArgs
