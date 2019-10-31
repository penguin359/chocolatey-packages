# <img src="https://cdn.jsdelivr.net/gh/chtof/chocolatey-packages/automatic/pkcs11admin/pkcs11admin.png" width="48" height="48"/> [Pkcs11Admin](https://chocolatey.org/packages/pkcs11admin)

GUI tool for administration of PKCS#11 enabled devices.

Pkcs11Admin is an open-source GUI tool for administration of PKCS#11 enabled devices (smartcards, HSMs etc.).

## Package installation defaults

By default, **installation** of this package:
- Will _NOT_ install a desktop icon.
- Will install a start menu shorcut.

## Package parameters
- `/InstallDir` - Installation directory, by default Chocolatey tools directory.
- `/DesktopIcon` - Create a desktop shortcut.
- `/NoStartMenu` - Do not create a start menu shortcut.

**Example:**
`choco install pkcs11admin --params '"/InstallDir:C:\your\install\path /DesktopIcon /NoStartMenu"'`

To have choco remember parameters on upgrade, be sure to set `choco feature enable -n=useRememberedArgumentsForUpgrades`.

![screenshot](https://cdn.jsdelivr.net/gh/chtof/chocolatey-packages/automatic/pkcs11admin/screenshot.png)