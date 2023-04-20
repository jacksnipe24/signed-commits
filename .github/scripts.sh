          dependency="@chainlink/external-adapter-framework"
          latest_version=0.28.6
          packages=$(find packages -name 'package.json')
          v3_packages=()
          outdated_packages=()
          changes=($(git diff --name-only ${{ github.event.pull_request.base.sha }}..${{ github.event.pull_request.head.sha }} | xargs -I{} dirname {} | sort -u))
          
          # get the list of v3 EAs




          for file in $(echo $packages); do
            if jq -e ".dependencies[\"$dependency\"]" "$file" >/dev/null; then
              v3_packages+=("$(dirname $file)")
            fi
          done
          
          
          # check if changed code is part of v3 EA
          for changedFile in "${changes[@]}"; do
           for package in "${v3_packages[@]}"; do
              if [[ "$changedFile" == "$package"* ]]; then
                # found change in v3 adapter, comparing versions
                local_version=$(jq -r ".dependencies[\"$dependency\"]" "$package/package.json")
                if [ "$local_version" != $(echo $latest_version) ]; then
                  outdated_packages+=("$package")
                fi
              fi
           done
          done
          
          if [ ${#outdated_packages[@]} -gt 0 ]; then
            echo "The following packages have an outdated \"$dependency\" dependency:"
            for file in "${outdated_packages[@]}"; do
              echo "- $file"
            done
          exit 1
          fi

