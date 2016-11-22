if [ "$TRAVIS_BRANCH" != "swagger" ]; then
  exit 0;
fi

git init || exit
git config user.name "Travis-CI" || exit
git config user.email "mariodeng@googlemail.com" || exit
git add . || exit
git commit -m "Auto deploy from travis after api update" || exit
git push --force --quiet "https://${GH_TOKEN}@${GH_REF}" swagger:master > /dev/null 2>&1 || exit

