current_branch="$(git rev-parse --abbrev-ref HEAD)"
existed_in_remote=$(git ls-remote --heads origin ${current_branch})
is_need_check_branch_name="YES"

if [ -z "${existed_in_remote}" ]; then
    echo "The remote branch ${current_branch} is NOT exists"
    is_need_check_branch_name="YES"
else
    echo "Remote branch ${current_branch} exists"
    is_need_check_branch_name="NO"
fi;

if [ $is_need_check_branch_name == "YES" ]; then
    is_release_branch="NO"
    release_platform="Universal"
    warning_branch_name_message=""

    # ======================================================================================
    # ====================================== STEP 1. =======================================
    # ======================================================================================

    # Check if the branch is release/* or hotfix/* branch and its name is correct or not
    # if contains release/ or hotfix/
    if [ -z "$(echo ${current_branch} | sed -e "s/^release\/[0-9]*\.[0-9]*\.[0-9]*//g")" ]; then
        is_release_branch="YES"
        current_version=$(echo $current_branch | sed -e "s/^release\///g")
    elif [ -z "$(echo ${current_branch} | sed -e "s/^release\/iphone\/[0-9]*\.[0-9]*\.[0-9]*//g")" ]; then
        is_release_branch="YES"
        release_platform="iPhone"
        current_version=$(echo $current_branch | sed -e "s/^release\/iphone\///g")
    elif [ -z "$(echo ${current_branch} | sed -e "s/^release\/ipad\/[0-9]*\.[0-9]*\.[0-9]*//g")" ]; then
        is_release_branch="YES"
        release_platform="iPad"
        current_version=$(echo $current_branch | sed -e "s/^release\/ipad\///g")
    elif [ -z "$(echo ${current_branch} | sed -e "s/^hotfix\/[0-9]*\.[0-9]*\.[0-9]*//g")" ]; then
        is_release_branch="YES"
        current_version=$(echo $current_branch | sed -e "s/^hotfix\///g")
    elif [ -z "$(echo ${current_branch} | sed -e "s/^hotfix\/iphone\/[0-9]*\.[0-9]*\.[0-9]*//g")" ]; then
        is_release_branch="YES"
        release_platform="iPhone"
        current_version=$(echo $current_branch | sed -e "s/^hotfix\/iphone\///g")
    elif [ -z "$(echo ${current_branch} | sed -e "s/^hotfix\/ipad\/[0-9]*\.[0-9]*\.[0-9]*//g")" ]; then
        is_release_branch="YES"
        release_platform="iPad"
        current_version=$(echo $current_branch | sed -e "s/^hotfix\/ipad\///g")
    fi;

    is_accept_branch=!is_release_branch

    if [ $is_release_branch == "YES" ]; then
        current_major=`echo $current_version | cut -d. -f1`
        current_minor=`echo $current_version | cut -d. -f2`
        current_revision=`echo $current_version | cut -d. -f3`

        list_sorted_tag=''

        git pull

        if [ $release_platform == "iPhone" ]; then
            list_sorted_tag="$(git tag -l "iPhone*" --sort=-committerdate)"
        elif [ $release_platform == "iPad" ]; then
            list_sorted_tag="$(git tag -l "iPad*" --sort=-committerdate)"
        else
            list_sorted_tag="$(git tag --sort=-committerdate)"
        fi;

        IFS=' ' read -r -a most_recent_release_tag <<< "$list_sorted_tag"

        most_recent_release_tag_number_only=$(echo $most_recent_release_tag | sed -e "s/^${release_platform}-//g")

        # most_recent_release_tag="$(git describe --tags $(git rev-list --tags --max-count=1))"
        most_recent_major=`echo $most_recent_release_tag_number_only | cut -d. -f1`
        most_recent_minor=`echo $most_recent_release_tag_number_only | cut -d. -f2`
        most_recent_revision=`echo $most_recent_release_tag_number_only | cut -d. -f3`
    
        prefer_next_major=`expr $most_recent_major + 1`
        prefer_next_minor=`expr $most_recent_minor + 1`
        prefer_next_revision=`expr $most_recent_revision + 1`
    
        # Logging for debug
        echo "[pre-push] Log: current_branch          = ${current_branch}"
        echo "[pre-push] Log: most_recent_release_tag of ${release_platform} platform = ${most_recent_release_tag}"
        if [ $release_platform == "Universal" ]; then
            echo "[pre-push] Log: prefer_new_release_tag  = $most_recent_major.$most_recent_minor.$prefer_next_revision"
        else
            echo "[pre-push] Log: prefer_new_release_tag  = ${release_platform}-$most_recent_major.$most_recent_minor.$prefer_next_revision"
        fi;
    
        if [ $current_major == $most_recent_major ]; then
            if [ $current_minor == $most_recent_minor ]; then
                if [ $current_revision == $prefer_next_revision ]; then # Tăng đều
                    is_accept_branch="YES";
                    warning_branch_name_message="";
                # elif [ $current_revision > $prefer_next_revision ]; then # Tăng nhảy cóc. VD: từ 1.0.0 nhảy lên version mới là 1.0.3
                #     is_accept_branch="YES";
                #     warning_branch_name_message="[WARNING] The next release version should be $current_major.$current_minor.$prefer_next_revision. Please update if needed."
                else
                    is_accept_branch="NO";
                    warning_branch_name_message="[ERROR] The next release version should be $current_major.$current_minor.$prefer_next_revision. Please correct the branch name first."
                fi;
            elif [ $current_minor == $prefer_next_minor ]; then # Tăng đều
                if [ $current_revision == 0 ]; then # Bắt đầu revision mới
                    is_accept_branch="YES";
                    warning_branch_name_message="";
                # elif [ $current_revision -ge 1 ]; then # Tăng nhảy cóc. VD: từ 1.0.0 nhảy lên vision mới là 1.1.3
                #     is_accept_branch="YES";
                #     warning_branch_name_message="[WARNING] The next release version should be $current_major.$current_minor.0. Please update if needed."
                else
                    is_accept_branch="NO";
                    warning_branch_name_message="[ERROR] The next release version should be $current_major.$current_minor.0. Please correct the branch name first."
                fi;
            # elif [ $current_minor > $prefer_next_minor ]; then # Tăng nhảy cóc. VD: từ 1.0.0 nhảy lên version mới là 1.2.0
            #     if [ $current_revision -ge 0 ]; then # Bắt đầu revision mới hoặc nhảy cóc lên revision mới
            #         is_accept_branch="YES";
            #         warning_branch_name_message="[WARNING] The next release version should be $current_major.$prefer_next_minor.0. Please update if needed.";
            #     else
            #         is_accept_branch="NO";
            #         warning_branch_name_message="[ERROR] The next release version should be $current_major.$prefer_next_minor.0. Please correct the branch name first."
            #     fi;
            else
                is_accept_branch="NO";
                warning_branch_name_message="[ERROR] The next release version should be $current_major.$prefer_next_minor.0. Please correct the branch name first."
            fi;
        elif [ $current_major == $prefer_next_major ]; then # Tăng đều
            if [ $current_minor == 0 ]; then # Bắt đầu minor mới
                if [ $current_revision == 0 ]; then
                    is_accept_branch="YES"
                    warning_branch_name_message="";
                # elif [ $current_revision > 0 ]; then # Tăng nhảy cóc. VD: từ 1.0.0 nhảy lên version mới là 2.0.1
                #     is_accept_branch="YES";
                #     warning_branch_name_message="[WARNING] The next release version should be $prefer_next_major.0.0. Please update if needed."
                else
                    is_accept_branch="NO";
                    warning_branch_name_message="[ERROR] The next release version should be $prefer_next_major.0.0. Please correct the branch name first."
                fi;
            # elif [ $current_minor > 0 ]; then # Tăng nhảy cóc. VD: từ 1.0.0 nhảy lên version mới là 2.1.0
            #     if [ $current_revision -ge 0 ]; then # Bắt đầu revision mới hoặc nhảy cóc lên revision mới
            #         is_accept_branch="YES";
            #         warning_branch_name_message="[WARNING] The next release version should be  $prefer_next_major.0.0. Please update if needed.";
            #     else
            #         is_accept_branch="NO";
            #         warning_branch_name_message="[ERROR] The next release version should be  $prefer_next_major.0.0. Please correct the branch name first."
            #     fi;
            else
                is_accept_branch="NO";
                warning_branch_name_message="[ERROR] The next release version should be $prefer_next_major.0.0. Please correct the branch name first."
            fi;
        # elif [ $current_major > $prefer_next_major ]; then # Tăng nhảy cóc. VD: từ 1.0.0 nhảy lên version mới là 3.0.0
        #     if [ $current_minor -ge 0 ]; then # Bắt đầu minor mới hoặc nhảy cóc lên minor mới
        #         if [ $current_revision -ge 0 ]; then # Bắt đầu revision mới hoặc nhảy cóc. VD: từ 1.0.0 nhảy lên version mới là 2.0.1
        #             is_accept_branch="YES";
        #             warning_branch_name_message="[WARNING] The next release version should be $prefer_next_major.0.0. Please update if needed."
        #         else
        #             is_accept_branch="NO";
        #             warning_branch_name_message="[ERROR] The next release version should be $prefer_next_major.0.0. Please correct the branch name first."
        #         fi;
        #     else
        #         is_accept_branch="NO";
        #         warning_branch_name_message="[ERROR] The next release version should be $prefer_next_major.0.0. Please correct the branch name first."
        #     fi;
        else
            is_accept_branch="NO";
            warning_branch_name_message="[ERROR] The next release version should be $prefer_next_major.0.0. Please correct the branch name first."
        fi;

        if [ -n "$warning_branch_name_message" ]; then 
            echo "$warning_branch_name_message"
        fi;

        if [ $is_accept_branch == "NO" ]; then
            echo "==> Can NOT accept the branch name $current_branch"
	        exit 1
        else
            echo "==> PASS the check release branch name rule."
        fi;

    # ======================================================================================
    # ====================================== STEP 2. =======================================
    # ======================================================================================

    # Check if the branch name is a feature/* or bugfix/* or hotfix/* or master or develop
    elif [ $(echo ${current_branch} | sed -e "s/^feature\///g") != ${current_branch} ]; then # if contains feature/
        echo "==> $current_branch MATCHED the branch name feature/* rule"
    elif [ $(echo ${current_branch} | sed -e "s/^bugfix\///g") != ${current_branch} ]; then # if contains bugfix/
        echo "==> $current_branch MATCHED the branch name bugfix/* rule"
    elif [ "master" == "$current_branch" ]; then # if contains master
        echo "==> $current_branch MATCHED the branch name master"
    elif [ "develop" == "$current_branch" ]; then # if contains develop
        echo "==> $current_branch MATCHED the branch name develop"
    else
        echo "==> Your branch name does NOT match any rules: develop|master|feature/*|bugfix/*|hotfix/*|release/*|hotfix/ipad/*|release/ipad/*|hotfix/iphone/*|release/iphone/*"
	    exit 1
    fi;
fi;

exit 0