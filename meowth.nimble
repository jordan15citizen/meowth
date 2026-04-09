# ---------------------------------
# - Package Information
# ---------------------------------

version       = "0.2.75"
author        = "jordan15citizen"
description   = "Git helper for common git usage"
license       = "MIT"
srcDir        = "src"
bin           = @["meowth"]

# ---------------------------------
# - Tasks
# ---------------------------------

task releaseBuild, "Build release binaries":
    exec "nim c -d:Release --opt:speed --passL:-s src/meowth.nim"
    exec "mv src/meowth bin/"

# ---------------------------------
# - Dependencies
# ---------------------------------

requires "nim >= 2.2.6"
