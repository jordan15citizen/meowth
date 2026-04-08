# ---------------------------------
# - Functions
# - Imports
# ---------------------------------

import std/[
    strformat
]

import utils

# ---------------------------------
# - Procs
# ---------------------------------

proc pushToRemote*(commitMsg: string) =
    let branchName = runcmd("git branch --show-current", "Could not get current branch main")
    
    prt "Adding changes ..."
    discard runcmd("git add .", fmt"""Failed to add files.
    {GRN}Hint:{RST} Did you initialize git?""")
    
    prt "Committing changes ..."
    discard runcmd(fmt"""git commit -m "{commitMsg}" """, """Failed to commit files.
    {GRN}Hint:{RST} Did you add a remote?
    {GRN}Hint:{RST} Are you authenticated?""")

    prt "Pushing to remote ..."
    discard runcmd(fmt"git push origin {branchName}", """Failed to push changes!
    {GRN}Hint:{RST} Are you synced to the remote?
    {GRN}Hint:{RST} Did you add a remote?""")

    scs "All actions executed successfully!"

proc syncRepo*() =
    let syncBranchName = runcmd("git branch --show-current", "Could not get current branch main")

    let puller = readInput("Use GitHub CLI or Git?")
    case puller
    of "github cli", "gh":
        prt "Syncing repository with GitHub CLI ..."
        discard runcmd("gh repo sync", "Sync failed using GitHub CLI!")
        scs "Synced repository from GitHub CLI!"
    of "git":
        prt "Syncing repository with Git ..."
        discard runcmd("git pull origin {syncBranchName} --rebase", "Sync failed using Git!")
        scs "Synced repository from GitHub CLI!"

proc displayHelp*() =
    prt "Meowth - The Git Assistant"
    prt "Commands should be easy to learn."
    echo ""

    echo "Usage: meowth <command> <args>"

    echo "push <commitMsg>"
    prt "A push to remote."
    prt "Default remote is origin."
    echo ""

    echo "pull | sync:"
    prt "Sync or pull changes from remote."

proc watchActions*() =
    discard runcmd("gh run watch", "Package gh not installed")
