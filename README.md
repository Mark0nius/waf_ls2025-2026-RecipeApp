## Ollama (AI shopping list categorization)

The shopping list page automatically groups ingredients into store sections (Produce, Dairy, Meat & Fish, etc.) using a local Ollama model.

1. Download and install Ollama from https://ollama.com/download
2. Pull the model (one-time):
```
ollama pull gemma3
```
3. Ollama starts automatically in the background after installation. If it is not running, start it with:
```
ollama serve
```

The feature degrades gracefully — if Ollama is not running, the shopping list falls back to a flat (uncategorized) view with no error shown.

**Optional env vars** (add to `.env.local` to override defaults):
```
OLLAMA_BASE_URL=http://localhost:11434   # default
OLLAMA_MODEL=gemma3                      # default; also works with llama3.2, granite3.3
```

---

## how to run

cd .\frontendprojekt\

npm i
npm install zustand
npm install jspdf
npx auth secret
npm install next-auth@beta

npm install dotenv
npm install prisma --save-dev
npm install @prisma/client @auth/prisma-adapter
npx prisma init
npm install @prisma/client pg @prisma/adapter-pg
npm install --save-dev @types/pg

npx prisma db push

//pokud nejede npx prisma generate

npm approve-scripts @prisma/engines
npm approve-scripts prisma
npm approve-scripts sharp
npm approve-scripts unrs-resolver
npm approve-scripts core-js
npm approve-scripts msw

npm run dev

---

## Schema changes (run after pulling updates)

### Added `category` column to the `Favorite` table (personalized category ordering)

If you already have the database set up, re-run:
```
npx prisma db push
npx prisma generate
```

//playwright
npm install -D @playwright/test

npm run test:e2e            Spustí Next na portu 3100, počká až stránka běží, pustí Playwright testy.
npm run test:e2e:headed     Spustí testy s viditelným browserem.
npm run test:e2e:ui         Spustí Playwright UI.

npm run test:e2e  všechny testy

npm run test:e2e:home
npm run test:e2e:category
npm run test:e2e:search
npm run test:e2e:recipe
npm run test:e2e:ingredients
npm run test:e2e:nutrients
npm run test:e2e:favorites
npm run test:e2e:shopping-list
npm run test:e2e:profile