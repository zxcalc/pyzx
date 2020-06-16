# Changelog

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/).
Right now this project is in Beta and does not yet follow [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

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