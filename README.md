# Mega Man Battle Network

This is a disassembly of Mega Man Battle Network.

It uses the following ROM as a base:

* Mega Man Battle Network (USA).gba  `md5: 9FF40CF640575211202B7BDA5487ABBB`

Python 3 and devkitPro are required. For the Python tools, the pip packages `pypng` and `pycparser` are required.

To make, create a directory called `base`, place the ROM in the directory, and name it `base.gba`.

Then, run `make depend` and then `make`. Use `-j{insert processor/thread count here}` on either of those commands to parallelize and speed up building.

To clean up all build files, run `make clean`. Use `make tidy` to only remove built source files and leave built asset files alone.
