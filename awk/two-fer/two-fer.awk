
END {
    if (length($0) == 0)
        printf "One for you, one for me."
    else
        printf "One for %s, one for me.", $0
}