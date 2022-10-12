#!/bin/bash
copyFile() {
    if test -f "$HOME/.config/$1"; then
        mv -v "$HOME/.config/$1" "$HOME/.config/$1.old"
    fi
    filepath=$(realpath "./kde/$1")
    ln --symbolic --verbose "$filepath"  "$HOME/.config/$1"
}

for file in kde/*; do
    file=$(echo "$file" | sed 's/kde\///')
    copyFile $file
done
