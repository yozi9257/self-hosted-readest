FROM node:22-alpine

ENV PNPM_HOME="/root/.local/share/pnpm"
ENV PATH="${PATH}:${PNPM_HOME}"
ENV NODE_ENV=production
ENV NEXT_TELEMETRY_DISABLED=1

WORKDIR /app

RUN npm install -g pnpm

COPY readest/package*.json ./
COPY readest/pnpm-*.yaml ./
COPY readest/packages ./packages

COPY readest/apps/readest-app/package*.json ./apps/readest-app/
COPY readest/apps/readest-app/.env* ./apps/readest-app/
COPY readest/apps/readest-app/next.config.mjs ./apps/readest-app/
COPY readest/apps/readest-app/public ./apps/readest-app/public

RUN pnpm install --production

COPY readest/apps/readest-app/.next ./apps/readest-app/.next

WORKDIR /app/apps/readest-app

ENTRYPOINT ["pnpm", "start-web"]