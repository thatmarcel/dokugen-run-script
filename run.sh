#!/bin/sh

if ! [ -x "$(command -v deno)" ]; then
    # Install Deno
    if [ "$(uname)" == "Darwin" ]; then
        if [ -x "$(command -v brew)" ]; then
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
if ! [ -d "meta" ]; then
    mkdir -p meta
    echo Example >> meta/site-name
fi
deno run --allow-read --allow-net --unstable --reload=https://src.dokugen.co https://src.dokugen.co/dokugen.ts
