# <img src="https://cdn.jsdelivr.net/gh/chtof/chocolatey-packages/automatic/davmail/davmail.png" width="48" height="48"/> [DavMail Gateway - Workstation (personal) mode](https://chocolatey.org/packages/davmail)

Ever wanted to get rid of Outlook ? DavMail is a POP/IMAP/SMTP/Caldav/Carddav/LDAP exchange gateway allowing users to use any mail/calendar client (e.g. Thunderbird with Lightning or Apple iCal) with an Exchange server, even from the internet or behind a firewall through Outlook Web Access. DavMail now includes an LDAP gateway to Exchange global address book and user personal contacts to allow recipient address completion in mail compose window and full calendar support with attendees free/busy display.

DavMail is developed with [JetBrains IntelliJ IDEA](http://www.jetbrains.com/idea/?from=DavMail). YourKit also supports open source projects, including DavMail, with its full-featured [YourKit Java Profiler](https://www.yourkit.com/java/profiler).

DavMail Architecture
The main goal of DavMail is to provide standard compliant protocols in front of proprietary Exchange. This means LDAP for global address book, SMTP to send messages, IMAP to browse messages on the server in any folder, POP to retrieve inbox messages only, Caldav for calendar support and Carddav for personal contacts sync. Thus any standard compliant client can be used with Microsoft Exchange.

DavMail gateway is implemented in java and should run on any platform. Releases are tested on Windows, Linux (Ubuntu) and Mac OSX. Tested successfully with the Iphone (gateway running on a server).

DavMail CardDav implementation was sponsored by [French Defense](http://www.defense.gouv.fr/dga) / DGA through project [Trustedbird](http://www.trustedbird.org).

![screenshot](https://cdn.jsdelivr.net/gh/chtof/chocolatey-packages/automatic/davmail/screenshot.png)