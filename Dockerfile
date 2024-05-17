FROM ghcr.io/qtvhao/debian:main

COPY package.json yarn.lock /app/
RUN . venv/bin/activate && . $HOME/.nvm/nvm.sh && yarn install --no-cache
