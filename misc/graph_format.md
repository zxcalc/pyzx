# PyZX graph format

**What:** a simple text-based input language for ZX diagrams. It has some similar characteristics to the `dot` file format used by GraphViz.

**Why:** allow inputting ZX-diagrams to be (nearly) as easy as using `zx.qasm` for circuit-like ZX-diagrams.

## Format

The graph format consists of a sequence vertex expressions, edge expressions, or row separators `===`. Here's an example:

```
x0 : b 0
x1 : b 2
===
x0 -> a0 : z 0
x1 -> a1 : z 2
===
a0 -> b0 : x 1
a1 -> b0
===
b0 -> c0 : z 1
===
c0 -> d0 : x 0
c0 -> d1 : x 2
===
d0 -> y0 : b 0
d1 -> y1 : b 2
```

Every vertex needs a coordinate, which in PyZX consists of a row and qubit index. The `row` is kept implicitly as a global variable, where initially `row := 1`. When a `===` is encountered, the value of `row` is set to the next integer value `row := floor(row + 1)`. Optionally, an amount to increment the row can be provided, which is allowed to be a non-integer, in which case `=== r` sets `row := row + r`.

Vertices are declared by giving them a name, followed by a colon then a type, qubit index, and optional phase, given as a rational multiple of pi. For example: `a : z 1 1/2` places a `Z` vertex on the current row, at qubit 1, with phase pi/2.

An edge expression consists of a pair of vertex names, separated by `->`, for normal edges or `h>` for a Hadamard edges. Vertices can be declared directly in an edge expression. For example `a -> b : z 0` is shorthand for:

```
b : z 0
a -> b
```

The source, target, or both can be given as a vertex declaration in this way. Also, more than two vertices can be chained together in a single vertex expression to create a chain of edges, so `a -> b -> c` is shorthand for:

```
a -> b
b -> c
```

Once all vertices in an edge expression are declared, it doesn't matter when the expression appears, since the edge itself doesn't care about the value of `row`. For example, all edges could be placed at end of the file.

Boundary vertices appearing on the first row are assumed to be inputs, and boundaries on last row are assumed to be outputs.

## Grammar

Here's the full grammar, where `id` means a string of identifier characters, i.e. alphanumeric, plus dash and underscore. Note ?, *, and + have their usual regex meaning.

``` 
GRAPH  ::= EXPR (('\n' | ';') EXPR)*
EXPR   ::= VERT | EDGE | ROWSEP
VERT   ::= id | id : TYPE QUBIT PHASE?
EDGE   ::= (VERT | id) (ETYPE (VERT | id))+
ROWSEP ::= '===' ROW?

QUBIT  ::= float
ROW    ::= float
PHASE  ::= fraction
TYPE   ::= 'b' | 'z' | 'x' | 'h'
ETYPE  ::= '->' | 'h>'
```

## Examples

A chain of 3 alternating CNOTs:

```
x0 : b 0
x1 : b 1
===
a0 : z 0 -> a1 : x 1
===
b0 : x 0 -> b1 : z 1
===
c0 : z 0 -> c1 : x 1
===
y0 : b 0
y1 : b 1

x0 -> a0 -> b0 -> c0 -> y0
x1 -> a1 -> b1 -> c1 -> y1

```

A complete bipartite graph, with phases and Hadamard edges:

```
a0 : z 0  1/4
a1 : z 1  5/4
a2 : z 2  1/2
===
b0 : z 0  1/2
b1 : z 1  1/4
b2 : z 2 -1/4

a0 h> b0 ; a1 h> b0 ; a2 h> b0
a0 h> b1 ; a1 h> b1 ; a2 h> b1
a0 h> b2 ; a1 h> b2 ; a2 h> b2
```

A phase gadget, between 2 rows:

```
i0 : b 0
i1 : b 1
i2 : b 2
===
i0 -> a0 : z 0
i1 -> a1 : z 1
i2 -> a2 : z 2
=== 0.5
g0 : x -1 -> g1 : z -2 1/4
a0 -> g0 ; a1 -> g0 ; a2 -> g0
===
a0 -> o0 : b0
a1 -> o1 : b1
a2 -> o2 : b2
```
