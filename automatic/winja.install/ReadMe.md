# <img src="https://cdn.jsdelivr.net/gh/chtof/chocolatey-packages/automatic/winja.install/winja.install.png" width="48" height="48"/> [Winja](https://chocolatey.org/packages/winja.install)

Winja is a free application for Microsoft Windows that lets you find potential malware on your system. It uses the scanning engine of virtually all antivirus products in the market to give you a very precise idea of the risk posed by a particular file.

## Two concrete examples of using Winja
- You have downloaded a file from the Internet, you want to remove as many doubts as possible. Drag this file onto the main window and wait for the results that will appear on your desktop.
- You suspect your computer is infected. Scan all services and processes for malware.
To do this, Winja first uses the VirusTotal public API to submit the fingerprint of a file. If this fingerprint exists, Winja returns the existing analysis report. If not (with your previously set permission), Winja sends the unknown file to VirusTotal servers for scanning. It is also possible for you to have files (called samples) analyzed again at any time to update the detection ratio.

## Winja lets you, very simply and quickly, find suspicious files in places favored by malware
- Active Processes
- Processes that use network resources (that connect to the Internet)
- Services
- Applications that start with Windows
- Task Scheduler
You can also easily drag and drop files to the main Winja window or to the desktop gadget to scan them.

The final example of scanning is the use of an extension for Windows Explorer that allows you to request a scan by right-clicking on one or more files from your file browser.

Since version 6, Winja is available in French following strong demand from the French-speaking community.

Winja is cited and recommended by VirusTotal (a subsidiary of Google) as an alternative to their own desktop application for Windows: [https://support.virustotal.com/hc/en-us/articles/115002179065-Desktop-apps](https://support.virustotal.com/hc/en-us/articles/115002179065-Desktop-apps)

For our part, as well as theirs, we make sure that this application is a complement to your favorite antivirus and does not put at risk the antivirus brands that lend us their signatures free of charge.

For this reason, Winja remains a passive analysis tool and is not a substitute for the installation and use of an antivirus software.

![screenshot](https://cdn.jsdelivr.net/gh/chtof/chocolatey-packages/automatic/winja.install/screenshot.png)