#!/bin/bash
##########
#
# Easy backup bash script
#
##########

# Source directory
source_dir="var/www/html"

# Backup directory
backup_dir="backup"

# Destination directory
dest_dir="mnt/$backup_dir"

# File limit
file_limit=5

# Create directory if not exist (777 for test)
mkdir -p -m 777 $dest_dir

# Filename format (Year + Month + Day + Hour + Minute + Second)
filename=`date +%Y%m%d%H%M%S`
archive_file="$filename.tar.bz2"

# Check file count
file_count=$(find mnt/backup/ -maxdepth 1 -type f -name '*.tar.bz2' | wc -l)

# Print start status message
echo "File limit checking and backing up $source_dir to $dest_dir/$archive_file"

if [ $file_count -ge $file_limit ]
then
# Minimum limit exceeded (delete the oldest backup)
echo "Delete old backup"
rm mnt/backup/"$(ls -t mnt/backup/ | tail -1)"
tar -czf $dest_dir/$archive_file $source_dir
else
# More space (create new file backup)
tar -czf $dest_dir/$archive_file $source_dir
fi

# Print end status message
echo "Backup completed successfully"