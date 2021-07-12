#!/bin/bash

if [[ -z "${TIMEZONE}" ]]; then echo "TIMEZONE is unset"; 
else echo "date.timezone = \"$TIMEZONE\"" > /etc/php/7.3/apache2/conf.d/timezone.ini;
fi


#Activation du module rewrite d'apache
a2enmod rewrite && service apache2 restart && service apache2 stop

#Lancement du service apache au premier plan
/usr/sbin/apache2ctl -D FOREGROUND
