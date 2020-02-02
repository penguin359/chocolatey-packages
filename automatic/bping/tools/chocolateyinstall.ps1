$ErrorActionPreference = 'Stop';
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  unzipLocation = $toolsDir
  file         =  'bping.exe'

  url           = 'https://gizmoware.net/bping/bping.zip'
  checksum      = '266B391E2166F3059F17F7ED0499E64377BBA1C8AFD0A7F9AB7A11A03781940C'
  checksumType  = 'sha256'
}

Install-ChocolateyZipPackage @packageArgs
