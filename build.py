#!/usr/bin/python3
import argparse
import multiprocessing
import os
import subprocess
import sys
from pathlib import Path

from tools.common import exit_error


def run(args: list[str], cwd: str | None = None):
    try:
        subprocess.run(args, cwd=cwd, stdout=sys.stdout, stderr=sys.stderr, check=True)
    except subprocess.CalledProcessError as e:
        exit_error(f"Error from called script: {e}")


def create_venv() -> Path:
    cur_script_dir = Path(__file__).parent.resolve()
    venv_dir = cur_script_dir / ".venv"
    if os.name == "nt":
        python_path: Path = venv_dir / "Scripts" / "python.exe"
    else:
        python_path: Path = venv_dir / "bin" / "python"
    if not python_path.exists():
        print("Creating venv")
        run([sys.executable, "-m", "venv", str(venv_dir)])
        if not python_path.exists():
            raise FileNotFoundError(f"Venv creation unsuccessful at: {python_path}")
        print(f"Created venv, using python path {python_path}")
        req_path: Path = cur_script_dir / "requirements.txt"
        if req_path.exists():
            run([str(python_path), "-m", "pip", "install", "--upgrade", "pip", "-q"])
            run([str(python_path), "-m", "pip", "install", "-r", str(req_path), "-q"])
    return python_path


def task_clean():
    run(["make", "clean"])


def task_tidy():
    run(["make", "tidy"])


def task_prep(python_path: Path):
    path: str = str(python_path)
    make_arg: str = f"PYTHON={path}"
    Path("build").mkdir(exist_ok=True)
    run([path, "./build_assets.py","../source/", "../build/", "../assets/"], cwd="./tools/")
    run([path, "./generate_offsets.py", "-o", "../build/offsets.c", "../include/mmbn.h"], cwd="./tools/")
    run([path, "./build_maps.py", "../assets/data/maps/"], cwd="./tools/")
    run(["make", "offsets", make_arg])


def task_all(python_path: Path):
    task_prep(python_path)
    make_arg = f"PYTHON={python_path}"
    procCount = multiprocessing.cpu_count()
    run(["make", f"-j{procCount}", make_arg])


def task_check(python_path: Path):
    task_prep(python_path)
    make_arg = f"PYTHON={python_path}"
    procCount = multiprocessing.cpu_count()
    run(["make", "check", f"-j{procCount}", make_arg])


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
