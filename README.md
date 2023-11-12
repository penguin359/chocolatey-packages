# Chocolatey Packages

[![](https://ci.appveyor.com/api/projects/status/github/penguin359/chocolatey-packages?svg=true)](https://ci.appveyor.com/project/penguin359/chocolatey-packages)
[Update status](https://gist.github.com/penguin359/82fb09d745a7785fa8580f1a4075d96b)
[![](http://transparent-favicon.info/favicon.ico)](#)
[chocolatey/penguin359](https://chocolatey.org/profiles/penguin359)

### Folder Structure

* icons - Where you keep icon files for the packages. This is done to reduce issues when packages themselves move around.
* ops - scripts, jobs, and other items for ensuring automatic packaging.
* setup - items for prepping the system to ensure for auto packaging.

For setting up your own automatic package repository, please see [Automatic Packaging](https://chocolatey.org/docs/automatic-packages)

### Requirements

* Chocolatey (choco.exe)

#### AU

* PowerShell v5+.
* The [AU module](https://chocolatey.org/packages/au).

For daily operations check out the AU packages [template README](https://github.com/majkinetor/au-packages-template/blob/master/README.md).

### Getting started

1. Fork this repository and rename it to `chocolatey-packages` (on GitHub - go into Settings, Repository name and rename).
1. Clone the repository locally.
1. Head into the `setup` folder and perform the proper steps for your choice of setup (or both if you plan to use both methods).
1. Edit this README. Update the badges at the top.


### Recommendation on Auto Packaging

AU provides more in the process of being completely automated, sending emails when things go wrong, and providing a nice report at the end. It doesn't have a bolt-on feeling to it that you see with Ketarin / ChocolateyPackageUdater, however the one thing it does lack in comparison is no visual feedback to seeing how searches for installers may be found. Other than that, it provides errors when things go wrong, where Ketarin doesn't consider anything that happens during "before run"/"post run updates" (where chocopkgup and checksumming occur) to be an error, even if those scripts error.

So for best visibility, enjoying the ease of using AppVeyor, and for a nice report of results, we recommend AU over Ketarin. You also don't need to deal with templates as AU works directly with the xml/ps1 files to do replacement.

### Adapting your current source repository to this source repository template

You want to bring in all of your packages into the proper folders. We suggest using some sort of diffing tool to look at the differences between your current solution and this solution and then making adjustments to it. Pay special attention to the setup folder.

1. Bring over the following files to your package source repository:
 * `icons\README.md`
 * `ops\*.*`
 * `setup\*.*`
 * `.appveyor.yml`
1. Inspect the following file and add the differences:
 * `.gitignore`

### Use Both Methodologies

The way this source repository is designed, you can use both AU and Ketarin/ChocolateyPackageUpdater together. This is especially helpful when migrating existing packages from one methodology to the other.

### Migrating existing Ketarin packages to AU

1. Add an update.ps1 to the package folder and determine how to update the package using [AU's instructions](https://github.com/majkinetor/au#creating-the-package-updater-script).
1. Remove the ketarin.xml file from the ketarin folder.
1. Ensure you also remove the package job from Ketarin itself as it doesn't automatically remove.

Chocolatey packages which contain an `update.ps1` script in their folder are automatically packaged up by [AU](https://chocolatey.org/packages/au).

### Automatic Updater (AU)

AU works with packages without automatic package tokens necessary. So you can treat the packages as normal.

Execute `update_all.ps1` in the repository root to run [AU](https://chocolatey.org/packages/au) updater with default options.

To fully setup all the features ensure you perform the steps in the [setup/README.md](https://github.com/chocolatey/chocolatey-packages-template/blob/master/setup/README.md#automatic-updater-au)

To get the packages that implement AU updater run `Get-AUPackages` or `lsau` in this directory.

**NOTE:** Ensure when you are creating packages for AU, you don't use `--auto` as the packaging files should be normal packages. AU doesn't need the tokens to do replacement.
