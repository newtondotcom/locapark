FROM node:18-alpine

LABEL Developers="Robin Augereau"

WORKDIR /app

COPY --chown=node:node . .

# RUN npm ci
#RUN npm install --production
RUN npm install
RUN npm run build

RUN rm -rf src/ static/ Dockerfile

USER node:node

EXPOSE 3000

CMD ["node","build/index.js"]