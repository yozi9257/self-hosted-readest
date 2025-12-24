#!/bin/sh

_main() {
    pnpm config set registry https://registry.npmmirror.com
    cd /app && pnpm install --production && cd -
    cd /app/apps/readest-app
    exec pnpm start-web
}

_main "$@"


