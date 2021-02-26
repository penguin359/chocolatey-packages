$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName

  url           = 'https://clockify-resources.s3.eu-central-1.amazonaws.com/downloads/Clockify_Setup.exe'
  checksum      = '1243690DD7F1A52BAFEE77903E4BE4E8E2A89953A219E427130C0356545E8D48A07AF8D3535CE02714941ADDAA71ED0FD70856F7B405A2F68AFD631A5C29DC57'
  checksumType  = 'sha512'

  silentArgs    = '/S'
}

Install-ChocolateyPackage @packageArgs
