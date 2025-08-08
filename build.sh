#!/bin/bash

python -m nuitka --onefile --standalone --remove-output --output-filename=backdoor backdoor.py
mkdir -p dist
mv backdoor dist/payload
