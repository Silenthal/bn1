#!/usr/bin/python3
import argparse
from pathlib import Path
import subprocess
import sys
import multiprocessing
import os


def create_venv() -> str:
    venv_dir = os.path.join(os.getcwd(), ".venv")
    python_prog = os.path.join(venv_dir, "bin", "python")
    if sys.platform == "win32":
        python_prog = os.path.join(venv_dir, "Scripts", "python.exe")
    if not os.path.exists(python_prog):
        print("Creating venv")
        subprocess.run([sys.executable, "-m", "venv", venv_dir], stdout=sys.stdout, stderr=sys.stderr, check=True)
        if not os.path.exists(python_prog):
            raise FileNotFoundError(f"Venv creation unsuccessful at: {python_prog}")
        print(f"Created venv, using python path {python_prog}")
        subprocess.run([python_prog, "-m", "pip", "install", "-r", "requirements.txt", "-q"], stdout=sys.stdout, stderr=sys.stderr, check=True)
    return python_prog


def task_clean():
    subprocess.run(["make", "clean"], stdout=sys.stdout, stderr=sys.stderr, check=True)


def task_tidy():
    subprocess.run(["make", "tidy"], stdout=sys.stdout, stderr=sys.stderr, check=True)


def task_prep(python_path: str):
    make_arg = f"PYTHON={python_path}"
    Path("build").mkdir(exist_ok=True)
    subprocess.run([python_path, "./build_assets.py","../source/", "../build/", "../assets/"], cwd="./tools/", stdout=sys.stdout, stderr=sys.stderr, check=True)
    subprocess.run([python_path, "./generate_offsets.py", "-o", "../build/offsets.c", "../include/mmbn.h"], cwd="./tools/", stdout=sys.stdout, stderr=sys.stderr, check=True)
    subprocess.run([python_path, "./build_maps.py", "../assets/data/maps/"], cwd="./tools/", stdout=sys.stdout, stderr=sys.stderr, check=True)
    subprocess.run(["make", "offsets", make_arg], stdout=sys.stdout, stderr=sys.stderr, check=True)


def task_all(python_path: str):
    task_prep(python_path)
    make_arg = f"PYTHON={python_path}"
    procCount = multiprocessing.cpu_count()
    subprocess.run(["make", f"-j{procCount}", make_arg], stdout=sys.stdout, stderr=sys.stderr, check=True)


def task_check(python_path: str):
    task_prep(python_path)
    make_arg = f"PYTHON={python_path}"
    procCount = multiprocessing.cpu_count()
    subprocess.run(["make", "check", f"-j{procCount}", make_arg], stdout=sys.stdout, stderr=sys.stderr, check=True)


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
        python_path = create_venv()
        task_all(python_path)
    elif args.task == "check":
        python_path = create_venv()
        task_check(python_path)
    else:
        python_path = create_venv()
        task_all(python_path)


if __name__=="__main__":
    main()
