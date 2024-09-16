# tyk-cicd-dev-demo
Demo of CICD using Tyk Sync and GH Actions
Configuration Example
```
STG_US_CONFIG_DATA={\"routes\": {\"default\": \"https://stg.httpbin.com\",\"stg1\": \"https://stg1.httpbin.com\",\"stg2\": \"https://stg2.httpbin.com\"}}
STG_US_PROXY_TARGET_URL=http://httpbin.org/get?env=stg

PROD_US_CONFIG_DATA={\"routes\": {\"default\": \"https://prod.httpbin.com\",\"prod1\": \"https://prod1.httpbin.com\",\"prod2\": \"https://prod2.httpbin.com\"}}
PROD_US_PROXY_TARGET_URL=http://httpbin.org/get?env=prod
```

Tyk Sync Dump Command Example
```
docker run -it --rm -v $(pwd):/tmp/data tykio/tyk-sync:v1.5.1 dump -d="http://host.docker.internal:3000" -s="{TYK_DASHBOARD_API_CREDENTIAL}" -t="/tmp/data" --apis="{API_ID}"
```

Execute Pipeline using Act Example
```
act push -s STG_US_CONFIG_DATA={\"hello\"\:\"world\"} -s ORG_NAME=tyk -s ORG_EMAIL=long@tyk.io -s STG_US_PROXY_TARGET_URL=httpbin2.org
```

Spectral / Stoplight Ruleset Example
```
  # no-empty-target-url:
  #   description: APIs must have a target_url
  #   given: "$.api_definition.proxy"
  #   severity: error
  #   then:
  #     field: 'target_url'
  #     function: 'pattern'
  #     functionOptions:
  #       match: '^(?!\s*$).+'

  # check-for-mtls-auth:
  #   description: MutualTLS is not enabled
  #   given: "$.api_definition"
  #   severity: warning
  #   then:
  #     field: enable_jwt 
  #     function: falsy

  # ensure-authentication-method:
  #   description: "Ensure that at least one of 'enable_jwt' or 'use_mutual_tls_auth' is true."
  #   given: "$.api_definition"
  #   then:
  #     - field: "enable_jwt"
  #       function: truthy
  #       functionOptions:
  #         negation: true # Should not be false
  #     - field: "use_mutual_tls_auth"
  #       function: truthy
  #       functionOptions:
  #         negation: true # Should not be false
  #   severity: error
  #   message: "At least one of 'api_definition.enable_jwt' or 'api_definition.use_mutual_tls_auth' must be true."
```