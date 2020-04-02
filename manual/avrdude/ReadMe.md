# <img src="https://cdn.jsdelivr.net/gh/chtof/chocolatey-packages/manual/avrdude/avrdude.png" width="48" height="48"/> [AVR Downloader/UploaDEr](https://chocolatey.org/packages/avrdude)

[AVRDUDE](http://savannah.nongnu.org/projects/avrdude) is a utility to download/upload/manipulate the ROM and EEPROM contents of AVR microcontrollers using the in-system programming technique (ISP).

## Main features
The major features of AVRDUDE include:

- Command-line driven user interface for all downloading and uploading features (including handling fuse bytes), for easy automation e. g. by inclusion into Makefiles.
- Interactive examination and modification of various memory regions in so-called *terminal mode*. Also offered is an option to modify the operational parameters of an Atmel STK500 board (target voltage, VAref, master clock frequency).
- Known to run on all major POSIX-style operating systems, as well as Win32 platforms. By using existing operating system drivers on the POSIX-style systems, secure parallel-port access without root privileges can be maintained. On Win32 platforms, parallel port access requires the previous installation of a driver (`giveio.sys`) that grants a user process direct access to the IO registers.
- Supports a wide range of programming hardware, from cheap ISP plugs that connect the AVR's ISP interface directly to a computer's parallel port (no additional circuitry) or serial port (some additional circuitry needed), more advanced ISP adapters using a buffer/driver chip (like a 74HC373), up to (more complex) serially connected programmers like AVR910-style ISP devices, the Atmel STK500 board, and the Atmel JTAG ICE mkII. Most popular adapters come pre-defined, adding a new parallel-port adapter is as simple as editing a configuration file (no recompilation needed).
- Supports Intel Hex, Motorola S-Record, and raw binary files for input and output, as well as direct memory contents specification on the command-line (useful e. g. for fuse bytes). On input, the file format can be auto-detected.
- In "terminal mode", the device's memory areas can be examined, and possibly modified. This allows to set fuses interactively, or to modify a few EEPROM cells.