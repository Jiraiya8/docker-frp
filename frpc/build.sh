docker buildx build --tag liyuanbiao/frpc:latest --tag liyuanbiao/frpc:$1 --build-arg FRP_VERSION=$1 --push --platform linux/amd64,linux/arm64,linux/arm .
