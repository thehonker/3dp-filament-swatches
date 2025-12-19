#!/usr/bin/env python3

import subprocess
import yaml
import os
import platform

if platform.system() == 'Windows':
    OPENSCAD = 'C:\\Program Files\\OpenSCAD\\openscad.exe'
elif platform.system() == 'Linux':
    OPENSCAD = 'openscad'
else:
    OPENSCAD = '/Applications/OpenSCAD.app/Contents/MacOS/OpenSCAD'

SCRIPT_DIR = os.path.dirname(os.path.realpath(__file__))

def gen_samples(directory=f"{SCRIPT_DIR}/../src"):
    os.makedirs(f"{SCRIPT_DIR}/../stl", exist_ok=True)
    for filename in os.listdir(directory):
        if filename.endswith('.yaml'):
            file_path = os.path.join(directory, filename)
            print(f"Processing file: {file_path}")
            with open(file_path, 'r') as f:
                data = yaml.safe_load(f)
                for l in data['samples']:
                    print("Processing sample:", l)
                    brand_stl_dir = os.path.join(SCRIPT_DIR, '../stl', l["brand"])
                    os.makedirs(brand_stl_dir, exist_ok=True)
                    stl_filename = os.path.join(brand_stl_dir, "_".join(l.values()) + ".stl")
                    subprocess.run(
                        [OPENSCAD,
                        '-o', stl_filename,
                        '-D', f'Filament_Brand="{l["brand"]}"',
                        '-D', f'Filament_Type_Override="{l["type"]}"',
                        '-D', f'Filament_Color="{l["color"]}"',
                        '-D', f'Filament_Modifier="{l["modifier"]}"',
                        f'{SCRIPT_DIR}/swatch.scad',
                        ], check=True)

if __name__ == "__main__":
    gen_samples()
