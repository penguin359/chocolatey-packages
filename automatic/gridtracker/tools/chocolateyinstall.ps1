$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName  = $env:ChocolateyPackageName

  url          = 'https://uc70d5b092891ea99aab9e034dfa.dl.dropboxusercontent.com/cd/0/get/Avi60L2GF5ZxhStg1Z6YCaaoeoC_EK3zVhXOrAQmJiJHwfXkroXPE_uh3flg3Z46nrpYSIHV44i7dsCPjrGnii-d86NWS3wSxC1LMt2YEnWD-YTZdFiG7owDZPApd_2GdFs/file?dl=1#'
  checksum     = '04ef69f5e32c28fe5f32efb380d4e7f5ca0f35d367ba0b9f9ff70c3524159ce2'
  checksumType = 'sha256'

  silentArgs   = '/S'
}

Install-ChocolateyPackage @packageArgs
