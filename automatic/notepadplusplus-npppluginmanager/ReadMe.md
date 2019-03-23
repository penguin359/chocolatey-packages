# <img src="https://raw.githubusercontent.com/chtof/chocolatey-packages/master/automatic/notepadplusplus-npppluginmanager/notepadplusplus-npppluginmanager.png" width="48" height="48"/> [nppPluginManager](https://chocolatey.org/packages/notepadplusplus-npppluginmanager)

[Plugin Manager](https://github.com/notepad-plus-plus/notepad-plus-plus) that allows you to install, update and remove plugins for [Notepad++](https://notepad-plus-plus.org). 
A centrally hosted XML file holds the list of plugins, that the plugin manager downloads and processes against the list of installed plugins.     

Features
- Install, Update and Remove all existing plugins
- Notify when an installed plugin has an update available, and allow the user to update directly
- Calculate dependencies between plugins, any plugin can depend on another plugin, which will be installed automatically if the user installs the initial plugin
- Install all supplemental files as well as the plugin file itself (e.g. config, doc, extra libraries)
- Automatic installation of the correct version (ANSI/Unicode) for your Notepad++
- Validation of DLLs copied, against a central list of valid files. This slightly mitigates the risk of automatically downloading updates.
- Only plugins that are compatible with your Notepad++ are shown
- Plugins can be put into categories - a suggestion was made of "Official, Common and Others". Currently all plugins are in the "Others" category, as I think there needs to be some agreement as to what determines an "Official" plugin and which plugins are "Common".
- Plugin Manager is able to update itself, and will notify the user when an update is available
- Proxies are supported, just change the setting
- Updates can be ignored, and the user will not be alerted to that update again, until a further new version of that plugin is released.
- The local plugin list file is only downloaded when something has changed - the MD5sum of the file is compared to the server's version, and if it is different, then a new copy is downloaded.
- New for 0.9: Works with plugins that are installed multiple times - update them all or individually
