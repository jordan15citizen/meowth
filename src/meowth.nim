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
  utils/functions

# ---------------------------------
# - Argument Parsing
# ---------------------------------

let args = commandLineParams()

if args.len <= 0:
  warn "No command provided!"
  displayHelp()
  quit(0)

case args[0]
of "push", "p":
  if args.len < 1 or args[1].isEmptyOrWhitespace():
    err "Commit message cannot be empty."
  
  pushToRemote(args[1])

of "pull", "sync", "s":
  syncRepo()

of "watch", "w":
  watchActions()

of "help", "--help":
  displayHelp()
of "payday":
  payday()

else:
  err fmt"""Invalid command {args[0]}.
  {GRN}Hint:{RST} Try help for usage and commands."""