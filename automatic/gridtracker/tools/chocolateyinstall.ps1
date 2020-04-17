$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName  = $env:ChocolateyPackageName

  url          = 'https://uc4e1ecee2105f04618f2d63486f.dl.dropboxusercontent.com/cd/0/get/A1_S6RcLJTomQiQ4D2ww4zYL4TIsXydb1xZALbTD5SqZkeKjQ_MDvvTlkfUVghEeXyhdQsmokDA69IjZQd3f05UK5EuWKaNwLRx0m0haPuQf3JOK8rm7IYeyw4kqR1frYgQ/file?dl=1#'
  checksum     = '5b94db88f4cc526bc25ba45135940aca9bc488b640e06cfd870455e997b72d56'
  checksumType = 'sha256'

  silentArgs   = '/S'
}

Install-ChocolateyPackage @packageArgs
