#!/bin/bash

echo "------------------"
echo "this downloads some notes to your desktop folder"
echo "mostly reference guides on programming, git, linux, etc"
echo "it must be run after ./config.bash, because it relies on rustup"
echo "------------------"

mkdir --parents --verbose ~/Desktop/notes-for-professionals
cd ~/Desktop/notes-for-professionals

wget https://books.goalkicker.com/BashBook/BashNotesForProfessionals.pdf
wget https://books.goalkicker.com/Angular2Book/Angular2NotesForProfessionals.pdf
wget https://books.goalkicker.com/PythonBook/PythonNotesForProfessionals.pdf
wget https://books.goalkicker.com/GitBook/GitNotesForProfessionals.pdf
wget https://books.goalkicker.com/LinuxBook/LinuxNotesForProfessionals.pdf
wget https://books.goalkicker.com/PostgreSQLBook/PostgreSQLNotesForProfessionals.pdf
wget https://books.goalkicker.com/SQLBook/SQLNotesForProfessionals.pdf
wget https://books.goalkicker.com/TypeScriptBook2/TypeScriptNotesForProfessionals.pdf

rustup doc --book --path | xargs -I {} ln -s {} ./RustBook.index
rustup doc --cargo --path | xargs -I {} ln -s {} ./CargoBook.index
rustup doc --core --path | xargs -I {} ln -s {} ./RustcoreBook.index
rustup doc --std --path | xargs -I {} ln -s {} ./StdBook.index
rustup doc --reference --path | xargs -I {} ln -s {} ./RustReferenceBook.index
rustup doc --byexample --path | xargs -I {} ln -s {} ./RustByExampleBook.index
