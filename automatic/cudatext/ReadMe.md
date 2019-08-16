# <img src="https://cdn.jsdelivr.net/gh/chtof/chocolatey-packages/automatic/cudatext/cudatext.png" width="48" height="48"/> [CudaText](https://chocolatey.org/packages/cudatext)

**CudaText** is a cross-platform text editor, written in Lazarus.
It is fully open source, see [Wiki info](http://wiki.freepascal.org/CudaText#How_to_compile_program).
It starts quite fast (0.5 sec with ~30 plugins on CPU Intel Core i3 3Hz).
It is extensible by Python add-ons (plugins, linters, code tree parsers, external tools).

### Package Specific
#### Package Parameters
The following package parameter can be set:
 * `/InstallationPath:` - Where to install the binaries to - defaults to "C:\CudaText"

To pass parameters, use `--params "''"` (e.g. `choco install packageID [other options] --params="'/ITEM:value /ITEM2:value2 /FLAG_BOOLEAN'"`).
To have choco remember parameters on upgrade, be sure to set `choco feature enable -n=useRememberedArgumentsForUpgrades`.

## Features
- Syntax highlight for many languages: C, C++, JavaScript, HTML, CSS, PHP, Python, XML etc. 200+ syntax lexers exist.
- Code tree (tree structure of functions/classes/etc in source).
- Code folding.
- Multi-carets and multi-selections.
- Find/Replace with reg. ex.
- Configs in JSON format. Including lexer-specific configs.
- Tabbed UI.
- Split each tab.
- Split view for 2/3/4/6 files.
- Simple auto-completion (fixed list) for some lexers.
- Command palette (ST3 style).
- Minimap.
- Micromap.
- Show unprinted whitespace.
- Support for many encodings.
- Customizable hotkeys.
- Binary/Hex viewer for files of unlimited size.

### Features for HTML/CSS coding:
- Smart auto-completion for HTML, CSS.
- HTML tags completion with Tab-key (Snippets plugin).
- HTML color codes (#rgb, #rrggbb) underline.
- Show pictures inside editor area (jpeg/png/gif/bmp/ico).
- Show tooltip when mouse moves over picture tag, entity, color value.