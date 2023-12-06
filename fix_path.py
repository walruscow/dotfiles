#!/usr/bin/env python3
import sys
import os

paths = sys.argv[1]

seen = set()
fixed_path = []
for p in paths.split(':'):
    if p in seen:
        continue
    seen.add(p)
    if os.path.exists(p):
        fixed_path.append(p)

print(':'.join(fixed_path))
