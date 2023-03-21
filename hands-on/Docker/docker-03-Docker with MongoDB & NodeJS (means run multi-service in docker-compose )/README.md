# Hands-on Docker-03 : Run Docker with MongoDB & NodeJS (means run multi-service in docker-compose )
Purpose of the this hands-on training is to teach the students how to Run Docker with MongoDB & NodeJS (means run multi-service in docker-compose ).


## Learning Outcomes

At the end of the this hands-on training, students will be able to;

- Configure Docker_compose File 

- Configure MongoDB 

- Configure index.js & connect with MongoDB

# Outline
- Part 1 - Create & Configure Docker Compose File 

- Part 2 - Configure MongoDB 

- Part 3 - Configure index.js & connect with MongoDB

# Part 1 - Configure Docker_compose File

- First open docker hub --> search mongo DB --> under via docker stack deploy --> copy instructions -- > past to docker compose  
```bash
version: "3"
services:
  node-app:
    container_name: app-06
    volumes:
      - C:\Users\Hassan\Desktop\node-app\source:/app/source:ro
    ports:
      - "4000:4000"
    env_file:
      - C:\Users\Hassan\Desktop\node-app\.env
  mongo:
    image: mongo
    restart: always
    environment:
      MONGO_INITDB_ROOT_USERNAME: root
      MONGO_INITDB_ROOT_PASSWORD: example
```
- Run npm i mongoose 

# Part 2 - Configure MongoDB

```bash
- Run npm i mongoose  
```
                                                          
      
#  Part 3 - Configure index.js & connect with MongoDB

- To connect mangodDB with Nodejs we will open chrome -->google--> install mongoose 

![asa](https://user-images.githubusercontent.com/111190149/224552246-0f1ad41f-3058-4397-ad93-2c5f30fb0199.jpg)

- open index.js and add lines for mongoose DB 

```bash
const express = require('express');
const mongoose = require('mongoose')

//init app
const PORT = process.env.PORT || 4000;;
const app = express (); 

// connect db
const DB_USER= 'root';
const DB_PASSWORD = 'example';
const DB_PORT = 27017;
const DB_HOST = '172.19.0.2'

const URI= `mongodb://${DB_USER}:${DB_PASSWORD}@${DB_HOST}:${DB_PORT}`;
mongoose
.connect(URI)
.then(() => console.log('connect to db ...'))
.catch((err) => console.log('faild to connect to dp: ', err));

app.listen(PORT, () => console.log('Hi its working Fine on port: ${PORT}'));
```
- Final Result 


![asdd](https://user-images.githubusercontent.com/111190149/224552570-3aebec32-a1ff-4eb3-8f3c-7cc28320ea79.jpg)

# Note 

- The previous way the IP may be changed every time , so if you want to fixed the IP you will  used name of services in DB_HOST 

```bash

// connect db
const DB_USER= 'root';
const DB_PASSWORD = 'example';
const DB_PORT = 27017;
const DB_HOST = 'mongo'

```
