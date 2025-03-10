status is-interactive || exit

function github-pr-watch-for-checks --description "when I am done with a review, but GitHub checks aren't yet"
    set current_branch $(git branch | grep '*' | awk '{print $2}')
    if not set -q current_branch
        return 1
    end
    gh run list | awk -F \t "{if (\$5 == \"$current_branch\" && \$1 != \"completed\") {print \$7}}" | head -n 1 | xargs -I {} gh run watch {} --exit-status --interval 30
end

function _utils_github_update_pr_update_branch
    set -l master $argv[1]
    and git pull
    and git merge $master --no-edit
    and git push
    # I should add options for this, but then I want either defaults or an abbr
    # this is how we do stuff at work right now, for reasons
    and gh pr merge --auto --squash --delete-branch
    and github-pr-watch-for-checks
end

function github-update-prs --description 'WIP: merge multiple branches'
    set -l options (fish_opt --short=b --long=branch --required-val --multiple-vals)
    set options $options (fish_opt --short=m --long=master --required-val)
    argparse $options -- $argv
    or return 1
    if test (count $_flag_b) = 0
        echo 'fatal'
        echo 'at least one --branch option is required'
        return 1
    end
    set -ql _flag_m[1]
    and set -l master $_flag_m[-1]
    or set -l master development

    if not git status
        echo "fatal"
        echo "it looks like you are not in a git repository"
        return 1
    end
    if not test -z "$(git status --porcelain)"
        echo "fatal"
        echo "your working tree is not clean"
        echo "please stash or commit your changes first"
        echo ""
        return 1
    end
    set -l start_branch $(git branch | grep '*' | awk '{print $2}')
    or return 1
    if not git switch $master
        echo "fatal"
        echo "failed to switch to the master branch $master"
        echo "this is usually the base-branch"
        return 1
    end

    for branch in $_flag_b
        echo '----'
        echo "updating $branch now"
        git switch $master && git pull
        if not git switch $branch
            echo "failed to switch to branch $branch"
            echo "skipping"
            continue
        end
        if not _utils_github_update_pr_update_branch $master
            echo "failed to process branch $branch"
            echo "skipping"
            continue
        end
    end

    echo 'github-update-prs done'
end
