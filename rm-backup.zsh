# Script to backup reMarkable content
function rm-backup() {
    # Check if SSH connection is available
    if ! ssh -q root@remarkable exit
    then
	echo "Couldn't SSH to reMarkable. Make sure it's plugged in and awake?"
	exit 1
    else
	echo "SSH Connection to reMarkable successful"
    fi

    # Path to the directory to make the backup. Don't use ~ in the path.
    BACKUPDIR='/path/to/backup/dir/remarkable-backup'
    # Get current date and time as a string
    date=`date +'%Y-%m-%d_%H.%M.%S'`
    dest="$BACKUPDIR/$date/"

    # Create the destination folder, named with the date and time of backup
    mkdir $dest

    # Back up each important thing from the reMarkable
    echo "Backing up xochitl/ directory to $dest"
    scp -r root@remarkable:~/.local/share/remarkable/xochitl/ $dest/files

    echo "Backing up xochitl.conf to $dest"
    scp root@remarkable:~/.config/remarkable/xochitl.conf $dest

    echo "Backing up xochitl executable to $dest"
    scp root@remarkable:/usr/bin/xochitl $dest

    echo "Backup complete! See $dest"
}
