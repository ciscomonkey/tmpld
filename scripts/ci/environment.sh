# Creates a stable branch identifier when executing CI on pull requests.
if [[ $TRAVIS_PULL_REQUEST == "false" ]]; then
    export BRANCH=$TRAVIS_BRANCH
else
    export BRANCH=$TRAVIS_PULL_REQUEST_BRANCH
fi

export REPO=$DOCKER_USER/$(basename $TRAVIS_REPO_SLUG)
export COMMIT=${TRAVIS_COMMIT::6}
if [[ $BRANCH == "master" ]]; then
    export TAG='latest'
else
    export TAG=$BRANCH
fi
