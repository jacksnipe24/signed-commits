coverage=95

sed -i '' 's/\(!\[Coverage\](https:\/\/img\.shields\.io\/badge\/coverage-[0-9]\{1,3\}%25-green)\)/![Coverage](https:\/\/img\.shields\.io\/badge\/coverage-'$coverage'%25-green)/g' ./README.md
