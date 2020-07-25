#!/bin/sh

which -s deno
if [[ $? == 0 ]]; then
    deno run --allow-read --allow-net --unstable --reload=https://src.dokugen.co https://src.dokugen.co/dokugen.ts
else
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
