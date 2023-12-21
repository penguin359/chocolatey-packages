# Chocolatey Packages

[![Appveyor Build](https://ci.appveyor.com/api/projects/status/github/penguin359/chocolatey-packages?svg=true)](https://ci.appveyor.com/project/penguin359/chocolatey-packages)
[![](http://transparent-favicon.info/favicon.ico)](#)
[![Update status](https://img.shields.io/badge/Update-Status-blue.svg)](https://gist.github.com/penguin359/82fb09d745a7785fa8580f1a4075d96b)
[![](http://transparent-favicon.info/favicon.ico)](#)
[![chocolatey/penguin359](https://img.shields.io/badge/Chocolatey-penguin359-yellowgreen.svg)](https://chocolatey.org/profiles/penguin359)

Welcome on the repository of Chocolatey Packages created and/or maintained by penguin359 !

---

This repository contains [chocolatey automatic packages](https://chocolatey.org/docs/automatic-packages).  
The repository is setup so that you can manage your packages entirely from the GitHub web interface (using AppVeyor to update and push packages) and/or using the local repository copy.

### Folder Structure

* icons - Where you keep icon files for the packages. This is done to reduce issues when packages themselves move around.
* setup - items for prepping the system to ensure for auto packaging.

For setting up your own automatic package repository, please see [Automatic Packaging](https://chocolatey.org/docs/automatic-packages)

### Requirements

* Chocolatey (choco.exe)

#### AU

* PowerShell v5+.
* The [AU module](https://chocolatey.org/packages/au).

For daily operations check out the AU packages [template README](https://github.com/majkinetor/au-packages-template/blob/master/README.md).


Chocolatey packages which contain an `update.ps1` script in their folder are automatically packaged up by [AU](https://chocolatey.org/packages/au).

### Automatic Updater (AU)

AU works with packages without automatic package tokens necessary. So you can treat the packages as normal.

Execute `update_all.ps1` in the repository root to run [AU](https://chocolatey.org/packages/au) updater with default options.

To fully setup all the features ensure you perform the steps in the [setup/README.md](https://github.com/chocolatey/chocolatey-packages-template/blob/master/setup/README.md#automatic-updater-au)

To get the packages that implement AU updater run `Get-AUPackages` or `lsau` in this directory.

**NOTE:** Ensure when you are creating packages for AU, you don't use `--auto` as the packaging files should be normal packages. AU doesn't need the tokens to do replacement.
