$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName  = $env:ChocolateyPackageName

  url          = 'https://uc6cfca0105621d05598fb4f3db2.dl.dropboxusercontent.com/cd/0/get/Ax5kwsfL3bwQpVIoO8NlmfrQjfljCIwgWt9RWm4SVGfEgrTYF5XjqnZ10VIiu9LXZKo2tc5T8EmpOtWXOT-PD-9nIG66VDURdRwgoYrrDAXVReisyqUdj2VDl9hZIY18Zl8/file?dl=1#'
  checksum     = '47e153274f899c9a6ab70a46aa66eee41430120b8961dcc329c1b057b23971f9'
  checksumType = 'sha256'

  silentArgs   = '/S'
}

Install-ChocolateyPackage @packageArgs
