FROM coinpit/nodejs:v10.12.0
COPY src ./dist/src
COPY config ./dist/config
COPY ["package.json","yarn.lock","./dist/"]
RUN apt-get update && \
    apt-get install -y curl git && \
    cd dist && npm install -g yarn && yarn install --frozen-lockfile && \
    useradd leverj && \
    apt-get remove -y curl git && \
    rm -rf /var/lib/apt/lists/*
#USER leverj
WORKDIR dist
