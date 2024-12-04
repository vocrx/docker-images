#!/bin/sh

: >config.toml

if [ -n "$RELAY" ]; then
    listen_port=$(echo "$RELAY" | cut -d':' -f1)
    remote_ip=$(echo "$RELAY" | cut -d':' -f2)
    remote_port=$(echo "$RELAY" | cut -d':' -f3)

    echo "[[endpoints]]" >>config.toml
    echo "listen=\"[::]:$listen_port\"" >>config.toml
    echo "remote=\"$remote_ip:$remote_port\"" >>config.toml
fi

i=1
while true; do
    eval relay_var=\$RELAY$i
    if [ -z "$relay_var" ]; then
        break
    fi

    listen_port=$(echo "$relay_var" | cut -d':' -f1)
    remote_ip=$(echo "$relay_var" | cut -d':' -f2)
    remote_port=$(echo "$relay_var" | cut -d':' -f3)

    echo "[[endpoints]]" >>config.toml
    echo "listen=\"[::]:$listen_port\"" >>config.toml
    echo "remote=\"$remote_ip:$remote_port\"" >>config.toml

    i=$((i + 1))
done

exec /realm/realm -c /realm/config.toml
