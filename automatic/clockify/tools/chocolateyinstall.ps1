$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName

  url           = 'https://clockify-resources.s3.eu-central-1.amazonaws.com/downloads/Clockify_Setup.exe'
  checksum      = 'E022069AC093BF21F9E72E5BED6BB63F41F526BFF9A45E34F449F86B22B1E69A59C7AB0342F5CEB537ECF122E7E4137C00A284CC5CE3FF8F405D10129F771AEC'
  checksumType  = 'sha512'

  silentArgs    = '/S'
}

Install-ChocolateyPackage @packageArgs
