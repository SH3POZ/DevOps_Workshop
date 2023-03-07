# Hands-on Docker-03 : Run Docker Container-Multi-Stage (Dev,Prod) Docker File without used nodemon ,
Purpose of the this hands-on training is to teach the students how to Run Docker Container-Multi-Stage (Dev,Prod) by Docker_File we can do this it throgh 2 way

## Learning Outcomes

At the end of the this hands-on training, students will be able to;

- Configure Docker_File Multi-Stage(Dev,Prod)

- Configure Docker Container-Multi-Stage (Dev,Prod)

- Configure Environment  Variables

# Outline
- Part 1 - Configure Docker_compose  (Dev,Prod)

- Part 2 - Create & Configure Docker File 

- Part 3 - Configure Environment  Variables

- Part 4 - Run simple web app
 

# Part 1 - Configure Docker_compose Multi-Stage  (Dev,Prod)

- First way  :-- 

- add 2 line in docker-Compose (Dev,Prod)

-Dev :-
```bash

version: "3"
services:
  node-app:
    build: 
      context: .
      args:
        - NODE_ENV=devlopment
    volumes:
      - C:\Users\Hassan\Desktop\node-app\source:/app/source:ro
    environment:
      - NODE_ENV=devlopment 
    command: npm run start-dev
```
-Prod :-
```bash
version: "3"
services:
  node-app:
    build: 
      context: .
      args:
        - NODE_ENV=production
    environment:
      - NODE_ENV=production
    command: npm start
```
## Part 2 - Create & Configure Docker File  
- add 2 line in docker file 
```bash

FROM node:14

WORKDIR /app

COPY package.json .

ARG NODE_ENV

RUN if ["$NODE_ENV" = "production" ]; \
    then npm install --only=production; \
    else npm install; \
    fi
    
RUN npm install

ENV PORT=4000

COPY . .

EXPOSE ${PORT}

CMD [ "npm","run", "start-dev" ]

```
```bash
 run docker-compose -f docker-compose.yml -f docker-compose.prod.yml up -d --build 

```
- Pic 1

![Apache HTTP Server](./ALB.png)

```bash
 docker-compose -f docker-compose.yml -f docker-compose.prod.yml down
```



```bash
run docker-compose -f docker-compose.yml -f docker-compose.dev.yml up -d --build 
```
- Pic 2



## Second way :- Multi Statge 
 - Configure docker file 
 
```bash
FROM node:14 as base

FROM base as development

WORKDIR /app
COPY package.json .
ARG NODE_ENV
RUN npm install
ENV PORT=4000
COPY . .
EXPOSE ${PORT}
CMD [ "npm","run", "start-dev" ]

FROM base as production

WORKDIR /app
COPY package.json .
ARG NODE_ENV
RUN npm install --only=production
ENV PORT=4000
COPY . .
EXPOSE ${PORT}
CMD [ "npm", "start" ]

```

- Configure docker-compose both (dev&prod)

1- Prod 

```bash
version: "3"
services:
  node-app:
    build: 
      context: .
      target: production
    environment:
      - NODE_ENV=production
    command: npm start

```
    
2- dev

```bash
version: "3"
services:
  node-app:
    build: 
      context: .
      target: development
    volumes:
      - C:\Users\Hassan\Desktop\node-app\source:/app/source:ro
    environment:
      - NODE_ENV=development 
    command: npm run start-dev

```
#  Part 3 - Configure Environment  Variables
  - open index .js 
  ```bash
  const express = require('express');

//init app
const PORT = process.env.PORT || 4000;;
const app = express (); 

app.get('/', (req, res) => res.send('<h1> Hi Sh3poz<h1>'));

app.listen(PORT, () => console.log('Hi its working Fine on port: ${PORT}'));
```
  
 # Part 4 - Run simple web app 
 ```bash 
 run docker-compose -f docker-compose-main.yml -f docker-compose.dev.yml up -d
```

