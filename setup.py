#!/usr/bin/python

import pathlib
from setuptools import setup

HERE = pathlib.Path(__file__).parent
README = (HERE / "readme.md").read_text()

setup(
    name="pyzx",
    author="Quantomatic",
    author_email="john@vdwetering.name",
    version="0.5.0",
    url="https://github.com/Quantomatic/pyzx.git",
    description="Library for quantum circuit rewriting and optimisation using the ZX-calculus",
    long_description=README,
    long_description_content_type="text/markdown",
    license="GNUv3",
    classifiers=[
        "License :: OSI Approved :: GNU Affero General Public License v3",
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
    install_requires=["numpy>=1.12"],
    include_package_data=True,
)
