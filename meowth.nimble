# ---------------------------------
# - Package Information
# ---------------------------------

version       = "0.1.0"
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
    exec "MV src/meowth bin/"

# ---------------------------------
# - Dependencies
# ---------------------------------

requires "nim >= 2.2.6"
