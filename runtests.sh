#!/bin/bash
python -m unittest discover -s "tests" -t "."
mypy pyzx