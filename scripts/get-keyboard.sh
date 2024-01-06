#!/bin/bash

if [ -f .env ]; then
  export $(echo $(cat .env | sed 's/#.*//g'| xargs) | envsubst)
fi

echo `hyprctl devices -j | jq -r ".keyboards[${KEY_INDEX}] | .active_keymap" | tail -n1 | cut -c1-2 | tr 'a-z' 'A-Z'`
