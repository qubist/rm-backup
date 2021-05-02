# Script to backup reMarkable content
function rm-backup() {
  # Color code variables
  RED="\e[0;31m"
  YELLOW="\e[0;33m"
  RESET="\e[0m"

  echo "${YELLOW}Trying to connect to reMarkable with SSH${YELLOW}"
  # Check if SSH connection is available
  if ! ssh -q root@remarkable exit
  then
    echo "${RED}Couldn't SSH to reMarkable. Make sure it's plugged in and awake?${RESET}"
    exit 1
  else
    echo "${YELLOW}SSH Connection to reMarkable successful${RESET}"
  fi

  # Path to the directory in which to make the backup. Don't use ~ in the path.
  BACKUPDIR='/path/to/backup/dir/remarkable-backup'
  # Get current date and time as a string
  date=`date +'%Y-%m-%d_%H.%M.%S'`
  dest="$BACKUPDIR/$date/"

  # Check that the backup folder exists
  if [[ ! -d "$BACKUPDIR" ]]
  then
      echo "${RED}Could not find directory $BACKUPDIR${RESET}"
      exit 1
  fi

  # Create the destination folder, named with the date and time of backup
  mkdir $dest

  # Back up each important thing from the reMarkable
  echo "${YELLOW}Backing up xochitl/ directory to $dest${RESET}"
  scp -r root@remarkable:~/.local/share/remarkable/xochitl/ $dest/files

  echo "${YELLOW}Backing up xochitl.conf to $dest${RESET}"
  scp root@remarkable:~/.config/remarkable/xochitl.conf $dest

  echo "${YELLOW}Backing up xochitl executable to $dest${RESET}"
  scp root@remarkable:/usr/bin/xochitl $dest

  echo "${YELLOW}Backup complete!${RESET}"
  echo "${YELLOW}See $dest${RESET}"
}
