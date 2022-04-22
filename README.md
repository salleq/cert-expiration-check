# cert-expiration-check
A Bash script to check a number of hosts for certificate expiration.

I created this to get the dates to a dashboard for easy viewing.

To start,
```console
cp cert-domains.sample cert-domains && nano cert-domains
```
Add the domains you want to check, then run ./certcheck.sh

You can change the output from default json to colored text to run it manually with argument -txt
```console
./certcheck.sh -txt
```

You can also override the domains file and just check a single domain with two arguments
```console
./certcheck.sh -txt somedomain.com
```

Note that you need to have both arguments (format and domain) when overriding the list file.
The valid arguments for format are -txt and -json.

TODO: single domain check with only one argument.