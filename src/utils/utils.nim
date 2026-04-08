# ---------------------------------
# - Utils
# - Imports
# ---------------------------------

import std/[
    strformat,
    osproc,
    strutils,
    terminal
]

# ---------------------------------
# - Color Codes
# ---------------------------------

const BGT* = ansiStyleCode(styleBright)
const RED* = BGT & ansiForegroundColorCode(fgRed)
const GRN* = BGT & ansiForegroundColorCode(fgGreen)
const BLUE* = ansiForegroundColorCode(fgBlue)
const YLW* = BGT & ansiForegroundColorCode(fgYellow)
const RST* = ansiResetCode

# ---------------------------------
# - Templates
# ---------------------------------

proc err*(errMsg: string) =
    echo fmt"{RED}!{RST} {errMsg}"
    quit(1)

proc warn*(warnMsg: string) =
    echo fmt"{YLW}!{RST} {warnMsg}"

proc readInput*(writeMsg: string): string =
    stdout.write fmt"{BLUE}?{RST} {writeMsg}"
    let stdinOutput = stdin.readLine().toLowerAscii()

    return stdinOutput 

proc scs*(successMsg: string) =
    echo fmt"{GRN}✓{RST} {successMsg}"

proc runcmd*(cmdStr: string, errStr: string): string =
    let (output, exitCode) = execCmdEx(cmdStr)

    if exitCode != 0:
        err fmt"{errStr}"
    
    return output

proc prt*(actionMsg: string) = 
    echo fmt"{BLUE}*{RST} {actionMsg}"