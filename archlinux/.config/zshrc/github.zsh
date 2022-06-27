# git difftool
# git config --global diff.tool vimdiff
# git config --global difftool.prompt false
# git config --global alias.d difftool

# git mergetool
# git config --global merge.tool vimdiff
# git config --global merge.conflictstyle diff3
# git config --global alias.m mergetool

function lazygit() {
    # when i feel trashy
    git add -A
    git commit -a -m "$1"
    git push
}

function git-create-repo() {
    # doesnt work
    curl -u 'klimmesil' https://api.github.com/user/repos -d '{"name":"$1"}'
}
