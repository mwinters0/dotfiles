git_file_history_oneliner() {
    local file="$1"
    git log --oneline --follow "$file" | \
    awk '{
        cmd = "git tag --contains " $1 " --sort=version:refname | grep -E \"^v[0-9]+\\.[0-9]+$\" | head -1"
        cmd | getline tag
        close(cmd)
        if (tag == "") tag = "(unreleased)"
        printf "%-12s %-12s %s\n", $1, tag, substr($0, 9)
    }'
}

git_file_history_oneliner $1
