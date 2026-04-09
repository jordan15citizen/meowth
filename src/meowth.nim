# ---------------------------------
# - Dispatcher
# - Imports
# ---------------------------------

import std/[
  strformat,
  strutils,
  os,
]

import utils/
  utils,
  strutils,
  utils/functions

# ---------------------------------
# - Argument Parsing
# ---------------------------------

let args = commandLineParams()

if args.len <= 0:
  warn "No command provided"
  displayHelp()
  quit(0)

case args[0]
of "push", "p":
  if args.len < 2 or args[1].isEmptyOrWhitespace():
    err "Cannot commit without a message!"
  pushToRemote(args[1])

of "pull", "sync", "s":
  syncRepo()

of "watch", "w":
  watchActions()

of "help", "--help":
  displayHelp()

of "payday":
  payday()

of "--socrates":
  prt "If using open-source software was your power, what are you without it?"
  let linuxOverEverything = readInput("What is a mouse? Is it XFCE4? No MATE, it's a GNOME isn't it? Well i'm eating cinnamon right now : ")
  prt fmt"""Answer checking ...
  A mouse is a {linuxOverEverything}""".unindent()

else:
  err fmt"""Invalid command {args[0]}!
    └── {GRN}Hint:{RST} Try help for usage and commands."""