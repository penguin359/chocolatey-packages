# <img src="https://cdn.jsdelivr.net/gh/chtof/chocolatey-packages/manual/blinksync/blinksync.png" width="48" height="48"/> [BlinkSync - free command line file & directory synchronization tool](https://chocolatey.org/packages/blinksync)

BlinkSync is a free file and directory synchronization tool. It works both locally and over a network. It has a command line interface and is particularly suitable for scripting. Common uses include build processes, deployment/publishing, and content updates.

BlinkSync is an open source product distributed under GPLv3. It's written in C# and full source code is available on [SourceForge website](http://sourceforge.net/projects/blinksync).

Because its goal is to be a useful component in scripted processes, BlinkSync offers a **command line interface only**.

## How to use BlinkSync

The most basic command syntax is:
`blinksync <src dir> <dest dir>`

Example:
`blinksync c:\src c:\dest`
That's equivalent to a standard file copy (xcopy /s /e).

The more interesting form is when you include the delete

![screenshot](https://cdn.jsdelivr.net/gh/chtof/chocolatey-packages/manual/blinksync/screenshot.png)