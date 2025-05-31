FROM node:18-alpine
WORKDIR /app
COPY package.json .
COPY vite.config.js .
COPY tailwind.config.js .
COPY postcss.config.js .
COPY index.html index.html
COPY src src
RUN npm install --legacy-peer-deps && npm run build
CMD ["npm", "run", "preview", "--", "--host", "0.0.0.0"]
