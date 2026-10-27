from fractions import Fraction
from random import randint, choice
import numpy as np


from pyzx.circuit import Circuit
from pyzx.graph import Graph
from pyzx.utils import EdgeType, VertexType
from pyzx.simulation import (
    Decomp,
    apply_decomp,
    check_valid,
)


def test_multi_cat3_1() -> None:
    """
    Verify multi_cat3_1 decomposition, by testing 5 random valid structures.
    Technically this is a family of infinite decompositions, only the first 10 are tested.
    Also verifies that validation checkers reject invalid parameters on last case.
    """
    for n in range(1, 11):
        for _ in range(5):
            g = Graph()
            outputs = []
            v = g.add_vertex(VertexType.Z, 0, 0, Fraction(2*randint(0, 4) + 1, 4))
            for i in range(randint(1, 2)):
                under_v = g.add_vertex(VertexType.BOUNDARY, 1, i)
                g.add_edge((v, under_v), choice([EdgeType.SIMPLE, EdgeType.HADAMARD]))
                outputs.append(under_v)
            for i in range(n):
                z = g.add_vertex(VertexType.Z, -1, i + 1, randint(0, 1))
                x = g.add_vertex(VertexType.Z, -2, i + 1, Fraction(2*randint(0, 4) + 1, 4))
                y = g.add_vertex(VertexType.Z, 0, i + 1, Fraction(2*randint(0, 4) + 1, 4))
                g.add_edges([(v, z), (z, x), (z, y)], EdgeType.HADAMARD)
                for j in range(randint(1, 2)):
                    under_y = g.add_vertex(VertexType.BOUNDARY, 1 + j, i + 1)
                    g.add_edge((y, under_y), choice([EdgeType.SIMPLE, EdgeType.HADAMARD]))
                    outputs.append(under_y)
            g.set_outputs(tuple(outputs))

            assert check_valid(Decomp.MULTI_CAT3_1, g, v)
            gsum = apply_decomp(Decomp.MULTI_CAT3_1, g, v)
            assert len(gsum.graphs) == 2
            assert np.allclose(g.to_tensor(), gsum.to_tensor())

    # Should crash when given wrong amount of vertices as input
    try:
        check_valid(Decomp.MULTI_CAT3_1, g, v, x)
    except TypeError:
        pass
    else:
        raise AssertionError

    g.set_phase(v, 0)
    # Should crash if any input vertex is not T-like
    try:
        check_valid(Decomp.MULTI_CAT3_1, g, v)
    except ValueError:
        pass
    else:
        raise AssertionError

    g.set_phase(v, Fraction(1, 4))
    g.set_type(v, VertexType.X)
    # Should crash if any input vertex is not green
    try:
        check_valid(Decomp.MULTI_CAT3_1, g, v)
    except ValueError:
        pass
    else:
        raise AssertionError

    # Should crash if it does not have the correct structure
    try:
        check_valid(Decomp.MULTI_CAT3_1, g, x)
    except ValueError:
        pass
    else:
        raise AssertionError


def test_multi_cat3_2() -> None:
    """
    Verify multi_cat3_2 decomposition.
    Technically this is a family of infinite decompositions, only the first 10 are tested.
    Also verifies that validation checkers reject invalid parameters on last case.
    """
    for n in range(1, 11):
        for _ in range(5):
            g = Graph()
            outputs = []
            z1 = g.add_vertex(VertexType.Z, 0, 0, Fraction(2*randint(0, 4) + 1, 4))
            z2 = g.add_vertex(VertexType.Z, 0, 8, Fraction(2*randint(0, 4) + 1, 4))
            for i in range(randint(1, 2)):
                b1 = g.add_vertex(VertexType.BOUNDARY, 1, i)
                g.add_edge((z1, b1), choice([EdgeType.SIMPLE, EdgeType.HADAMARD]))
                outputs.append(b1)
            for i in range(randint(1, 2)):
                b2 = g.add_vertex(VertexType.BOUNDARY, 1, 8 - i)
                g.add_edge((z2, b2), choice([EdgeType.SIMPLE, EdgeType.HADAMARD]))
                outputs.append(b2)
            for i in range(n):
                v = g.add_vertex(VertexType.Z, -2, 2*i, randint(0, 1))
                y = g.add_vertex(VertexType.Z, -2, 2*i + 1, Fraction(2*randint(0, 4) + 1, 4))
                x = g.add_vertex(VertexType.Z, -4, 2*i, Fraction(2*randint(0, 4) + 1, 4))
                g.add_edges([(z1, v), (z2, v), (v, y), (v, x)], EdgeType.HADAMARD)
                for j in range(randint(1, 2)):
                    above_x = g.add_vertex(VertexType.BOUNDARY, -6 - j, 2*i)
                    g.add_edge((x, above_x), choice([EdgeType.SIMPLE, EdgeType.HADAMARD]))
                    outputs.append(above_x)
            g.set_outputs(tuple(outputs))

            assert check_valid(Decomp.MULTI_CAT3_2, g, z1, z2)
            gsum = apply_decomp(Decomp.MULTI_CAT3_2, g, z1, z2)
            assert len(gsum.graphs) == 2
            assert np.allclose(g.to_tensor(), gsum.to_tensor())

    # Should crash when given wrong amount of vertices as input
    try:
        check_valid(Decomp.MULTI_CAT3_2, g, z1)
    except TypeError:
        pass
    else:
        raise AssertionError

    g.set_phase(z1, 0)
    # Should crash if any input vertex is not T-like
    try:
        check_valid(Decomp.MULTI_CAT3_2, g, z1, z2)
    except ValueError:
        pass
    else:
        raise AssertionError

    g.set_phase(z1, Fraction(1, 4))
    g.set_type(z1, VertexType.X)
    # Should crash if any input vertex is not green
    try:
        check_valid(Decomp.MULTI_CAT3_2, g, z1, z2)
    except ValueError:
        pass
    else:
        raise AssertionError

    # Should crash if it does not have the correct structure
    try:
        check_valid(Decomp.MULTI_CAT3_2, g, z1, x)
    except ValueError:
        pass
    else:
        raise AssertionError


test_multi_cat3_1()
test_multi_cat3_2()
