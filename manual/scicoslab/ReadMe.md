# <img src="https://cdn.jsdelivr.net/gh/chtof/chocolatey-packages/manual/scicoslab/scicoslab.png" width="48" height="48"/> [ScicosLab](https://chocolatey.org/packages/scicoslab)

ScicosLab is the new name of ScilabGtk. This change of name has been decided in order to avoid all confusion with Scilab, which is no longer developed at INRIA. ScicosLab is developed by some of the researchers who originally developed Scilab at INRIA and ENPC. ScicosLab is used in particular for disributing new software developments stemming from research activities of the Metalau team at INRIA and ENPC, such as [Scicos](http://www.scicos.org) and the [Maxplus algebra toolbox](http://www-rocq.inria.fr/metalau/quadrat).

ScicosLab is a [Gtk+](http://www.gtk.org) version of Scilab, based on the official Scilab [BUILD4](http://scilabsoft.inria.fr) distribution. It aims at maintaining the Gtk+ port of Scilab instead of the default X11 graphical user interface. It can be compiled on Linux, or [MacOSX-X11-Fink](http://fink.sourceforge.net), or [MacOSX-X11-MacPorts](http://www.macports.org), or [Windows-Cygwin](http://www.cygwin.com). A set of binary packages are available for popular platforms (such as Linux Fedora, Debian, MacOSX, Windows). Note that the Win32 Windows binary have been obtained by cross-compilation on a Linux host, from a unique source code. Note also that the Scilab consortium team does not maintain ScicosLab.

ScicosLab is covered by the Scilab License ([license.txt](http://cermics.enpc.fr/~jpc/scilab-gtk-tiddly/files/license.txt)).

To contact ScicosLab maintainers to report bugs or make suggestions, send an email to: support@scicoslab.org

## History
- Initial design: (called Basile) F. Delebecque, S. Steer, with contributions by C. Bunks (Signal Processing), C. Lemarechal (Optimization), J.P. Chancelier (X11 Graphics, port to Lisp Machine) ...
- Development: Scilab Group F. Delebecque (kernel, libraries), J.P. Chancelier (graphics, kernel, Windows version), C. Gomez and M.Goursat (Metanet), R. Nikoukhah (Scicos), S. Steer (kernel, graphics, Scicos), and contributions by B. Pincon (Code improvements), E. Segre and F. Vogel (Scipad editor),
- Scilab Consortium: Scilab 4 distribution under the responsibility of C.Gomez and S.Steer (Windows packaging, Graphic editor, Distribution).
- ScicosLab distribution: J.P. Chancelier(Gtk support, updates, cross compilation), F.Delebecque, B. Pincon and J.P. Quadrat (updates).

A more complete history can be found on the [Scicos site](http://www.scicos.org/history.html).


ScicosLab incorporates some toolboxes (in particular MaxPlus arithmetic toolbox by S. Gaubert and J.P. Quadrat ) formerly available as contributions in the standard Scilab distribution.

![screenshot](https://cdn.jsdelivr.net/gh/chtof/chocolatey-packages/manual/scicoslab/screenshot.png)