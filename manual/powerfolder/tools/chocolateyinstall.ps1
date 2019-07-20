$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
    
  url          = 'https://my.powerfolder.com/dl/firSoD3LMSiXaonvfcs2TQf/PowerFolder_Latest_Installer.exe'
  checksum     = '51BFC8CA4166D3AE3381D3A390E98274B54572EB45F97425D617FC35D5BFDBEB'
  checksumType = 'sha256'  
  
  silentArgs   = "/S"
}

Install-ChocolateyPackage @packageArgs
