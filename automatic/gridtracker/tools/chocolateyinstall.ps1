$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName  = $env:ChocolateyPackageName

  url          = 'https://ucfdf9565ab9d7472e8565ff9367.dl.dropboxusercontent.com/cd/0/get/A_6MRHZFP9OI4nEj9csk-Ap2i3OJ-VdtoP0hsPMMQQktlrki2kPx7uOHb1Dta0blKT-_H5myp99mc2KaJw0NQFNx8_fuvJbPPRAOlMVag6LuE6fQfMmS0EqzW5mDwZeLIXk/file?dl=1#'
  checksum     = '67cbee2bc9c1736f4b9305382edba2e3f5290274cad2a844bdeed92a866ae8a7'
  checksumType = 'sha256'

  silentArgs   = '/S'
}

Install-ChocolateyPackage @packageArgs
