#!/bin/sh

CLOUDFLARE_API_KEY=""
CLOUDFLARE_LOGIN="dono@nyit-nyit.net"
DNS_ZONE="nyit-nyit.net"
DNS_ENTRY="nyit-nyit.net"
DNS_ENTRY_ID="29200222"
DNS_ENTRY_TYPE="A"
content="175.103.59.140"
service_mode="1"

__switch_to_failover() {
  /usr/bin/curl https://www.cloudflare.com/api_json.html \
    -d "a=rec_edit" \
    -d "tkn=${CLOUDFLARE_API_KEY}" \
    -d "id=${DNS_ENTRY_ID}" \
    -d "email=${CLOUDFLARE_LOGIN}" \
    -d "z=${DNS_ZONE}" \
    -d "type=${DNS_ENTRY_TYPE}" \
    -d "name=${DNS_ENTRY}" \
    -d "content=${content}" \
    -d "ttl=1" \
    -d "service_mode=${service_mode}"
}

__switch_to_failover;


