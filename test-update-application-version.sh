#!/bin/bash
filename="ZaobaoUniversalApp.xcodeproj/project.pbxproj"
branchName="release/ipad/1.2.3"
new_release_version="1.2.3"

iPhoneBranchNamePattern="release/iphone/.*"
iPadBranchNamePattern="release/ipad/.*"

iPhoneSectionPattern="\t*baseConfigurationReference = ((?!iPad).)*\.xcconfig.*"
iPadSectionPattern="\t*baseConfigurationReference = .*iPad.*\.xcconfig.*"
universalSectionPattern="\t*baseConfigurationReference = .*\.xcconfig.*"

sectionPattern=$universalSectionPattern

if [[ $branchName =~ $iPadBranchNamePattern ]]; then
    sectionPattern=$iPadSectionPattern
elif [[ $branchName =~ $iPhoneBranchNamePattern ]]; then
    sectionPattern=$iPhoneSectionPattern
fi;

echo "sectionPattern = $sectionPattern"

lineNumber=0
in_section_check="NO"
in_reference_check="NO"
in_buildsetting_check="NO"

currentProjectVersionPattern="\t*CURRENT_PROJECT_VERSION = .*"
marketingVersionPattern="\t*MARKETING_VERSION = .*"

while read line; do
    # reading each line
    let "lineNumber += 1"
    echo "lineNumber = $lineNumber"

    if [ "$in_section_check" == "YES" ] || [ "$line" == "/* Begin XCBuildConfiguration section */" ]; then
        in_section_check="YES"

        if [ "$in_reference_check" == "NO" ]; then
            if [[ "$line" =~ $sectionPattern ]]; then
                in_reference_check="YES"

                echo "in_reference_check = $line"
            fi;
        elif [ "$line" == "buildSettings = {" ]; then
            in_buildsetting_check="YES"
        elif [ "$in_buildsetting_check" == "YES" ]; then
            if [[ "$line" =~ $marketingVersionPattern ]]; then
                newMarketingVersion="$new_release_version"
                newLine=${line/[0-9]*[\.]*[0-9]/$newMarketingVersion}

                echo "line = $line"
                echo "newLine = $newLine"
                echo "lineNumber = $lineNumber"
                
                command="sed -i '' '$lineNumber s/$line/$newLine/' $filename"
                echo "command = $command"
                # do the change marketing version
                eval $command

            elif [ "$in_buildsetting_check" == "YES" ] && [[ "$line" =~ $currentProjectVersionPattern ]]; then
                # do the change current project version
                newCurrentProjectVersion="1;"
                newLine=${line/[0-9]*/$newCurrentProjectVersion}

                echo "line = $line"
                echo "newLine = $newLine"
                echo "lineNumber = $lineNumber"

                command="sed -i '' '$lineNumber s/$line/$newLine/' $filename"
                echo "command = $command"
                # do the change marketing version
                eval $command
                
            elif [ "$line" == "};" ]; then
                echo "in_section_check = $in_section_check"
                echo "in_reference_check = $in_reference_check"
                echo "in_buildsetting_check = $in_buildsetting_check"

                in_reference_check="NO"
                in_buildsetting_check="NO"

                echo "==> Exit build setting/reference"
                echo "==> "
            fi;
        fi;

        if [ "$line" == "/* End XCBuildConfiguration section */" ]; then
            break;
        fi;
    fi;

    # if [ $lineNumber == '10' ]; then
    #     break;
    # fi;
done < $filename

echo "lineNumber = $lineNumber"
git add $filename

echo "=>>>> end test"