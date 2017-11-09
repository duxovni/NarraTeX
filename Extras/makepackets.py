#!/usr/bin/env python2
"""A simple script to create individual PDFs of each character's
sheets.  This can be used to create PDFs of just character sheets, or
of all sheets associated with a character.  PDFs will be created in
whatever directory the script is run from.  For this script to work,
environment variables must be set properly, and
Production/json-PRINT.json must be up-to-date.  We recommend you use
the Makefile rather than running this script directly.
"""

import json
import os.path
import subprocess
import sys

gameclass = "game"

sheet_types = ["listchar", "badges", "abils", "carditems", "listblue", "listgreen"]

def make_sheet(char, sheet):
    jobname = "%s-%s" % (char, sheet)
    commands = "\documentclass[%s]{%s}\begin{document}\%s{}\end{document}" % (sheet, gameclass, char)
    subprocess.check_call(["pdflatex", "-jobname", jobname, commands])


if len(sys.argv) != 3:
    print "usage: %s _NarraTeX-directory_ _sheet-type_|all" % sys.argv[0]
    sys.exit(1)

narratex_dir = sys.argv[1]

with open(os.path.join(narratex_dir, "Production", "json-PRINT.json"), "r") as f:
    game_objects = json.loads(f.read())

for game_object in game_objects:
    if "PC" in game_object["classes"]:
        if sys.argv[2] == "all":
            for sheet in sheet_types:
                make_sheet(game_object["macro"], sheet)
            subprocess.check_call(
                ["gs",
                 "-dBATCH",
                 "-dNOPAUSE",
                 "-q",
                 "-sDEVICE=pdfwrite",
                 "-sOutputFile=%s-all.pdf" % game_object["macro"]
                ] + ["%s-%s.pdf" % (game_object["macro"], sheet)
                     for sheet in sheet_types
                     if os.path.isfile("%s-%s.pdf" % (game_object["macro"], sheet))])
        else:
            make_sheet(game_object["macro"], sys.argv[2])
