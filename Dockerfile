FROM node:22-alpine3.23

ENV NEXT_TELEMETRY_DISABLED=1

# 本Dockerfile仅用于运行环境,要求本地已完成web的构建
WORKDIR /app

COPY readest/apps/readest-app/readest-web ./

WORKDIR /app/apps/readest-app

EXPOSE 3000

CMD ["node", "server.js"]
