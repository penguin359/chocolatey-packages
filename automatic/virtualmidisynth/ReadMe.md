# <img src="https://cdn.jsdelivr.net/gh/chtof/chocolatey-packages/automatic/virtualmidisynth/virtualmidisynth.png" width="48" height="48"/> [VirtualMIDISynth](https://chocolatey.org/packages/virtualmidisynth)

VirtualMIDISynth is a software MIDI synthesizer implemented as a Windows multimedia user driver, accessible as a standard MIDI Out device.

It works on Windows **XP (SP3) / Vista (SP1) / 7 (SP1) / 8.x / 10 (both x86 and x64)**, and is based on the great [BASS library](http://www.un4seen.com) from un4seen.

## Main features
- User mode multimedia driver, no reboots, no [BSOD](http://www.wikipedia.org/wiki/BSOD)
- Directly accessible as MIDI Out device, no need for virtual MIDI cables (like MIDI Yoke, LoopBe1)
- Supports up to 4 virtual devices, each with its own soundfont configuration *(new in version 2.x)*
- Virtually unlimited polyphony (limited only by available CPU power)
- MIDI mixer to set track mute/volume, accessible through systray icon
- Integrated MIDI converter to easily convert your MIDI files to WAV/MP3/FLAC
- Lightweight setup (~1.2 MBytes)
- No DLL cluttering, everything is self contained installation folder (except for MIDI device driver) *(new in version 2.x)*
- Clean installer, won't affect other MIDI devices
- Efficient RAM usage (allows using large SoundFonts, > 1GByte)
- Load soundFonts (up to available memory), enable/disable/chain them at your will; native 64bit version (on x64 OS) is not limited to 4GByte (new in version 2.x)
- Configure MIDI Mapper default device (this feature is already available in XP, but missing in Vista / Windows 7)
- Windows 8/10 users can also install [CoolSoft MIDIMapper](https://coolsoft.altervista.org/midimapper) and configure it straight from VirtualMIDISynth configurator to get the well-known MIDI Mapper back to their systems
- Multilanguage dialogs.
If you want to help in translation, see [here](https://coolsoft.altervista.org/swtranslate/virtualmidisynth) for status then [get in touch](https://coolsoft.altervista.org/contact) to have access to the online translation system.

Take a look at the [TODO list](https://coolsoft.altervista.org/virtualmidisynth/todo) of what features you'll find in next versions or [propose your ideas](https://coolsoft.altervista.org/forum/virtualmidisynth/wishlist).

![screenshot](https://cdn.jsdelivr.net/gh/chtof/chocolatey-packages/automatic/virtualmidisynth/screenshot.png)