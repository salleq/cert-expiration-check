#!/bin/bash

expiration (){
expiration=$(echo | openssl s_client -showcerts -servername $1 -connect $1:443 2>/dev/null | openssl x509 -inform pem -noout -text | grep 'Not After' | sed 's/Not After : //')
future=$(date +%s --date "$expiration")
difference=$(($future-$now))
echo -e $1 '\t\t'$(($difference/(3600*24))) days
}

now=$(date +%s)

#enter any wanted domains here like below
expiration www.google.com
expiration www.microsoft.com


