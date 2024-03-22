#!/bin/env bash

# ======================================================================= #
# DO NOT TOUCH ANYTHING ABOVE THIS LINE UNLESS YOU KNOW WHAT YOU'RE DOING #
# ======================================================================= #

# Path to your module
modulepath="$HOME/.local/share/Neverwinter Nights/modules/mymodule.mod"

# NWSync download description
nwsyncdesc="Module's Required Files"

# ======================================================================= #
# DO NOT TOUCH ANYTHING BELOW THIS LINE UNLESS YOU KNOW WHAT YOU'RE DOING #
# ======================================================================= #

if [ "$EUID" -ne 0 ]
    then
        echo
        echo "This script must run as root to function."
        echo
        sleep 1s
        exit 1
fi

curdir="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

pushd $curdir

./nwsync_write --description="$nwsyncdesc" "$curdir"/nwsync "$modulepath"

sleep 1s

echo
echo "Done"
echo

exit 0
