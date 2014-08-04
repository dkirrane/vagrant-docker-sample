### In nginx.sh (make sure this file is chmod +x):
#!/bin/sh
# `/sbin/setuser root` runs the given command as the user `memcache`.
# If you omit that part, the command will be run as root.
# exec /sbin/setuser root /usr/sbin/nginx >>/var/log/nginx.log 2>&1
exec /sbin/setuser root /usr/sbin/nginx -c /etc/nginx/nginx.conf  -g "daemon off;"

