FROM node:22-alpine3.23

ENV NEXT_TELEMETRY_DISABLED=1

RUN npm install @dotenvx/dotenvx -g

WORKDIR /app

# readest-web 为readest web nextjs standalone模式构建产物，包括了public和static
COPY readest/apps/readest-app/readest-web ./

WORKDIR /app/apps/readest-app

EXPOSE 3000

CMD ["dotenvx", "run", "--env-file=.env.web",  "--", "node", "server.js"]
