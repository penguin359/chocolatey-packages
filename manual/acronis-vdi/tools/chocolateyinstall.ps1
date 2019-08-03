$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName  = $env:ChocolateyPackageName
  filetype     = 'MSI'
    
  url          = 'https://dl2.acronis.com/u/kb/VirtualDiskSetup.msi'
  checksum     = '3253e1f436c8caa315407b63c7de9c08db5d908f3fde25e5ef733bf672ee3695'
  checksumType = 'sha256'
  
  
  silentArgs   = "/qn /norestart /l*v `"$($env:TEMP)\$($packageName).$($env:chocolateyPackageVersion).MsiInstall.log`""
}

Install-ChocolateyPackage @packageArgs