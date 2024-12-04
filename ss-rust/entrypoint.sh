#!/bin/sh

echo "{\"log\": {\"level\": ${LEVEL:-1}},\"servers\": [{\"server\": \"::\",\"server_port\": ${PORT},\"password\": \"${PASSWORD}\",\"method\": \"${METHOD:-2022-blake3-aes-128-gcm}\",\"mode\": \"${MOD:-tcp_and_udp}\"}],\"dns\": \"${DNS:-system}\"}" >config.json

exec /root/ss-rust/ssserver -c /root/ss-rust/config.json
