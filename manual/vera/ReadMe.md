# <img src="https://cdn.jsdelivr.net/gh/chtof/chocolatey-packages/manual/vera/vera++.png" width="48" height="48"/> [Vera++](https://chocolatey.org/packages/vera)

## Introduction
Vera++ is a programmable tool for verification, analysis and transformation of C++ source code.

The main usage scenarios that are foreseen for Vera++ are:

- Ensure that the source code complies with the given coding standards and conventions.
- Provide source code metrics and statistics.
- Perform automated transformations of the source code, which can range from pretty-printing to diagnostics to fault injection and advanced testing.

The main design idea of Vera++ is to create a generic engine that will be able to parse the C++ code and present it in the form of collections of various objects to user provided scripts that will define the concrete actions to be executed.

Currently the following object collections are provided:

- Collection of source file names.
- Collection of source lines for each file.
- Collection of identified tokens in each file.
**Note:** It is foreseen that future versions of Vera++ will provide also the semantic view on the code.

The most important feature of Vera++ is that all activities other than code parsing are defined by scripts.
This means that Vera++ is *flexible* and *extensible*.

For example, compliance with coding standards can be expressed in terms of *rules*, each being defined by a separate script. The scripts can access all collections listed above and perform actions related to the given rule. The user can ask to run any given script or some defined set of scripts in a single program execution.

As a simple example, a coding convention that limits the length of the source line can be implemented as a script that traverses the collection of files and the collection of source lines and checks whether each source line fits within the given limits. A report can be generated for each non-conforming line of code so that the user gets a clear information about where the problem is located.

All existing rules present their reports in the format that is compatible with regular compiler's output, so that it is easy to integrate Vera++ with the existing build framework.

Similarly, automated transformation procedures are implemented as separate scripts that scan the above collections and produce another source files according to their algorithms. A simple example of such transformation might be a script that removes empty lines from source code.

The Tcl programming language is currently supported for scripts that run within Vera++.

## Screenshots
Vera++ is a text only tool with no GUI, but it works smoothly with many graphical tools.
### QtCreator  
![screenshot](https://cdn.jsdelivr.net/gh/chtof/chocolatey-packages/manual/vera/screenshot1.png)
### Microsoft Visual C++ 2010  
![screenshot](https://cdn.jsdelivr.net/gh/chtof/chocolatey-packages/manual/vera/screenshot2.png)
### XCode  
![screenshot](https://cdn.jsdelivr.net/gh/chtof/chocolatey-packages/manual/vera/screenshot3.png)
### CDash  
![screenshot](https://cdn.jsdelivr.net/gh/chtof/chocolatey-packages/manual/vera/screenshot4.png)