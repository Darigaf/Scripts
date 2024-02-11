#! /bin/bash
#Simple script that copies all of the scripts from this folder to $HOME/.local/bin/ and makes tem executable
cp ./* "$HOME"/.local/bin/
chmod u+x "$HOME"/.local/bin/*
