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
    stderr.writeLine fmt"{RED}✖{RST} {errMsg}"
    quit(1)

proc warn*(warnMsg: string) =
    stderr.writeLine fmt"{YLW}!{RST} {warnMsg}"

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

proc prt*(printMsg: string) = 
    echo fmt"{BLUE}*{RST} {printMsg}"