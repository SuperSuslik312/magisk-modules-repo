#!/bin/bash

cd util

# Get zipUrl of YouTube ReVanced Extended
# youtube=$(curl -s https://api.github.com/repos/j-hc/revanced-magisk-module/releases/latest \
# | grep "browser_download_url.*youtube-revanced-extended-magisk.*zip" \
# | cut -d : -f 2,3 \
# | tr -d \" \
# | tr -d " ")

# Get zipUrl of Zygisk in KernelSU
zygisksu=$(curl -s https://api.github.com/repos/Dr-TSNG/ZygiskOnKernelSU/releases/latest \
| grep "browser_download_url.*zip" \
| cut -d : -f 2,3 \
| tr -d \" \
| tr -d " ")

# ./cli.py module --stdin << EOF
# {
#   "id": "youtube-extended-jhc",
#   "update_to": "$youtube",
#   "license": "GPL-3.0"
# }
# EOF

./cli.py module --stdin << EOF
{
  "id": "zygisksu",
  "update_to": "$zygisksu",
  "license": "GPL-3.0"
}
EOF

./cli.py sync --push
