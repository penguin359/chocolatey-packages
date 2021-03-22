# <img src="https://cdn.jsdelivr.net/gh/chtof/chocolatey-packages/automatic/mailslurper/mailslurper.png" width="48" height="48"/> [MailSlurper](https://chocolatey.org/packages/mailslurper)

MailSlurper is a small SMTP mail server that slurps mail into oblivion! MailSlurper is perfect for individual developers or small teams writing mail-enabled applications that wish to test email functionality without the risk or hassle of installing and configuring a full blown email server. It's simple to use! Simply setup MailSlurper, configure your code and/or application server to send mail through the address where MailSlurper is running, and start sending emails! MailSlurper will capture those emails into a database for you to view at your leisure.

## Features
- Responsive web-based interface
- Themes
- Search for mails by subject, body, sender, or recipient
- Save frequently used searches
- Captures attachments
- Server runs on Windows, OSX, and Linux!
- Configurable to run on any address and port
- Support for SSL
- Basic user authentication

## Notes
- mailslurper.exe must be launched from the directory containing the config file config.json

## Package installation defaults

By default, **installation** of this package:
- Will be installed in Chocolatey tools directory.

## Package parameters
- `/InstallDir` - Installation directory, by default Chocolatey tools directory.

**Example:**
`choco install mailslurper --params '"/InstallDir:C:\your\install\path"'`

To have choco remember parameters on upgrade, be sure to set `choco feature enable -n=useRememberedArgumentsForUpgrades`

![screenshot](https://cdn.jsdelivr.net/gh/chtof/chocolatey-packages/automatic/mailslurper/screenshot.png)
