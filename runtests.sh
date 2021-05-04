#!/bin/bash
python3 -m unittest discover -s "tests" -t "."
mypy pyzx
