#!/usr/bin/python

from setuptools import setup

setup(
    name="pyzx",
    author="Quantomatic",
    url="https://github.com/Quantomatic/pyzx.git",
    description="Python library for quantum circuit rewriting and optimisation using the ZX-calculus",
    packages=[
        "pyzx",
        "pyzx.circuit",
        "pyzx.graph",
        "pyzx.routing",
        "pyzx.scripts"
    ],
    install_requires=[
        "numpy >= 1.14",
        "matplotlib >= 2.2",
    ],
)
