$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName  = $env:ChocolateyPackageName

  url          = 'https://uc5c34eb2207aa235b156c43e323.dl.dropboxusercontent.com/cd/0/get/A-YGxbAMGLWC6oh0WLNPrcJXL_f8oGncyKWqmbUe1xK6WQpEr0akJuIbC7X7CNBoNl_0F2U9_itdJaARrVc-80ruiJFCSXGGKj2VhtNnd32YomjmlZoE_sM8OObPpsXRoQk/file?dl=1#'
  checksum     = '5429e8c26eea4763088a1c5b45b12c77987c3ec5205ef49fd57a8fd24c7a1fab'
  checksumType = 'sha256'

  silentArgs   = '/S'
}

Install-ChocolateyPackage @packageArgs
