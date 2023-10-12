VERSION=$(curl -sL 'https://api.github.com/repos/fatedier/frp/releases/latest' | jq '.tag_name' | sed 's/^"v//;s/"$//')
docker buildx build --tag liyuanbiao/frps:latest --tag liyuanbiao/frps:$VERSION --build-arg FRP_VERSION=$VERSION --push --platform linux/amd64,linux/arm64,linux/arm ./frps/
docker buildx build --tag liyuanbiao/frpc:latest --tag liyuanbiao/frpc:$VERSION --build-arg FRP_VERSION=$VERSION --push --platform linux/amd64,linux/arm64,linux/arm ./frpc/
