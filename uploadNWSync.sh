#!/bin/env bash

# ======================================================================= #
# DO NOT TOUCH ANYTHING ABOVE THIS LINE UNLESS YOU KNOW WHAT YOU'RE DOING #
# ======================================================================= #

# Name of you DO Space
spacename="nwsync.wosee"

# Name of your module
# This will create a folder with this name and put nwsync folder inside it
modulename="wosee"

# ======================================================================= #
# DO NOT TOUCH ANYTHING BELOW THIS LINE UNLESS YOU KNOW WHAT YOU'RE DOING #
# ======================================================================= #

# Don't need to run as sudo, let's make sure it's not root
if ! [ "$EUID" -ne 0 ]; then
  echo
  echo "Don't run this script as root."
  echo
  sleep 1s
  exit 1
fi

# Delete the README.md from nwsync folder if it exists
if [[ -f nwsync/README.md ]]; then
    rm nwsync/README.md
fi

# Let's make sure all data have finished their jobs
# AKA all files/folders are done copying, moving, deleting, changing, etc from the system
# This might be overkill, but it doesn't hurt
sync

echo
echo "Removing nwsync folder from Digital Ocean Spaces"
echo
s3cmd rm s3://"$spacename/$modulename"/nwsync --recursive --force
sleep 1s
echo
echo "Uploading nwsync folder to Digital Ocean Spaces"
echo
s3cmd put nwsync s3://"$spacename/$modulename"/ --recursive

sleep 1s

echo
echo "Done"
echo

exit 0
