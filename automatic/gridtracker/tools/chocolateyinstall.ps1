$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName  = $env:ChocolateyPackageName

  url          = 'https://uc97ee1f836148a50a561f1f5f83.dl.dropboxusercontent.com/cd/0/get/A__Z1WfZNKyGRV-DFIpHmya5Td7SilAd3CLABjAd8ULPLRi6ebVxQcAD5bnhuVc9W_qK10Wp12_HOjkZBmU8d0bw4grUQVQ4IaP478aiiVoqzAXiwcapZXqelbuQckbTrqc/file?dl=1#'
  checksum     = '9a3b542822739975139cb7068335314605d6716d6180cbafb0ea584985dbc55b'
  checksumType = 'sha256'

  silentArgs   = '/S'
}

Install-ChocolateyPackage @packageArgs
