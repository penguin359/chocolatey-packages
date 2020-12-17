$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName  = $env:ChocolateyPackageName

  url          = 'https://cdn.iobit.com/dl/advanced-systemcare-setup.exe'
  checksum     = '1871468279d7a4ef596d40f690f3d81abbcfb2ebc9b80fd61d3f149df5d281cf3134e9a026d7cf33ac9ff6c6d0d06c4613bb032a266345006d663ec882f9000f'
  checksumType = 'sha512'

  silentArgs   = '/VERYSILENT /SUPPRESSMSGBOXES /NORESTART /SP-'
}

Install-ChocolateyPackage @packageArgs
