#!/bin/bash
/usr/bin/mkdir /run/zm
/usr/bin/chmod 777 /run/zm
/usr/bin/zmpkg.pl start
pidwait -F /var/run/zm/zm.pid
