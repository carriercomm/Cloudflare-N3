#!/bin/sh

CLOUDFLARE_API_KEY=""
CLOUDFLARE_LOGIN=""
DNS_ZONE=""
DNS_ENTRY=""
DNS_ENTRY_ID="1111111"
DNS_ENTRY_TYPE="CNAME"
service_mode="0"

__switch_to_failover() {
  /usr/bin/curl https://www.cloudflare.com/api_json.html \
  -d 'a=rec_load_all' \
    -d "tkn=${CLOUDFLARE_API_KEY}" \
    -d "email=${CLOUDFLARE_LOGIN}" \
    -d "z=${DNS_ZONE}" 
}


__switch_to_failover;

