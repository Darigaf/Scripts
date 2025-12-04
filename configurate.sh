#! /bin/bash
#Simple script that copies all of the scripts from this folder to $HOME/.local/bin/ and makes tem executable

mkdir -p "$HOME"/.local/bin/
cp ./scripts/* "$HOME"/.local/bin/
chmod u+x "$HOME"/.local/bin/*
