# <img src="https://cdn.jsdelivr.net/gh/chtof/chocolatey-packages/install/solvespace/solvespace.png" width="48" height="48"/> [SolveSpace - Parametric 2d/3d CAD](https://chocolatey.org/packages/solvespace)

<div class=movie>
    <video preload=metadata height=420 width=620
           poster=pics/front-page-pic.png onloadedmetadata=videoPrepare(this)>
        <source src=vids/demo.webm type=video/webm>
        <source src=vids/demo.mp4 type=video/mp4 onerror=videoFallback(parentNode)>

        <!-- fall back to showing a picture and a download link -->
        <table cellpadding=0 cellspacing=0>
        <tr><td>
            <img src=pics/front-page-pic.png width=548 height=410>
        </td></tr>
        <tr><td align=right>
            [<a href=vids/demo.mp4>download demo video</a>]
        </td></tr>
        </table>
    </video>
    <a class=playbutton href=# onclick=videoPlay(event) style=display:none>
        demo video&nbsp;&nbsp;&nbsp;▶
    </a>
</div>

## Features

### Sketch sections using

- lines, rectangles, datum lines and points
- circles, arcs of a circle, datum circles
- cubic Bezier segments, C2 interpolating splines
- text in a TrueType font, exportable as vectors
- trims to split lines and curves where they intersect
- tangent arcs, to fillet lines and curves
- line styles for stroke color, stroke width, fill color
- adjustable snap grid, for entities and text
- menu item, keyboard shortcut, or toolbar
- cut and paste, in plane and from workplane to workplane
- background image with specified scale, for ease of tracing
- 3Dconnexion six degree of freedom controllers

### Constraints and dimensions on

- distance (or line length), point-line distance, diameter
- projected distance, along a line or vector
- angle, curve-to-curve tangency, parallel, perpendicular
- horizontal, vertical
- equal length, equal angle, equal radius, length ratio
- line length equals arc length
- point on line, point on circle, point on point, point on face
- point at midpoint of line, line's midpoint on plane
- points (or line) symmetric about line or plane
- 2d (projected into specified plane) and 3d geometry
- lengths in metric or inch units
- lengths entered as arithmetic expressions (32.6 + 5/25.4)

### Build solid model with

- extruded or lathed (solid of revolution) sketch
- Boolean operations: union (add material), difference (remove material)
- parametric step and repeat (pattern), rotating or translating
- operations performed on either meshes or NURBS surfaces

### Parametric and associative assembly

- import parts and drag them with six degrees of freedom
- import mirrored or with arbitrary scale
- place parts in assembly using constraints
- import surfaces, and merge them using Boolean operations
- import lines and curves, for 2d work or solid operations later
- changes in parts propagate automatically into assembly

### Analyze with

- measurements on a part or assembly (of point coordinates, line length, point-point distance, point-face distance, projected distance, face-face angle, point-line distance)
- path traced by mechanism, exportable into a spreadsheet
- area of a plane sketch, volume of a solid shell
- degrees-of-freedom check to show unconstrained points in sketch
- interference check for assemblies
- STL

![screenshot](https://cdn.jsdelivr.net/gh/chtof/chocolatey-packages/install/solvespace/screenshot.png)