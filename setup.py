#!/usr/bin/python

import pathlib
from setuptools import setup

HERE = pathlib.Path(__file__).parent
README = (HERE / "readme.md").read_text()

setup(
    name="pyzx",
    author="Quantomatic",
    author_email="john@vdwetering.name",
    version="0.7.3",
    url="https://github.com/Quantomatic/pyzx.git",
    description="Library for quantum circuit rewriting and optimisation using the ZX-calculus",
    long_description=README,
    long_description_content_type="text/markdown",
    license="Apache2",
    classifiers=[
        "License :: OSI Approved :: Apache Software License",
        "Programming Language :: Python :: 3",
        "Programming Language :: Python :: 3.7",
        "Programming Language :: Python :: 3.8",
        "Programming Language :: Python :: 3.9",
        "Programming Language :: Python :: 3.10",
        "Topic :: Software Development :: Libraries :: Python Modules",
        "Development Status :: 4 - Beta",
    ],
    packages=[
        "pyzx",
        "pyzx.circuit",
        "pyzx.graph",
        "pyzx.routing",
        "pyzx.local_search",
        "pyzx.scripts",
    ],
    python_requires='>=3.7',
    install_requires=["typing_extensions>=3.7.4",
                      "numpy>=1.14",
                      "pyperclip>=1.8.1",
                      "tqdm>=4.56.0",
                      "ipywidgets>=7.5,<8"],
    include_package_data=True,
)
