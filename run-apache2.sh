#!/bin/sh

echo "Calling the Apache2 startup script..." 2>&1
exec /usr/sbin/apache2ctl -D NO_DETACH -D FOREGROUND -k start 2>&1
