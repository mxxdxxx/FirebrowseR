if [ "$TRAVIS_BRANCH" != "swagger" ]; then
  exit 0; 
fi
    
export GIT_COMMITTER_EMAIL=i"mariodeng@googlemail.com"
export GIT_COMMITTER_NAME="Mario Deng"

#git checkout master || exit
git checkout -b master --track origin/master
git merge "$TRAVIS_COMMIT" || exit
git push origin master
