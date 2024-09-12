# tyk-cicd-dev-demo
Demo of CICD using Tyk Sync and GH Actions

docker run -it --rm -v $(pwd):/tmp/data tykio/tyk-sync:v1.5.1 dump -d="http://host.docker.internal:3000" -s="{TYK_DASHBOARD_API_CREDENTIAL}" -t="/tmp/data" --apis="{API_ID}"

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