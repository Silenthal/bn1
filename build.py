#!/usr/bin/python3
import argparse
from pathlib import Path
import subprocess
import sys
import multiprocessing


def task_clean():
    subprocess.run(["make", "clean"], stdout=sys.stdout, stderr=sys.stderr, check=True)


def task_tidy():
    subprocess.run(["make", "tidy"], stdout=sys.stdout, stderr=sys.stderr, check=True)


def task_prep():
    Path("build").mkdir(exist_ok=True)
    subprocess.run([sys.executable, "./build_assets.py","../source/", "../build/", "../assets/"], cwd="./tools/", stdout=sys.stdout, stderr=sys.stderr, check=True)
    subprocess.run([sys.executable, "./generate_offsets.py", "-o", "../build/offsets.c", "../include/mmbn.h"], cwd="./tools/", stdout=sys.stdout, stderr=sys.stderr, check=True)
    subprocess.run([sys.executable, "./build_maps.py", "../assets/data/maps/"], cwd="./tools/", stdout=sys.stdout, stderr=sys.stderr, check=True)
    subprocess.run(["make", "offsets"], stdout=sys.stdout, stderr=sys.stderr, check=True)


def task_all():
    task_prep()
    procCount = multiprocessing.cpu_count()
    subprocess.run(["make", f"-j{procCount}"], stdout=sys.stdout, stderr=sys.stderr, check=True)


def task_check():
    task_prep()
    procCount = multiprocessing.cpu_count()
    subprocess.run(["make", "check", f"-j{procCount}"], stdout=sys.stdout, stderr=sys.stderr, check=True)


def main():
    parser = argparse.ArgumentParser(description="Handles build tasks.")
    parser.add_argument("task", nargs='?', type=str, help="The task to perform.")
    args = parser.parse_args()
    if args.task == "clean":
        task_clean()
    elif args.task == "tidy":
        task_tidy()
    elif args.task == "rebuild":
        task_tidy()
        task_all()
    elif args.task == "check":
        task_check()
    else:
        task_all()


if __name__=="__main__":
    main()
