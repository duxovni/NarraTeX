# NarraTeX

NarraTeX is a system for writing and compiling LARPS, based on Ken
Clary's GameTeX.  It exists because of a few personal itches that I
wanted to scratch, and because various friends wanted me to share my
patches with them.  GameTeX remains (c) Ken Clary and the MIT
Assassins' Guild; see the copyright notice in `GameTeX-README`.

## Usage

The process of writing games in NarraTeX is mostly the same as in
GameTeX; for details on using GameTeX, see `GameTeX-README` and the
`README` files in the various subdirectories.  This README will
provide a quick overview of the process, including all the things that
have been changed from GameTeX.

### Getting Started

First, get a copy of this repository, and go inside it:

    git clone https://github.com/duxovni/NarraTeX
    cd NarraTeX

The first thing you'll want to do is choose a classname for your
game. This should be a short string of letters and numbers; it won't
be visible to players, it's just part of the internals of
NarraTeX. For example, if you're writing a game called "Revenge of the
Robot Ninjas!", a good classname might be `robotninjas`.  Now, run
this command to set the classname:

     Extras/changeclass.pl . game robotninjas

### Writing a Game

To create characters, organizations, mechanics, abilities, items,
etc., edit the various files in the `Lists/` subdirectory, and create
files for new sheets in the `Charsheets/`, `Bluesheets/`,
`Greensheets/`, etc. subdirectories.  This is exactly the same as in
GameTeX; we've tweaked some of the defaults related to character
gender, but the format of the files is identical.

### Compiling

NarraTeX includes a `Makefile` which removes the need to set
environment variables as described in `GameTeX-README`.  To compile
all of the files in the `Production/` subdirectory, producing PDF
collections of character sheets, bluesheets, greensheets, etc. ready
for printing and sorting, simply go to your top-level `NarraTeX`
directory and run

    make

To create separate PDFs, each containing all the sheets belonging to a
single character (useful if you want to send players their sheets over
email), run

    make packets

The PDFs will appear in the `Production/` directory, with names like
`cNinjaCaptain-all.pdf`.  If you just want character sheets without
bluesheets or greensheets attached, run

    make charsheets

and look for files like `cNinjaCaptain-listchar.pdf` in `Production/`.

To compile a single specific file, e.g. `Charsheets/johnsmith.tex`,
run

    make Charsheets/johnsmith.pdf

Note that the argument to `make` should be a `.pdf` file, not a `.tex`
file.

## License

NarraTeX is (c) Faye Duxovni, Ken Clary, and the MIT Assassins' Guild.
You may use, copy, and/or modify this software for any purpose with or
without fee, provided that the above copyright notice and this
permission notice appear in all copies.
