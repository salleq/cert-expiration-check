#!/bin/bash
format=$1
if [ -z "$1" ]
then format="-json"
fi

now=$(date +%s)

expiration (){
expiration=$(echo | openssl s_client -showcerts -servername $1 -connect $1:443 2>/dev/null | openssl x509 -inform pem -noout -text | grep 'Not After' | sed 's/Not Afte>future=$(date +%s --date "$expiration")
difference=$(($future-$now))

if [[ $format = "-json" ]];
then
echo -e '{"domain":"'$1'","days":"'$(($difference/(3600*24)))'"}'

elif [[ $format = "-txt" ]];
then
echo -e $1'\t'$(($difference/(3600*24)))
fi

}

#enter any wanted domains here like below
expiration www.google.com
expiration www.microsoft.com


