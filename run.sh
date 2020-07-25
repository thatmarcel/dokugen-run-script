#!/bin/sh

which -s deno
if [[ $? != 0 ]]; then
    # Install Deno
    if [ "$(uname)" == "Darwin" ]; then
        which -s brew
        if [[ $? == 0 ]]; then
            # Install Deno via Homebrew
            brew install deno
        else
            # Install Deno via the official install script
            curl -fsSL https://deno.land/x/install/install.sh | sh
        fi
    else
        # Install Deno via the official install script
        curl -fsSL https://deno.land/x/install/install.sh | sh
    fi
fi

mkdir -p routes
mkdir -p meta
echo Example >> meta/site-name
deno run --allow-read --allow-net --unstable --reload=https://src.dokugen.co https://src.dokugen.co/dokugen.ts
