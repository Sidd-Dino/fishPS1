#!/bin/sh
#
# safe and secure install script.

download() {
    url="https://raw.githubusercontent.com/Sidd-Dino/fishPS1"
    url="${url}/master/.fishPS1"

    curl "$url" > ~/.fishPS1 || {
        printf '%s\n' "error: Couldn't download promptless." >&2
        exit 1
    }
}

get_shell() {
    rc="${HOME}/.${SHELL##*/}rc"

    [ ! -f "$rc" ] &&
       rc="${HOME}/.profile"
}

main() {
    download
    get_shell

    printf '%s\n' ". ~/.fishPS1" >> "$rc"
    printf '%s\n' "Installation complete. Relaunch your shell."
}

main "$@"