#!/bin/bash

# Ensure the ENV environment variable is set
if [ -z "$DIRECTORY" ]; then
  echo "Error: ENV environment variable is not set."
  exit 1
fi

# Ensure the DIRECTORY environment variable is set
if [ -z "$DIRECTORY" ]; then
  echo "Error: DIRECTORY environment variable is not set."
  exit 1
fi

for file in $(find . -name "*.json" ! -name ".tyk.json"); do
    # echo "Validating API/Policy definition $file"
    # # Check if target_url is valid and not empty
    # if jq -e '.proxy.target_url | length > 0' "$file" > /dev/null; then
    #   echo "$file contains a valid proxy.target_url."
    #   target_url=$(jq -r '.proxy.target_url' "$file")
    #   echo "proxy.target_url: $target_url"
    # else
    #   echo "$file does NOT contain a valid proxy.target_url."
    #   exit 1
    # fi
    
    # Check if either JWT auth or or MutuatTLS is enabled
    echo "Validating if the available authentication mechanisms are enabled"
    if jq -e '.api_definition.enable_jwt == true or .api_definition.auth_configs.use_mutual_tls_auth == true' "$file" > /dev/null; then
        echo "$file has either JWT auth or MutualTLS auth set to true."
    else
        echo "$file does NOT have either JWT auth or MutualTLS auth set to true."
        exit 1
    fi
    
done