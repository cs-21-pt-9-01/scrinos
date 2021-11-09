import os
import sys
import re
import subprocess

base_dir = sys.argv[1]
dirs = os.listdir(base_dir)
MAX_FILES = 500 

for d in dirs:
    path = f'{base_dir}{d}'
    if not os.path.isdir(path):
        continue

    files = [f'{path}/{x}' for x in os.listdir(path) if re.match(r'.*csv', x)]
    n_zips = len(files) // MAX_FILES

    for i in range(n_zips):
        first = i * MAX_FILES
        last = (i + 1) * MAX_FILES

        _slice = files[first:] if i == n_zips - 1 else files[first:last]

        fn = '-'.join(path.split('/'))
        subprocess.run(['7z', 'a', f'{path}/{fn}-{i}.zip', *_slice])
