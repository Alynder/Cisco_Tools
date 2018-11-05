#!/bin/bash

#Clean the Garbage output the controller sends out convert it to csv for easy read format

        sed -i 's/..$//' aplist
        sed -i 's/^.\{,530\}//' aplist
        sed -i 's/\\n/""/g' aplist
        sed -i 's/", "/""/g' aplist
        sed -i 's/[[:space:]]\+/ /g' aplist
        sed -i 's/ /,/g' aplist
        sed -i 's/,\[0,,0,,0,\]//g' aplist
        tr '""' '\n' < aplist > aplist.csv
        sed -r -e 's/,([^:,]+),([^,]+),US/,\1_\2,US/' aplist.csv > ap_list.csv
        rm -rf aplist.csv aplist



#Generate the json list of aps break out each item for each ap
jq -Rsn '
  {"ap_list":
    [inputs
     | . / "\n"
     | (.[] | select((. | length) > 0) | . / ",") as $input
     | {"ap_name": [$input[0]], "slots":[$input[1]], "ap_model":[$input[2]], "mac":[$input[3]],"building":[$input[4]], "country":[$input[5]], "ipaddr":[$input[6]], "current_client_count":[$input[7]]}]}
' < ap_list.csv > ap_list.json


`rm -rf ap_list.csv`
