#!/bin/bash

#############################
# arguments
user=$1


#############################
# allowed time frame
max_hour=17
max_minute=59
min_hour=16
min_minute=0
allowed_days=(3 6 7) # wednesday, saturday, sunday


#############################
# get current time
dow=$(date +%u)
hour=$(date +%H)
minute=$(date +%M)


#############################
# do the job
DAY_ALLOWED=`echo ${allowed_days[*]} | grep "$dow"`
if [ "$DAY_ALLOWED" != "" ] && [ $hour -ge $min_hour -a $hour -le $max_hour -a $minute -ge $min_minute -a $minute -le $max_minute ]
then
  /usr/sbin/usermod --expiredate "" $user
  echo "login for $user is authorized on day $dow at $hour:$minute!"
else
  /usr/sbin/usermod --expiredate 1 $user
  killall -u $user
  echo "login for $user is not allowed on day $dow at $hour:$minute!"
fi
