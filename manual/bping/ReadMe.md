# <img src="https://cdn.jsdelivr.net/gh/chtof/chocolatey-packages/automatic/bping/bping.png" width="48" height="48"/> [Bping](https://chocolatey.org/packages/bping)

Bping (pronounced beeping) is a Windows ping alternative that beeps whenever it gets replies. I spend a lot of time diving under desks fiddling with network cables and got tired of looking up at the monitor to see how my pings were doing, and thus bping was born.

Has a bunch of enhancements over the regular ping.exe:

- beeps! (but you already knew that). The default sound is from Space Invaders, or you can specify a wav file to play, or use the system speaker. By default it beeps when it gets a response, but it can also beep only when it doesn't.

- can function as an internet connection tester. Just run bping with no commandline arguments and it'll keep testing your internet connection. This is by far my favorite usage for it.

- can scan an entire network and tell you at a glance what IP addresses are available and which are taken. See the screenshot below to see what this looks like. My second favorite usage for Bping.

- Note that it doesn't replace the regular ping.exe, just type bping instead of ping whenever you want to use bping.

A note for Windows 7/8/10 users: for myseterious reasons Microsoft requires admin rights for access to the networking stack in Win 7/8/10, so you'll need to set Bping to run as admin. You can make that change permanent by right-clicking it and choosing Properties -> Compatibility, then check run

![screenshot](https://cdn.jsdelivr.net/gh/chtof/chocolatey-packages/automatic/bping/screenshot.png)