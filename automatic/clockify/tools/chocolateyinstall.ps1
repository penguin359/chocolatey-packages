$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName

  url           = 'https://clockify-resources.s3.eu-central-1.amazonaws.com/downloads/Clockify_Setup.exe'
  checksum      = 'E4D0487DF4DC59548C50E48E90655A4ABB80DB2FDBF2390799E77D4F40AEBECF06659CDEC02B967823DD8DA2E4BAAEA6EA44405A00172302C7DDB117C7372AA7'
  checksumType  = 'sha512'

  silentArgs    = "/S"
}

Install-ChocolateyPackage @packageArgs
