$ErrorActionPreference = 'Stop';

$miktex_dir = Get-AppInstallLocation MiKTeX
$arch       = Get-OSArchitectureWidth

Start-Process -Wait "${miktex_dir}\miktex\bin\x${arch}\miktexsetup.exe" -Verb RunAs -ArgumentList "uninstall"