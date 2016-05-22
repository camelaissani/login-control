# login-control
Enable / Disable linux login (ubuntu) according to a specific time frame

## usage
``` bash
./login-control.sh <username_to_manage>
```

On my side I created a root cron which executes the command evey 5 minutes
```
*/5 * * * * <path_to_the_command>/login-control.sh peter > /var/log/login-control.log 2>&1
```
