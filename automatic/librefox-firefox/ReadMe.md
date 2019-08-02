# [Librefox Firefox](https://chocolatey.org/packages/librefox-firefox)

**Librefox: Browse With Freedom**
This project aims at enforcing privacy and security of Firefox without forking the project.

Librefox uses more than 500 privacy/security/performance settings, patches, Librefox-Addons (optional) and a cleaned bundle of Firefox (updater, crashreporter and Firefox's integrated addons that don't respect privacy are removed).

**Librefox is NOT associated with Mozilla or its products.**

## Features
- Updated browser: because this project is not a fork, it is kept updated with the latest Firefox version.
- Extensions firewall: limit internet access for extensions ([firewall-test-feature](https://github.com/intika/Librefox#extensions-firewall))
- IJWY (I Just Want You To Shut Up): embedded server links and other calling home functions are removed ([zero unauthorized connection](https://github.com/intika/Librefox#ijwy-i-just-want-you-to-shut-up) by default).
- User settings updates: gHacks/pyllyukko base is kept up to date.
- Settings protection: important settings are enforced/locked within `mozilla.cfg` and `policies.json`, those settings cannot be changed by addons/updates/Firefox or unwanted/accidental manipulation; To change those settings you can easily do it by editing `mozilla.cfg` and `policies.json`.
- Librefox-addons: set of optional Librefox extensions
- Statistics disabled: telemetry and similar functions are disabled
- Tested settings: settings are performance aware
- ESR and Tor version (Librefox TBB Beta)
- Tor Librefox-addons: adapted Librefox extensions for TBB
- Multi-platform (Windows/Linux/Mac/and soon Android)
- Dark theme (classic and advanced)
- Recommended and *code reviewed* addons list
- Community-Driven
- And much more...

![screenshot](https://cdn.jsdelivr.net/gh/chtof/chocolatey-packages/automatic/librefox-firefox/screenshot.png)