# Easy backup

Minimalist backup solution.
The bash script stores the `/var/www/html` directory along with its contents in a `..tar.bz2` file.
The archive includes the current date in its name and is stored in the `/mnt/backup` directory.
As the storage space in a web server is limited, a 5 file limitation solution has been devised, so if the sixth backup is added the script will delete the oldest in order of time.

### Edit configurations

You can change the following settings:

##### Source directory

`source_dir="PATH"`

##### Backup directory

`backup_dir="DIRECTORY"`

##### Destination directory
`dest_dir="PATH/$backup_dir"`

##### File limit

`file_limit=NUMBER`

### Live use

##### Executing from a Terminal
`sudo ./backup.sh` or `./backup.sh`

##### Executing with Cron

`crontab -e` or `sudo crontab -e`

Add the following entry to the crontab file:

*The script will run every day at 1:15 pm.

```
# m h dom mon dow   command
15 1 * * * /bin/bash /PATH/backup.sh
```

```
+---------------- minute (0 - 59)
|  +------------- hour (0 - 23)
|  |  +---------- day of month (1 - 31)
|  |  |  +------- month (1 - 12)
|  |  |  |  +---- day of week (0 - 6) (Sunday=0 or 7)
|  |  |  |  |
*  *  *  *  *  command to be executed
```
