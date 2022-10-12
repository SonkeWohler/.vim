#!/bin/bash
copyFile() {
    if test -f "$HOME/.config/$1"; then
        cp -v "$HOME/.config/$1" "$HOME/.config/$1.old"
    fi
    cp -v "./kde/$1"  "$HOME/.config/$1"
}

for file in kde/*; do
    file=$(echo "$file" | sed 's/kde\///')
    copyFile $file
done
