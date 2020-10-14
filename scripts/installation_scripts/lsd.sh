#!/bin/bash
[[ -f ~/.cargo/bin/cargo ]] && ~/.cargo/bin/cargo install lsd
[[ -f ~/.cargo/bin/lsd ]] && sudo cp ~/.cargo/bin/lsd /usr/local/bin/.
