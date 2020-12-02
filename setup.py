#!/usr/bin/python

import pathlib
from setuptools import setup

HERE = pathlib.Path(__file__).parent
README = (HERE / "readme.md").read_text()

setup(
    name="pyzx",
    author="Quantomatic",
    author_email="john@vdwetering.name",
    version="0.6.3",
    url="https://github.com/Quantomatic/pyzx.git",
    description="Library for quantum circuit rewriting and optimisation using the ZX-calculus",
    long_description=README,
    long_description_content_type="text/markdown",
    license="Apache2",
    classifiers=[
        "License :: OSI Approved :: Apache Software License",
        "Programming Language :: Python :: 3",
        "Programming Language :: Python :: 3.6",
        "Topic :: Software Development :: Libraries :: Python Modules",
        "Development Status :: 4 - Beta",
    ],
    packages=[
        "pyzx",
        "pyzx.circuit",
        "pyzx.graph",
        "pyzx.routing",
        "pyzx.scripts"
    ],
    python_requires='>=3.6',
    install_requires=["typing_extensions>=3.7.4",
                      "numpy>=1.12"],
    include_package_data=True,
)
