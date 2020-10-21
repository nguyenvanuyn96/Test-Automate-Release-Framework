#!/bin/bash
filename='CHANGE-LOG-2020.md'
n=0
new_change_log=""
can_appending="NO"
while read line; do
    # reading each line
    # n=$((n+1))

    # echo "Line No $n"

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

released_change_log=""
can_appending="NO"
while read line; do
    # reading each line
    # n=$((n+1))

    # echo "Line No $n"

    if [ "$line" == "## [Released] 1.0.26" ]; then
        can_appending="YES"
    elif [[ "$line" == *"## [Released] "* ]]; then
        can_appending="NO"
    fi;

    if [ "$can_appending" == "YES" ] && [ ! -z "$line" ]; then 
        released_change_log+="$line";
        released_change_log+=$'\n';
    fi;

    if [ "$can_appending" == "NO" ] && [ ! -z "$released_change_log" ]; then 
        break;
    fi;

done < $filename

# new_change_log="$(echo "$new_change_log" | sed "1 d")"
# released_change_log="$(echo "$released_change_log" | sed "1 d")"
# new_change_log="${new_change_log//'%'/'%25'}"
# new_change_log="${new_change_log//$'\n'/'%0A'}"
# new_change_log="${new_change_log//$'\r'/'%0D'}"
# echo "::set-output name=unreleased_change_log::${new_change_log}"
# echo "==========================================================="
# echo "============new_change_log==============================================="
# echo "${new_change_log}"
echo "============released_change_log==============================================="
echo "${released_change_log}"
echo "==========================================================="

while read -r released_line
do
    # reading each line
    unreleased_n=0

    # echo "==========================================================="
    while read -r unreleased_line
    do
        # reading each line
        unreleased_n=$((unreleased_n+1))
        # echo "Line No $unreleased_n: $unreleased_line"

        if [ "$unreleased_line" == "$released_line" ] && [[ $unreleased_line != "### "* ]]; then
            new_change_log="$(echo "$new_change_log" | sed "$unreleased_n d")"
            unreleased_n=$((unreleased_n-1))
            break;
        fi;
    done < <(printf '%s\n' "$new_change_log")
done < <(printf '%s\n' "$released_change_log")

echo "============new_change_log==============================================="
echo "${new_change_log}"
echo "==========================================================="
echo "==========================================================="
final_changelog="$new_change_log"
final_changelog+=$'\n';
final_changelog+=$'\n';
final_changelog+="$released_change_log"

echo "============final_changelog==============================================="
echo "${final_changelog}"
