# Changelog

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/).
Right now this project is in Beta and does not yet follow [Semantic Versioning](https://semver.org/spec/v2.0.0.html). 
Hence, occasionally changes will be backwards incompatible (although they will all be documented here).


## [0.6.3] - 2020-12-2

### Added
- Added settings.drawing_auto_hbox to toggle the default value of auto_hbox when using zx.draw()
- Added function generate.spider to construct a graph containing a single spider.
- Added function Graph.translate(x,y) to translate all the coordinates in the Graph instance by the specified amount.
- Added additional rewrite rule to editor for H-box fusion
- Added hsimplify.zh_simp() rewrite strategy that does a collection of rewrites of increasing difficulty to simply ZH-diagrams.

### Changed
- The par_hbox() simplification can now also handle wires with NOTs on them.
- The copy rule in the editor now also understands how to copy a |-> state through an H-box.

### Fixed
- Fixed exception in editor that made it unusable.
- Fixed bug when matching parallel Hadamards with match_hadamards().
- Undo in editor correctly remembers scalar.


## [0.6.2] - 2020-11-16

### Added
- Added extract_simple function as simple method for extracting circuits from ZX-diagrams that have causal flow.
- Added function find_scalar_correction(g1,g2) that gives the correct scalar to make g1 and g2 equal (assuming they represent the same linear map up to a global scalar).
- Added function drawing.graphs_to_gif that takes in a list of Graphs and outputs an animated gif showing them in sequence. Note that this requires imagio to be installed.
- The output classes for each of the vertex and edge types in the methods for converting a Graph to tikz format can now be set using zx.settings.tikz_classes.
- draw_matplotlib, draw_d3 (and hence zx.draw) and editor.edit have additional optional argument show_scalar to display the scalar of the Graph.
- Added argument draw_scalar to all functions converting a Graph into tikz format to toggle the display of the scalar of the Graph in the tikz output.
- The Graph method to_json now remembers the scalar of the graph by default (and Graph.from_json can handle this).


### Fixed
- basicrules.strong_comp now preserves scalar correctly.
- Undo in editor now remembers scalar correctly.
- bialg and copy rewrites in editor now preserve scalar correctly.


## [0.6.1] - 2020-10-30

### Added
- Mac users can now Command-click instead of Ctrl-click in the editor.
- Added ``Graph.to_tikz`` and ``Graph.from_tikz`` functions in order to convert ZX-diagrams to and from a tikz file.
- Can now compose ``Graph`` instances using the ``*`` operator.
- Added function ``Graph.add_edge_smart`` as a convenience wrapper for ``Graph.add_edge_table``.
- Added ``Graph.auto_detect_io`` as an alias of ``Graph.auto_detect_inputs``, perhaps deprecating the old function at some point.
- Added top-level scalar magic constants ``ONE, SQRT_TWO, TWO, SQRT_TWO_INV, TWO_INV`` in order to more easily set the value of ``g.scalar`` for ``Graph`` instances.

### Changed
- Changed default behaviour of ``preserve_scalar`` argument in ``compare_tensors``: now always defaults to ``False``.
- ``Circuit.verify_equality`` now doesn't say SWAP is equal to the identity. Added an argument to get back the original behaviour.
- Changed the output of ``zx.draw`` slightly: more visible labels, more colourblind friendly colours.

### Fixed
- Fixed several bugs in the rewriting with functions in ``editor_actions.py``
- Fixed bug where Graph.num_edges() wouldn't return correct number of edges.
- Fixed error that occurred when running pyzx from a different drive than the install drive on Windows.
- Fixed several bugs in ``hsimplify.hpivot_simp``.
- Fixed exception when entering negative phase in editor.


## [0.6.0] - 2020-06-16
This release has made many backwards incompatible changes to the API in order to remove some old functions and rename other functions to more logical or consistent names. In particular, all British spelling names have been renamed to American spelling names. After this release the API should be significantly more stable.

The license for this project has been changed from GPLv3 to Apache2, in order to streamline the process of using PyZX with other open-source quantum computing projects.

### Added
- All functions now have typing hints, and mypy runs successfully on PyZX.
- ZX-diagram editor that runs in a Jupyter notebook. See the documentation for the details.
- New function ``zx.matrix_to_latex`` to pretty-print a numpy matrix (useful in Jupyter notebook in combination with ``ipywidgets.Label``).
- There is now a ``zx.settings`` object that stores some global values that affect how PyZX draws stuff, and how it interacts with external executables.
- Added ``zx.draw_d3`` and ``zx.draw_matplotlib`` to account for new behaviour of ``zx.draw``.

### Changed
- Circuit extraction algorithm has been updated to use the one from the [There and back again](https://arxiv.org/abs/2003.01664) paper.
- Main circuit extraction function has been renamed from ``zx.extract.streaming_extract`` to``zx.extract_circuit``.
- ``zx.draw`` now intelligently changes whether to use d3 or matplotlib. Setting can be changed using ``zx.settings.drawing_backend``.
- The official language of PyZX is now American English, instead of a mix of British and American english.
- ``g.normalise()`` has been renamed to ``g.normalize()``.
- ``g.neighbours()`` has been renamed to ``g.neighbors()``.
- The various functions for converting ZX-diagrams into json or other formats now have become methods of the Graph instance themselves. I.e. ``g.to_json()`` instead of ``zx.io.graph_to_json(g)`` and ``Graph.from_json(js)`` instead of ``zx.io.json_to_graph(js)``.
- ``g.auto_detect_inputs()`` is now smarter, and turns any boundary node that 'points right' into an input, and similarly for outputs.
- ``zx.compare_tensors`` now automatically only checks equality up to scalar if one of the arguments is a Circuit.
- ``add_edge_table`` function in ``BaseGraph`` now supports more operations involving H-boxes, so that ZH-calculus simplifications can apply to more diagrams.
- Numerous small bugfixes that were found as a result of mypy type-checking that probably weren't affecting any existing code.

### Removed
- Several files and functions that weren't being used and only caused confusion to new users, including ``phasepoly.py``, and all the ``*_threaded`` functions from ``simplify.py``
- Removed support for running PyZX inside of Quantomatic, as this functionality probably didn't work anyway (since PyZX now used Python3 functionality).

### Deprecated
- ``zx.d3.draw`` is deprecated. Use ``zx.draw`` or ``zx.draw_d3`` instead.
- ``zx.extract.streaming_extract`` is deprecated. Use ``zx.extract_circuit`` instead.


## [0.5.1] - 2020-04-08
Hotfix release to fix syntax error that prevented scripts from being called.


## [0.5.0] - 2020-04-07
First PyPI release.