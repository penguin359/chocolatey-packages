[ASN.1 Editor](https://chocolatey.org/packages/asn1editor)

The code consist of two parts:

1. ASN.1 parser library. This library I wrote, is very fast and memory efficient.
2. Graphical User Interface provided by Windows Presentation Framework (WPF) with MVVM (Model-View-ViewModel) pattern.

Old tool has unacceptable slow performance. For example, it took about 7 minutes to open a 90kb certificate revocation list file. While, for my tool it is a matter of 2-3 seconds on the same hardware. Feel the difference.

## Same look new quality
The new tool resembles WinForms tool visual behavior, so existing editor users will not have difficulties with new tool:

![screenshot](https://cdn.jsdelivr.net/gh/chtof/chocolatey-packages/automatic/azclient/screenshot1.png)

and comparing with previous tool:

![screenshot](https://cdn.jsdelivr.net/gh/chtof/chocolatey-packages/automatic/azclient/screenshot2.png)

Very similar, so existing editor users will not face problems while using my own (if they wish to use new editor).

## Main Features
Main features in most are the same.

### Dump Text Format data
You can view the selected node branch text dump by right-clicking the designated node and selecting “View Node Text”:

![screenshot](https://cdn.jsdelivr.net/gh/chtof/chocolatey-packages/automatic/azclient/screenshot3.png)

This window provides TreeView textual visualization. It defines four columns:

- **Offset** – specifies the start offset of the specified structure;
- **Len** – specifies the structure’s payload length in bytes;
- **LenByte** – specifies how many bytes are required to store length bytes (including transitional length byte). I’m not sure whether it is necessary, maybe we need more interesting data?
Tree View text visualizer with decoded primitive type value.
You can save this information to a file and print, if necessary.

### Hex data viewer

![screenshot](https://cdn.jsdelivr.net/gh/chtof/chocolatey-packages/automatic/azclient/screenshot4.png)

in previous tool, hex data viewer was a separate window. I decided to combine them in the same window. By default, hex viewer is collapsed and can be opened by toggling the button in the toolbar. Hex viewer panel contains two toggle buttons. They are used to hide hex address and ASCII data panes:

![screenshot](https://cdn.jsdelivr.net/gh/chtof/chocolatey-packages/automatic/azclient/screenshot5.png)

When you select node in the Tree View panel, corresponding bytes are highlighted in the hex viewer as follows:

- **Red** – this color indicates tag byte
- **Green** – this color indicates length bytes. This includes transitional byte (if any).
- **Black** – this color indicates the payload bytes.

### Node data editor
By double-clicking on a node (or selecting from tree node context menu), a node data editor is opened:

![screenshot](https://cdn.jsdelivr.net/gh/chtof/chocolatey-packages/automatic/azclient/screenshot6.png)

You can edit data for any primitive non-constructed type (except, NULL tag). Explicit value presentation depends on data type. For many types, textual value is displayed and allowed for input. However, not for all types there is encoder and decoder, so for certain types you will see raw hex view (and raw hex text should be inserted):

![screenshot](https://cdn.jsdelivr.net/gh/chtof/chocolatey-packages/automatic/azclient/screenshot7.png)

As already said, NULL and constructed types are not editable:

![screenshot](https://cdn.jsdelivr.net/gh/chtof/chocolatey-packages/automatic/azclient/screenshot8.png)

**Note**: node content editor applies restrictions for certain data types. For example, if you are editing numeric strict, the code verifies whether all characters in the text are valid for numeric string.

### Save Selected Node Data into Another File
You can save the selected node data into a file by right-clicking the node and selecting "Save selected node as...". Data is saved as a binary copy of the entire selected structure, including tag header and full tag payload.

### Operations with nodes
You can cut, copy and paste existing nodes. You can use either context menu or toolbar. There are three options of paste destination:

- Before selected node;
- After selected node;
- Paste a as a last child node of the parent. In other words, as the last node in the current level.
When you operate with nodes, internal raw data and hex viewer are updated accordingly.

### Data converter
Data converter window allows you to convert the data between various text encodings:

![screenshot](https://cdn.jsdelivr.net/gh/chtof/chocolatey-packages/automatic/azclient/screenshot9.png)

This window maintains internal data source, so changes here are not reflected in main tree view. When you open data converter, data source from main tree view is copied to data converter window. Alternatively, you can open external file or paste text from clipboard. When you paste text from clipboard, you need to click Validate button, so converter will attempt to decode the pasted data format. Unlike with previous editor, you don’t need to care about source encoding, converter will do it for you. By clicking appropriate radio button, the data is converted to an appropriate format:

![screenshot](https://cdn.jsdelivr.net/gh/chtof/chocolatey-packages/automatic/azclient/screenshot10.png)

You can save this view to a file as a text, or as a pure binary copy (converted from pasted text). Also, you can print current view.

Starting with version 1.3.5, Binary Converter allows you to paste ASN string and decode it in main window. This feature allows to decode strings without having to save them in files.

Tip: the code is smart enough to detect the pasted text format (or opened file content format) and is able to convert, for example, hex view with address and ASCII panes, or base64 with or without header to a raw byte array. In addition, the code correctly handles files saved in UTF-7, UTF-8, Unicode and UTF-32 encoding.