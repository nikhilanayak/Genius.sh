#!/bin/bash


id=$1

html=`curl -L -s https://genius.com/songs/$id`

if [[ $html =~ "im_under_attack" ]]; then
    #echo 500
    exit 1
fi
  if [[ $html =~ "Oops! Page not found" ]]; then
    #echo 404
    #exit 1
    exit
fi



json_line=`echo "$html" | grep PRELOADED_STATE`

json_data=`echo "$json_line" | node ./json_eval.js`

referents=`echo "$json_data" | tail -n1`
json_data=`echo "$json_data" | sed '$d'`



echo "$json_data" > data/$id

for r in $referents
do
  #echo $r
    html=`curl -L -s genius.com/$r`

    if [[ $html =~ "im_under_attack" ]]; then
        echo 500
        exit 1
    fi
    if [[ $html =~ "Oops! Page not found" ]]; then
        echo 404
	#echo genius.com/$r
        exit
    fi


  echo $html | python3 ./metafinder.py >> data/$id
done
