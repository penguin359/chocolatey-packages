$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName  = $env:ChocolateyPackageName

  url          = 'https://uc2108038200c69e00c7e5e77285.dl.dropboxusercontent.com/cd/0/get/A-5nXFb41730k3u09zKb0tTmiRjG4QgGA_b4WaOFd-olOyBoS4QHvkB6mVSfoBBt9zYx3VDUWrWbD5Jlx0G7VI3bU_pJKcwSvANt5UTJQGxkQiw-cqXbNCq9gSyz151-RUQ/file?dl=1#'
  checksum     = '0df860f3c8d1fe9913da48e4d5260ef011d27a3c11de4886167f56ea0e0d6c08'
  checksumType = 'sha256'

  silentArgs   = '/S'
}

Install-ChocolateyPackage @packageArgs
