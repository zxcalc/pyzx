#!/usr/bin/python
# type: ignore
import pathlib
from setuptools import setup

HERE = pathlib.Path(__file__).parent
README = (HERE / "readme.md").read_text()

setup(
    name="pyzx",
    author="Quantomatic",
    author_email="john@vdwetering.name",
    version="0.9.0",
    url="https://github.com/zxcalc/pyzx.git",
    description="Library for quantum circuit rewriting and optimisation using the ZX-calculus",
    long_description=README,
    long_description_content_type="text/markdown",
    license="Apache2",
    classifiers=[
        "License :: OSI Approved :: Apache Software License",
        "Programming Language :: Python :: 3",
        "Programming Language :: Python :: 3.9",
        "Programming Language :: Python :: 3.10",
        "Programming Language :: Python :: 3.11",
        "Programming Language :: Python :: 3.12",
        "Topic :: Software Development :: Libraries :: Python Modules",
        "Development Status :: 4 - Beta",
    ],
    packages=[
        "pyzx",
        "pyzx.circuit",
        "pyzx.graph",
        "pyzx.rewrite_rules",
        "pyzx.routing",
        "pyzx.local_search",
        "pyzx.scripts",
    ],
    python_requires='>=3.9',
    install_requires=["typing_extensions>=4.5.0",
                      "numpy>=1.14",
                      "pyperclip>=1.8.1",
                      "tqdm>=4.56.0",
                      "ipywidgets>=7.5",
                      "lark>=1.2.2"],
    include_package_data=True,
)
