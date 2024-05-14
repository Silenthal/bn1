# Mega Man Battle Network

This is a disassembly of Mega Man Battle Network.

It uses the following ROM as a base:

* Mega Man Battle Network (USA).gba  `md5: 9FF40CF640575211202B7BDA5487ABBB`

## Building

### Manual

Python 3, devkitPro, and make are required. For the Python tools, the pip packages `pypng` and `pycparser` are required and can be installed with `python3 -m pip install -r requirements.txt`.

To build, create a directory called `base`, place the ROM in the directory, and name it `base.gba`.

Then, run `build.py`. The output GBA file will be in the `build` directory.

To clean up all build files, run `build.py clean`. Run `build.py tidy` to only remove built source files and leave built asset files alone. Run `build.py rebuild` to do tidying and building in one step.

### Docker

Docker and make are required.

To build, create a directory called `base`, place the ROM in the directory, and name it `base.gba`.

Then, run `docker compose up --build`. The output GBA file will be in the `build` directory.

To run the rebuild command (tidy, then build), run `docker compose -f rebuild.yaml up --build`.

To clean up all build files, run `make clean`. Run `make tidy` to only remove built source files and leave built asset files alone. To remove the created container, use `docker compose down`. The created image is currently called `bn1-build` and can be removed afterwards with `docker rmi bn1-build`. Any remaining images from prior builds can be cleaned up with `docker image prune`.
