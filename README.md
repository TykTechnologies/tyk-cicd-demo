# tyk-cicd-dev-demo
Demo of CICD using Tyk Sync and GH Actions

docker run -it --rm -v $(pwd):/tmp/data tykio/tyk-sync:v1.5.1 dump -d="http://host.docker.internal:3000" -s="{TYK_DASHBOARD_API_CREDENTIAL}" -t="/tmp/data" --apis="{API_ID}"