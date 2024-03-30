#!/usr/bin/python3
import argparse
from pathlib import Path
import subprocess
import sys
import multiprocessing

def main():
    parser = argparse.ArgumentParser(description="Handles build tasks.")
    parser.add_argument("task", nargs='?', type=str, help="The task to perform.")
    args = parser.parse_args()
    if args.task == "clean":
        subprocess.run(["make", "clean"], stdout=sys.stdout, stderr=sys.stderr)
    elif args.task == "tidy":
        subprocess.run(["make", "tidy"], stdout=sys.stdout, stderr=sys.stderr)
    else:
        procCount = multiprocessing.cpu_count()
        Path("build").mkdir(exist_ok=True)
        subprocess.run([sys.executable, "./build_assets.py","../source/", "../build/", "../assets/"], cwd="./tools/", stdout=sys.stdout, stderr=sys.stderr)
        subprocess.run([sys.executable, "./generate_offsets.py", "-o", "../build/offsets.c", "../include/mmbn.h"], cwd="./tools/", stdout=sys.stdout, stderr=sys.stderr)
        subprocess.run([sys.executable, "./build_maps.py", "../assets/data/maps/"], cwd="./tools/", stdout=sys.stdout, stderr=sys.stderr)
        subprocess.run(["make", "offsets"], stdout=sys.stdout, stderr=sys.stderr)
        subprocess.run(["make", f"-j{procCount}"], stdout=sys.stdout, stderr=sys.stderr)


if __name__=="__main__":
    main()
