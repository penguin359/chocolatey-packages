$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  unzipLocation = $toolsDir
  fileType      = 'exe'
  url           = 'https://github.com/lanayotech/vagrant-manager-windows/releases/download/1.0.0.6/vagrant-manager-windows-1.0.0.6.zip'
  file          = "$(Split-Path -Parent $MyInvocation.MyCommand.Definition)\\vagrant-manager-windows-1.0.0.6.exe"
    
  checksum      = '1D1917BDBDA8F03C061C614AB456E14D9BB258D5B7D9693D47853AE952AD075E'
  checksumType  = 'sha256'
  
  silentArgs = '/verysilent /norestart'
  validExitCodes = @(0)
}

Install-ChocolateyZipPackage @packageArgs
Install-ChocolateyInstallPackage @packageArgs