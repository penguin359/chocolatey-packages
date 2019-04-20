$ErrorActionPreference = 'Stop';
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  unzipLocation = $toolsDir
  fileType      = 'exe'
  file          = "$toolsDir\zVirtualDesktop.exe"
      
  url           = 'https://zomp.co/Files.aspx?id=zVD'
  checksum      = '3132C41D4D479DC776B9AA38D9937336079A666095C412FBFDCDB8B5ECC8C2E7'
  checksumType  = 'sha256'
}

Install-ChocolateyZipPackage @packageArgs
Start-Process -FilePath $file