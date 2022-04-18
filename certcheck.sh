#!/bin/bash
format=$1
if [ -z "$1" ]
then format="-json"
fi

yellow='\e[0;33m'
red='\e[0;31m'
white='\e[1;37m'
reddate=20
yellowdate=50

now=$(date +%s)

# If you want to list domains in the script instead of external file, comment rows 15-19 and uncomment rows 10,14 and add 
# domains between those rows

# domains=(
# #####list domains here one per row

# ######
# )
readarray -t domains < ./cert-domains

for i in "${domains[@]}"

do


expiration=$(echo | openssl s_client -showcerts -servername $i -connect $i:443 2>/dev/null | openssl x509 -inform pem -noout -text | grep 'Not After' | sed 's/Not After : //')
future=$(date +%s --date "$expiration")
difference=$(($future-$now))
days=$(($difference/(3600*24)))

if [[ $days -lt $reddate ]]
then
color=$red
elif [[ $days -lt $yellowdate ]]
then
color=$yellow

else
color=$white
fi


if [[ $format = "-json" ]];
then
echo -e '{"domain":"'$i'","days":"'$(($difference/(3600*24)))'"}'

elif [[ $format = "-txt" ]];
then
echo -e ${color}$i'\t'$(($difference/(3600*24)))

fi

done