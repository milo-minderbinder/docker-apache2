#!/bin/sh

echo "Calling the Apache2 startup script..." 2>&1
exec /usr/sbin/apache2 -D NO_DETACH -D FOREGROUND 2>&1
