
          branch="bot/releaseiphone/1.2.3/master"
          is_releasable_branch='NO'
          releasable_prefix_branchname=''
          releasable_prefix_branchname_verb_ing=''
          releasable_prefix_branchname_v2=''
          platform='' # Empty means the next release is the universal app (both iPhone and iPad platform)

          # if contains release/
          if [ -z "$(echo ${branch} | sed -e "s/^bot\/release(iphone|ipad)*\/[0-9]*\.[0-9]*\.[0-9]*\/master//g")" ]; then
              is_releasable_branch='YES'
              releasable_prefix_branchname='release'
              releasable_prefix_branchname_verb_ing='in releasing'
              releasable_prefix_branchname_v2='released'
              
              if [ $(echo ${branch} | sed -e "s/^bot\/release\/iphone\///g") != ${branch} ]; then
                  platform='iphone'
              elif  [ $(echo ${branch} | sed -e "s/^bot\/release\/ipad\///g") != ${branch} ]; then
                  platform='ipad'
              fi;
          elif [ -z "$(echo ${branch} | sed -e "s/^bot\/hotfix\/[0-9]*\.[0-9]*\.[0-9]*\/master//g")" ]; then
              is_releasable_branch='YES'
              releasable_prefix_branchname='hotfix'
              releasable_prefix_branchname_verb_ing='in hotfixing'
              releasable_prefix_branchname_v2='hotfixed'

              if [ $(echo ${branch} | sed -e "s/^bot\/hotfix\/iphone\///g") != ${branch} ]; then
                  platform='iPhone'
              elif  [ $(echo ${branch} | sed -e "s/^bot\/hotfix\/ipad\///g") != ${branch} ]; then
                  platform='iPad'
              fi;
          fi;
          
          echo "is_releasable_branch = $is_releasable_branch"
          echo "releasable_prefix_branchname = $releasable_prefix_branchname"
          echo "platform = $platform"