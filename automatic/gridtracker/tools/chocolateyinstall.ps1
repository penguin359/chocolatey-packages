$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName  = $env:ChocolateyPackageName

  url          = 'https://uc07e20b1dd04ee5e3a8b93be813.dl.dropboxusercontent.com/cd/0/get/Av7w6yxcdg3_xhO8PnTYQVIj9w39IjRysIs7eLXhyHSd7seSULcV6q5QpRkvTO7ikkR7qJ-dKNIQHGtKxncU0SRxgh-Ybk4y6Mhzq1sxgi7ff3H_9pmao8UxzIB3ov8O4tk/file?dl=1#'
  checksum     = 'c2702f7718645f4705f168136a73beb8933f70db56060ce6844330e0f61f0636'
  checksumType = 'sha256'

  silentArgs   = '/S'
}

Install-ChocolateyPackage @packageArgs
