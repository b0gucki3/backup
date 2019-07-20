#!/bin/bash
####################################
#
# Backup to NFS mount script.
#
####################################

# Declare variables
day=$(date +%d-%m-%Y)
timestamp=$(date +%s)
folder=$day"_"$timestamp

# Create a local folder to store the backup
mkdir /home/pawel/backup/$folder
tar -czvf /home/pawel/backup/$folder/pawelbogucki.tar.gz /var/www/pawelbogucki
mysqldump pawelbogucki > /home/pawel/backup/$folder/pawelbogucki.sql
tar -czvf /home/pawel/backup/$folder.tar.gz /home/pawel/backup/$folder

# Copy the backup to the remote server, 1wuqis2aXh-inEJQwEHtL_OfwauN8zmjk is a folder in Google Drive
/home/pawel/./gdrive upload --parent 1wuqis2aXh-inEJQwEHtL_OfwauN8zmjk /home/pawel/backup/$folder.tar.gz

# Remove the temporary files
rm -r /home/pawel/backup/$folder
rm /home/pawel/backup/$folder.tar.gz

# Print end status message
echo "Backup finished."