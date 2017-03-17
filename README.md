# NarraTeX

NarraTeX is a system for writing and compiling LARPS, based on Ken
Clary's GameTeX.  It exists because of a few personal itches that I
wanted to scratch, and because various friends wanted me to share my
patches with them.  GameTeX remains (c) Ken Clary and the MIT
Assassins' Guild; see the copyright notice in `GameTeX-README`.

## Usage

The process of writing games in NarraTeX is mostly the same as in
GameTeX; for details on using GameTeX, see `GameTeX-README` and the
`README` files in the various subdirectories.  This README will focus
on what has been changed from GameTeX.

### Compiling

NarraTeX includes a `Makefile` which removes the need to set
environment variables as described in `GameTeX-README`.  To compile
all of the files in the `Production/` subdirectory, producing
collections of character sheets, bluesheets, greensheets, etc. ready
for printing and sorting, simply go to your top-level `NarraTeX`
directory and run

    make

To compile a specific file, e.g. `Charsheets/johnsmith.tex`, run

    make Charsheets/johnsmith.pdf

Note that the argument to `make` should be a `.pdf` file, not a `.tex`
file.

## License

NarraTeX is (c) Sam Dukhovni, Ken Clary, and the MIT Assassins' Guild.
You may use, copy, and/or modify this software for any purpose with or
without fee, provided that the above copyright notice and this
permission notice appear in all copies.