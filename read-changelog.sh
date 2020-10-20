#!/bin/bash
filename='CHANGE-LOG-2020.md'
n=0
new_change_log=""
can_appending="NO"
while read line; do
    # reading each line
    n=$((n+1))

    echo "Line No $n"

    if [ "$line" == "## [Unreleased]" ]; then
        can_appending="YES"
    elif [[ "$line" == *"## [Released] "* ]]; then
        can_appending="NO"
    fi;

    if [ "$can_appending" == "YES" ] && [ ! -z "$line" ]; then 
        new_change_log+="$line";
        new_change_log+=$'\n';
    fi;

    if [ "$can_appending" == "NO" ] && [ ! -z "$new_change_log" ]; then 
        break;
    fi;

done < $filename

new_change_log="$(echo "$new_change_log" | sed "1 d")"
echo "::set-output name=unreleased_change_log::"${new_change_log}""
echo "==========================================================="
echo "$new_change_log"