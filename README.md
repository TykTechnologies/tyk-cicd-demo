# tyk-cicd-dev-demo
Demo of CICD using Tyk Sync and GH Actions


docker run -it --rm tykio/tyk-sync:v1.4.2 dump -d="https://honest-money-adm.aws-use1.cloud-ara.tyk.io" -s="df8026e842d74f677dea801528fec112" -t="./dev" --apis="9e81b88e87fd418f53aabcefc67bf89c"

docker run -it --rm tykio/tyk-sync:v1.4.2 dump -d="https://honest-money-adm.aws-use1.cloud-ara.tyk.io" -s="df8026e842d74f677dea801528fec112"

docker run --rm --mount type=bind,source="$(pwd)",target=/opt/tyk-sync/tmp \
 tykio/tyk-sync:v1.5 \
 dump \
 -d="https://honest-money-adm.aws-use1.cloud-ara.tyk.io" \
 -s="df8026e842d74f677dea801528fec112" \
 -t="./dev" \
 --apis="9e81b88e87fd418f53aabcefc67bf89c"

 docker run -it -v /Users/tyk-longle/Desktop/Tyk/tyk-cicd-dev-demo --rm tykio/tyk-sync:v1. dump -d="http://host.docker.internal:3000" -s="e904d76811ec4f937f6af5d61ba8984e" --apis="2399f2e90953469d50245a7e1c77813e"


 docker run --rm --mount type=bind,source="$(pwd)",target=/opt/tyk-sync/tmp \
 tykio/tyk-sync:v1.4 \
 dump \
 -d="http://host.docker.internal:3000" \
 -s="e904d76811ec4f937f6af5d61ba8984e" \
 -t="$(pwd)" \
 --apis="2399f2e90953469d50245a7e1c77813e"