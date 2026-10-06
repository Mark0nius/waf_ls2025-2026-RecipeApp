FROM node:22-alpine AS base

# ── Stage 1: install dependencies ──────────────────────────────────────────
FROM base AS deps
RUN apk add --no-cache libc6-compat
WORKDIR /app

COPY package.json package-lock.json* ./
COPY prisma ./prisma
RUN npm ci

# ── Stage 2: build ─────────────────────────────────────────────────────────
FROM base AS builder
WORKDIR /app

COPY --from=deps /app/node_modules ./node_modules
COPY . .

# NEXT_PUBLIC_ vars are inlined at build time — pass your key here
ARG NEXT_PUBLIC_MEALDB_API_KEY
ENV NEXT_PUBLIC_MEALDB_API_KEY=$NEXT_PUBLIC_MEALDB_API_KEY

# Auth secrets are only needed at runtime; a placeholder keeps the build valid
ENV AUTH_SECRET=placeholder
ENV AUTH_GOOGLE_ID=placeholder
ENV AUTH_GOOGLE_SECRET=placeholder
ENV AUTH_FACEBOOK_ID=placeholder
ENV AUTH_FACEBOOK_SECRET=placeholder

RUN npm run build

# ── Stage 3: minimal runtime image ─────────────────────────────────────────
FROM base AS runner
WORKDIR /app

ENV NODE_ENV=production
ENV PORT=3000
ENV HOSTNAME=0.0.0.0

RUN addgroup --system --gid 1001 nodejs && \
    adduser  --system --uid 1001 nextjs

COPY --from=builder /app/public ./public

COPY --from=builder --chown=nextjs:nodejs /app/.next/standalone ./
COPY --from=builder --chown=nextjs:nodejs /app/.next/static ./.next/static

USER nextjs

EXPOSE 3000

# Runtime secrets — pass these via -e flags or docker-compose environment:
#   AUTH_SECRET, AUTH_GOOGLE_ID, AUTH_GOOGLE_SECRET,
#   AUTH_FACEBOOK_ID, AUTH_FACEBOOK_SECRET
CMD ["node", "server.js"]
