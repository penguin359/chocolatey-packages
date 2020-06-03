$ErrorActionPreference = 'Stop';

$miktex_dir = Get-AppInstallLocation MiKTeX
write-warning $miktex_dir
$arch       = Get-OSArchitectureWidth
write-warning $arch

Start-Process -Wait "${miktex_dir}\miktex\bin\x${arch}\miktexsetup.exe" -Verb RunAs -ArgumentList "uninstall"
Remove-Item -Recurse "${miktex_dir}"