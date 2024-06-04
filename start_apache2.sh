#!/bin/bash
/usr/sbin/apachectl start
pidwait -F /var/run/apache2/apache2.pid
