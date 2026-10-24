FROM --platform=linux/amd64 debian:latest

WORKDIR /minecraft_server

RUN apt-get update && apt-get install -y \
    wget \
    jq \
    unzip \
    libcurl4 \
    && rm -rf /var/lib/apt/lists/*
RUN wget --output-document=download_urls.json https://net-secondary.web.minecraft-services.net/api/v1.0/download/links
RUN wget --output-document=server.zip $(jq -r '.result.links[] | select(.downloadType == "serverBedrockLinux").downloadUrl' download_urls.json)
RUN unzip server.zip
RUN chmod +x bedrock_server

EXPOSE 19132/udp

ENV LD_LIBRARY_PATH=.
CMD ./bedrock_server