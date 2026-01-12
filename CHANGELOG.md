# Changelog

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/).
Right now this project is in Beta and does not yet follow [Semantic Versioning](https://semver.org/spec/v2.0.0.html).
Hence, occasionally changes will be backwards incompatible (although they will all be documented here).

## [0.10.0] - To appear

The big change in this version is that the structure of the rewrite rules has been completely refactored. This shouldn't change anything for most users that just want to use the built-in simplification routines, but it might change how you use single rule calls. In particular, the simplification routines in `simplify`, like `spider_simp` are now no longer functions, but instances of the `Rewrite` class. This exposes a way to match, rewrite and automatically simplify with this rewrite rule. If you call it like a function as before, then it will have the same behaviour as the original simplification routine based on that rewrite rule.

Other changes include much better support for rewriting diagrams that involve symbolic (Clifford) phases; parsing qasm circuits that include measurements (and loading them in symbolic phases); representing CSS codes and Pauli webs; and many bug fixes that improve the reliability of `Multigraph`, transforming graphs to json and calculating the tensor of diagrams.

### Added
- Improved support for circuits and qasm files involving ancilla preparations and measurements. In particular, a measurement outcome can now be represented by a symbolic variable.
- Better support for doing rewrites involving symbolic phases. In particular, symbolic Clifford phases can now be used in graph-theoretic rewrites like local complementation and pivoting. Implemented by @RazinShaikh.
- Can now calculate all Pauliwebs in arbitrary Clifford diagrams (see demos/PauliWebs on Clifford circuits with measurements.ipynb). Implemented by @maximilianruesch.
- New `css.py` file with some utilities for working with CSS codes. In particular, `generate_css_encoder_graph` which generates a normal form diagram from a set of stabilizer generators. Implemented by @tinghui2012.
- Some big improvements to documentation. Functionality regarding routing, using symbolic variables and using a genetic coding heuristic for rewriting are now properly documented. In addition you can check out the `rules.ipynb` notebook in the docs for a full overview of all the rewrites in PyZX.
- New `auto_layout` option in `zx.draw` for graphs that don't have their own position information set. Implemented by @akissinger.
- New graphical Fourier transform function to go between phase gadgets and H-boxes in `fourier.py`. Implemented by @akissinger.

### Changed
- Refactor of the structure of all the rewrites. Rewrites are now built out of a matcher and applier function grouped together in an `Rewrite` instance. The rewrites are all in the submodule `rewrite_rules`, with their `Rewrite` instances still part of `simplify.py` and `hsimplify.py`. The user-facing API is left intact as much as possible, so this should not affect users who have only used the top-level rewrite functions like `full_reduce`. Implemented by @lara-madison.
- `full_reduce` now also calls `copy_simp` and `supplementarity_simp` so that it indeed does all the rewrites that would simplify a graph. It now throws an exception when the diagram contains an H-box so to not get unexpected behaviour. Implemented by @lara-madison.

### Fixed
- Many fixes to using and rewriting Multigraphs (by @RazinShaikh, @boldar99 and @lara-madison).
- Fixed several bugs in the jsonparser for transforming graphs into json and back.
- Fixed several bugs in calculating the tensor of a diagram in several edge-cases, in particular for scalar diagrams.

### Removed
- Some rewrite rules had  slightly different implementations in `rules.py`, `basicrules.py` and `editor_actions.py`. These have now been merged and streamlined into their respective subfiles in the `rewrite_rules` submodule.

## [0.9.0] - 2025-01-30

This new version comes with some new big features and changes.

PyZX now supports a `Multigraph` backend that allows graphs to have multiple edges. Meaning that parallel edges between spiders don't have to be automatically simplified to a single edge. This makes it easier to work with ZH- and ZW-diagrams, and makes it easier to implement other extensions like qudits in the future. As all rewrites have to be reworked to work with multigraphs it is very likely that there are still some semantics breaking things going on. If you use multigraphs be sure to regularly check whether semantics are preserved.

The other big change is that certain features are now deprecated. All Quantomatic features have been removed, since Quantomatic has not seen any major developments in the last 5 years. The file format for saving `Graph`s to json was based on the Quantomatic format and hence was quite complicated. A new simplified future proof format that also supports the new multigraphs is now implemented and replaces the old format. Graphs in the old format can still be loaded in for backwards compatibility. The diagram editor built into PyZX has also been deprecated as [ZXLive](https://github.com/zxcalc/zxlive) can now do pretty much everything better. It is still usable, but requires an older version of `ipywidgets` which was causing issues with compatibility with other libraries.

There are also some new experimental functions and features: calculating an extended gflow and Pauli flow for ZX-diagrams, calculating and visualising a Pauli web, and drawing diagrams in three dimensions.

### Added
- Multigraph graph backend that allows parallel edges between nodes. Many simplification routines work with the Multigraph backend, but some might still have some unexpected behaviour. Tread carefully. Many of the features and upgrades were implemented by @akissinger and @RazinShaikh.
- Can now compute focussed gflows, and extended gflows that can deal with Pauli vertices (see functions in `gflow.py`). Courtesy of @akissinger.
- Compute and draw Pauli webs for ZX-diagrams with Pauli flow. See `demos/PauliWebs.ipynb` and `pauliweb.py`. Courtesy of @akissinger.
- D3 drawing now supports drawing in 3D. Use function `drawing.draw_3d` for this. Courtesy of @akissinger.
- Some new useful rewrites for H-boxes in `hsimplify`: A `replace_hadamard` that replaces an H-box with a H-edge, and `had_edge_to_hbox` that does the opposite. Courtesy of @jvdwetering.
- A new function `cut_vertex` in `simulate` to decompose a single graph into two graphs with the vertex cut away. [link](https://github.com/zxcalc/pyzx/pull/216). Courtesy of @mjsutcliffe99.
- `generate.qft` for generating a quantum Fourier transform circuit. Courtesy of @akissinger.
- QASM parser now understands multi-character register names. [link](https://github.com/zxcalc/pyzx/pull/279). Courtesy of @contra-bit.
- `Circuit.verify_equality` function now takes optional parameter `up_to_global_phase`. Courtesy of @akissinger.


### Changed
- PyZX now uses a new simplified future-proof format for storing `Graph` instances, that also supports the new Multigraph backend. The old format based on the Quantomatic format still works, but is no longer the default.
- All functionality related to Quantomatic has been removed.
- The built-in editor for diagrams is now deprecated, and the version requirements for `ipywidgets` necessary for it to work have been removed.

### Fixed
- Bug in `to_graph_like` [link](https://github.com/zxcalc/pyzx/issues/195).
- Some more reasonable checks and error messages when calling `full_reduce` wrongly [link](https://github.com/zxcalc/pyzx/pull/212). Courtesy of @dlyongemallo.
- Scalar now correctly updates when creating `.adjoint()` of a Graph [link](https://github.com/zxcalc/pyzx/pull/230). Courtesy of @rafaelha.
- Several fixes for the ``Poly`` class for better support of symbolic angles. Courtesy of @lia-approves and @RazinShaikh.
- Can now generate single-qubit Clifford+T circuits using `generate.cliffordTmeas` [link](https://github.com/zxcalc/pyzx/pull/263). Courtesy of @amirebrahimi.
- Fixed bug in `simplify.to_clifford_normal_form_graph` [link](https://github.com/zxcalc/pyzx/pull/269). Courtesy of @rafaelha.
- Bug in the cat decomposition in `simulate.py`. [link](https://github.com/zxcalc/pyzx/pull/271). Courtesy of @alexkoziell.

## [0.8.0] - 2024-02-14

This release includes breaking changes!

Major new features are support for W-spiders and Z-boxes, which are generators used in certain extensions of the ZX-calculus, such as in [this paper](https://arxiv.org/abs/2302.12135) which served as the motivation.
It also adds more formal support for symbolic phases through the addition of a `Poly` class that can represented polynomial expressions containing Boolean and continuous variables.

These features were implemented to support the development of [ZXLive](https://github.com/zxcalc/zxlive), a new graphical proof assistant for ZX-diagrams.

This release includes some changes that are not backwards compatible. The most important of which is changing how inputs and outputs are stored in the json format. This means that json files produced by `Graph.to_json()` are not parsible by older versions, and older versions are no longer parsible by this newer version.
In addition, the gate `CX` has been renamed to `XCX` to make it more clear that it is in fact not an alternative name for the `CNOT` gate. Finally, the `FSim` gate now takes as first arguments the control and target, and only then the angles, in order to be consistent with the other gate definitions.

### Added
- Support for W nodes and Z boxes (courtesy of @RazinShaikh).
- Support for symbolic phases that can either be Boolean or continuous variables. This is implemented through the new `Poly` class (standing for Polynomial) (courtesy of @RazinShaikh).
- Support for Jupyter notebooks in documentation using nbsphinx (courtesy of @dlyongemallo).
- Jupyter notebook documenting all supported gates (courtesy of @dlyongemallo).
- Support for OpenQASM 3.0 (courtesy of @dlyongemallo).
- A function `is_well_formed` to check that a graph is a well-formed ZX-diagram (courtesy of @RazinShaikh).
- A function `is_pauli` to check whether a phase is Pauli (courtesy of @y-richie-y).
- A function `GraphDiff` that calculates what actions are needed to bring one graph to another (used in ZXLive).
- Functions `simplify.to_clifford_normal_form_graph` and `extract.extract_clifford_normal_form`.
- Lazy import of some dependencies to improve start-up time.

### Changed
- Class `CX`, which refers to an X-controlled X gate, renamed to `XCX` for clarity.
- Parameters for `FSim` changed to put control and target before angles, for consistency with other gates.
- json format correctly remembers input/output ordering (older json no longer parsible).

### Fixed
- A bunch of mypy issues.
- json export and import supports Poly phases.
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

This release adds several new features: support for evaluating ZX-diagrams as tensor networks using the hypergraph contraction methods of [quimb](https://quimb.readthedocs.io/en/latest/index.html), basic support for interacting with the Rust port of PyZX [quizx](https://github.com/zxcalc/quizx), support for 'hybrid' ZX-diagrams that contain classical wires and measurements, as well as several heuristics for trying to optimise the CNOT count of a circuit that is to be extracted from a ZX-diagram.

There is one small breaking change, which is that `Graph.inputs` and `Graph.outputs` are now methods  that return a list, instead of being lists themselves.

### Added
- Added support for evaluating ZX-diagrams as tensor networks in [quimb](https://quimb.readthedocs.io/en/latest/index.html) (courtesy of
Paul Tirlisan).
- Added [quizx](https://github.com/zxcalc/quizx) backend for the `Graph` class.
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
