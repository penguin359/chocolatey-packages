# <img src="https://cdn.jsdelivr.net/gh/chtof/chocolatey-packages/automatic/recyclenow/recyclenow.png" width="48" height="48"/> [RecycleNOW - Free Removal Tool](https://chocolatey.org/packages/recyclenow)

**RecycleNOW is a small utility that, when triggered, immediately empties the Recycle Bin.**
It is meant to be a time-saver as, especially on slower computers, emptying the Bin can take a while. There is no interface, just run it and it will automatically empty the recycle bin. You can use a scheduler to run it, run it from the command line etc. Very simple, but may be useful for some.

## Features
- Fast as lightning
- There's no visible interface, just an icon
- Double-click and FLASH! The bin is empty!
- Runs on Windows 95/98/ME/NT4/2k/2k3/2k8/XP/V/7/10

## Package installation defaults
By default, **installation** of this package:
- Will be installed in Chocolatey tools directory.
- Will _NOT_ install a desktop icon.
- Will install a start menu shorcut.

## Package parameters
- `/InstallDir` - Installation directory, by default Chocolatey tools directory.
- `/DesktopIcon` - Create a desktop shortcut.
- `/NoStartMenu` - Do not create a start menu shortcut.

**Example:**
`choco install recyclenow --params '"/InstallDir:C:\your\install\path /DesktopIcon /NoStartMenu"'`

To have choco remember parameters on upgrade, be sure to set `choco feature enable -n=useRememberedArgumentsForUpgrades`
