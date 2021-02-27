$ErrorActionPreference = 'Stop';

Start-Process "${env:LOCALAPPDATA}\Tartube\uninstall.exe" -ArgumentList '/S'