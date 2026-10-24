# minecraft_bedrock_server
Docker image for a Minecraft Bedrock Edition server.

# How to build the image and push to Docker Hub:
```
docker buildx build --platform linux/amd64,linux/arm64 -t projectscache/minecraft_bedrock_server .
```

```
docker push projectscache/minecraft_bedrock_server
```

# How to pull the image and start the server:
```
docker pull projectscache/minecraft_bedrock_server
```

```
docker run -d -p 19132:19132/udp --name minecraft_bedrock_server projectscache/minecraft_bedrock_server:latest
```

If your machines architecture is not amd64 then install an emulation layer: 
```
docker run --privileged --rm tonistiigi/binfmt --install all
```

```
docker run --platform linux/amd64 -d -p 19132:19132/udp --name minecraft_bedrock_server projectscache/minecraft_bedrock_server:latest
```