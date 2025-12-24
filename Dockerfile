FROM node:22-alpine3.23

ENV NEXT_TELEMETRY_DISABLED=1

RUN npm install @dotenvx/dotenvx -g

WORKDIR /app

# readest-web 为readest web nextjs standalone模式构建产物，包括了public和static
ADD Readest-web.tar.gz ./

WORKDIR /app/readest-web/apps/readest-app

# 覆盖/app/readest-web/apps/readest-app/.env.web 以调整配置
# COPY .env.web /app/readest-web/apps/readest-app/

EXPOSE 3000

CMD ["dotenvx", "run", "--env-file=.env.web",  "--", "node", "server.js"]
