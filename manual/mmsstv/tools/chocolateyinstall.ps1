$ErrorActionPreference = 'Stop'
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$baseUrl    = 'https://hamsoft.ca/pages/mmsstv.php'

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  unzipLocation = $toolsDir
  fileType      = 'exe'

  softwareName  = 'MMSSTV*'

  checksum      = 'C03B3E863A3F1580672DDC9BC2B0740C911C508CB20D00B254EEB725C2084F4A'
  checksumType  = 'sha256'

  silentArgs    = '/VERYSILENT /SUPPRESSMSGBOXES /NORESTART /SP-'
  validExitCodes= @(0)
}

$download = Invoke-WebRequest -Uri $baseUrl -SessionVariable session -UseBasicParsing
$re = "mmsstv.*\.exe"
$downloadUrl = $download.links | ? {$_.outerHTML -match $re} | Select-Object -First 1 -ExpandProperty href

$packageArgs['url'] = $baseUrl + $downloadUrl
[Hashtable]$packageArgs['options'] = @{
  WebSession = $session
}
Install-ChocolateyPackage @packageArgs
