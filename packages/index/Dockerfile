FROM leverj/nodejs:v10.16.0
COPY src ./dist/src
COPY ["package.json","yarn.lock","./dist/"]
RUN apt-get update && \
    apt-get install -y curl git && \
    cd dist && npm install -g yarn && \
    yarn install && \
    useradd leverj && \
    apt-get remove -y curl git && \
    rm -rf /var/lib/apt/lists/* && \
    echo "done"
#USER leverj
WORKDIR dist
EXPOSE 11090
CMD node src/service.js

