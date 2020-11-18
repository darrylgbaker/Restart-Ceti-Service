# Restart Ceti Service
 Restarts Ceti Service if no events have been logged longer than 24 hours
This script can run as a startup script on the DL (OR the Invoke script can be used on remote machine. WinRM will need to be enabled for this with appropriate firewall rules in place) via task scheduler. This script checks every hour for events. If no events have been looged in 24 hours the script restarts the Ceti service.
