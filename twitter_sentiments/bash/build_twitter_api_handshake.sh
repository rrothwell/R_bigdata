#!/usr/bin/env bash

# After creating a Twitter account.
# As of 30Jul2015 follow the "Manage Your Apps" link under TOOls at the bottom of the page
# from the URL: https://dev.twitter.com.
# This goes to the URL: https://apps.twitter.com
# There create a new App or click on an existing App listed there.
# For an existing App visit the Keys and Access Tokens tab to find the values
# for:
# Consumer Key (API Key)
# Consumer Secret (API Secret)

cp -f ../twitter_handshake.R ../private

sed -i.bak s/%APIKey%/vQe0RZbjkzRgZ9qudrJrB38q9/ ../private/twitter_handshake.R
sed -i.bak s/%APISecret%/UdMu5XW94BXbjSniN2cLbN7ZiToIj9H40hZxFX37f87StFTAbq/ ../private/twitter_handshake.R 