# Changelog

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/).
Right now this project is in Beta and does not yet follow [Semantic Versioning](https://semver.org/spec/v2.0.0.html). 
Hence, occasionally changes will be backwards incompatible (although they will all be documented here).

## [0.x.x] - xxxx-xx-xx


### Added
- Support for W nodes and Z boxes (courtesy of @RazinShaikh).
- Support for poly phases (courtesy of @RazinShaikh)
- Support for Jupyter notebooks in documentation using nbsphinx (courtesy of @dlyongemallo).
- Support for OpenQASM 3.0; added Jupyter notebook documenting supported qasm gates (courtesy of @dlyongemallo).
- A function `is_well_formed` to check that a graph is a well-formed ZX-diagram (courtesy of @RazinShaikh).
- A function `is_pauli` to check whether a phase is Pauli (courtesy of @y-richie-y)
- A function `GraphDiff` that calculates what actions are needed to bring one graph to another (used in ZXLive).
- Functions `simplify.to_clifford_normal_form_graph` and `extract.extract_clifford_normal_form`.
- Lazy import of some dependencies.

### Changed
- Class `CX`, which refers to an X-controlled X gate, renamed to `XCX` for clarity.
- Parameters for `FSim` changed to put control and target before angles, for consistency with other gates.

### Fixed
- A bunch of mypy issues.
- Variable types now saved in json.
- Grounds being dropped during composition and other operations (#177 courtesy of @ABorgna).
- The `tensorfy` function used the visual ordering of inputs and outputs, instead of the correct ordering (#168).
- Several qasmparser bugs (courtesy of @dlyongemallo).
- Incorrect gate name when optimization combines phases into single gate (#134 courtesy of @bichselb).
- The gflow function returned a gflow when it shouldn't (#114 courtesy of @mafaldaramoa).
- Error in qasmparser when importing a gate with a negative phase (#112).


## [0.7.3] - 2023-02-22
Hotfix for bug `Graph.compose()` function

### Fixed
- `BaseGraph.compose()` now functions as expected.



## [0.7.1] - 2023-02-02
This release improves support and documentation for routing circuits (courtesy of @aborgna-q). In particular it implements the architecture-aware synthesis technique for phase polynomials of [this paper](https://arxiv.org/abs/2004.06052).

The way that the D3 library is loaded is also changed, meaning that the D3 visualization should now work on more systems, in particular on Google Colab. This should also hopefully fix some errors with loading the diagram editor (although this still relies on Jupyter's widget library so that that will only work locally).

### Added
- New routing method for phase polynomial circuits `zx.routing.route_phase_poly` adapted from [this paper](https://arxiv.org/abs/2004.06052) (courtesy of @Aerylia and @aborgna-q).
- Support for more architectures in routing library (@Aerylia and @aborgna-q).
- Support for more gates of PyQuil (@Aerylia and @aborgna-q).
- New phase polynomial circuit generation functions `zx.generate.phase_poly`, `zx.generate.phase_poly_approximate` and `zx.generate.phase_poly_from_gadgets`
- New scripts `cnots` and `phasepoly` that generates random CNOT and phase polynomial circuits (@aborgna-q).
- Basic support for symbolic angles using `sympy` when doing rewriting (courtesy of @y-richie-y).
- Support for Quipper files that do not contain the "nocontrol" keyword.
- Added support for `ry` gates in QASM files (courtesy of @mgrzesiuk).


### Changed
- Requirement of `ipywidgets` has been updated from `ipywidgets>= 7.5` to `ipywidgets>=7.5,<8` as newer version broke the diagram editor.
- Script `mapper` has been renamed to `router`.

### Fixed
- Fixed bug in `Circuit.verify_equality` where it would sometimes say that circuits are equal while they are not (courtesy of Julian Verweij).



## [0.7.0] - 2022-02-19

This release adds several new features: support for evaluating ZX-diagrams as tensor networks using the hypergraph contraction methods of [quimb](https://quimb.readthedocs.io/en/latest/index.html), basic support for interacting with the Rust port of PyZX [quizx](https://github.com/Quantomatic/quizx), support for 'hybrid' ZX-diagrams that contain classical wires and measurements, as well as several heuristics for trying to optimise the CNOT count of a circuit that is to be extracted from a ZX-diagram.

There is one small breaking change, which is that `Graph.inputs` and `Graph.outputs` are now methods  that return a list, instead of being lists themselves.

### Added
- Added support for evaluating ZX-diagrams as tensor networks in [quimb](https://quimb.readthedocs.io/en/latest/index.html) (courtesy of 
Paul Tirlisan).
- Added [quizx](https://github.com/Quantomatic/quizx) backend for the `Graph` class.
- `Graph` vertices can now carry a `ground` generator. This makes it possible to represent measurements and classical control in the diagrams. See the accompanying [paper](https://arxiv.org/abs/2109.06071) (courtesy of ABorgna).
- Added `extract.lookahead_extract` that uses heuristics to extract circuit with less CNOT gates (courtesy of VladMoldoveanu).
- Added `local_search` submodule for doing simulated annealing on rewrites of a ZX-diagram to try to get it to be extracted with less CNOTS (courtesy of Ryan Krueger).
- Added new rewrite rule for ZH-diagrams `hsimplify.par_hbox_intro_simp()` that can remove some H-boxes.
- Added several new rewrite rules to `basicrules` and `mbqc`.
- QASM parser: added support for controlled-Hadamard and controlled-Z phase gates.
- QC parser: added support for SWAP gates (courtesy of wdomitrz).
- Added `Graph.set_inputs()` and `Graph.set_outputs()` to set a list of vertices to be the inputs/outputs of a diagram.
- Added `Graph.num_inputs()` and `Graph.num_outputs()` to get the number of inputs and outputs of a diagram.

### Changed
- `Graph.inputs` is now a method that returns a list of inputs, instead of `Graph.inputs` being a list itself. The same for `Graph.outputs`.

### Fixed
- Several incorrect scalars were fixed in ZH-diagram rewrite rules.

## [0.6.4] - 2021-01-27

The main feature added is support for copying and pasting inside the editor. This release should also hopefully fix the issue where users of the PyPI version can't use zx.draw and the editor.

### Added
- Added functionality to copy and paste parts of a diagram in the editor.
- qasm files can now include u1/u2/u3 gates.
- Method BaseGraph.merge() to merge two graphs in place.
- Method BaseGraph.subgraph_from_vertices() to get the induced subgraph from a set of vertices.

### Changed
- tikz_to_graph() is now a bit more versatile in what it accepts as valid phases.
- matrix_to_latex() is slightly more intelligent about parsing numbers.
- Changed colours in editor to match those of zx.draw.

### Fixed
- Decomposing a Hadamard into Euler angles gave wrong scalar.
- Added d3.v5.min.js to the manifest, which hopefully prevents the issue where people using the PyPI version can't see graphs drawn with d3.


## [0.6.3] - 2020-12-2

### Added
- Added settings.drawing_auto_hbox to toggle the default value of auto_hbox when using zx.draw().
- Added function generate.spider to construct a graph containing a single spider.
- Added function Graph.translate(x,y) to translate all the coordinates in the Graph instance by the specified amount.
- Added additional rewrite rule to editor for H-box fusion.
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
