FROM ghcr.io/qtvhao/debian-smb:main as base

ENV NODE_BINARY_URL https://nodejs.org/dist/v20.13.1/node-v20.13.1-linux-x64.tar.xz
RUN apt-get update && apt-get install -y --no-install-recommends \
    xz-utils imagemagick \
    && rm -rf /var/lib/apt/lists/*; \
    set -xe; \
    curl -fsSL -o node.tar.xz "$NODE_BINARY_URL"; \
    tar -xf node.tar.xz --strip-components=1 -C /usr/local; \
    rm node.tar.xz; \
    which node; \
    which npm; \
    npm i -g yarn; \
    which yarn; \
    yarn --version
COPY package.json yarn.lock /app/
RUN yarn install --no-cache
