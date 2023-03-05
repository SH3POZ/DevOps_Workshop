Hands-on Docker-02 : Run Docker Container-Multi-Stage (Dev,Prod) by Docker_compose
Purpose of the this hands-on training is to teach the students how to Run Docker Container-Multi-Stage (Dev,Prod) by Docker_compose.

Learning Outcomes
At the end of the this hands-on training, students will be able to;

configure Docker_compose File (Dev,Prod)

Run Docker Container-Multi-Stage (Dev,Prod)

configure Enviroment Variables

Outline
Part 1 - Create & Configure 3 Docker Compose File (Dev,Prod,main)

Part 2 - configure Enviroment Variables

Part 3 - Run simple web app

Part 1 - Create docker-Compose.yml.

Connect to your visual-studio-code.
1-create docker-Compose.yml  under node-app file 

version: "3"
services:
  node-app:
    container_name: app-06
    build: .
    volumes:
      - C:\Users\Hassan\Desktop\node-app\source:/app/source:ro
    ports:
      - "4000:4000"

Part 2 - We will Create 3 Docker Compose File (Dev,Prod)

- Create  Docker_compmse.dev.yml

version: "3"
services:
  node-app:
    volumes:
      - C:\Users\Hassan\Desktop\node-app\source:/app/source:ro
    environment:
      - NODE_ENV=devlopment 

                                                          
 - Create Docker_compmse.prod.yml
 
version: "3"
services:
  node-app:
    environment:
      - NODE_ENV=prodaction
      
 - Create Docker_compmse-.main.yml  
 
version: "3"
services:
  node-app:
    container_name: app-06
    build: .
    ports:
      - "4000:4000"
    env_file:
      - C:\Users\Hassan\Desktop\node-app\.env
      
      
  Part 2 - configure Enviroment Variables
  - open index .js 
  
  const express = require('express');

//init app
const PORT = process.env.PORT || 4000;;
const app = express (); 

app.get('/', (req, res) => res.send('<h1> Hi Sh3poz<h1>'));

app.listen(PORT, () => console.log('Hi its working Fine on port: ${PORT}'));

  
  Part 3 - Run simple web app 
  
 run docker-compose -f docker-compose-main.yml -f docker-compose.dev.yml up -d
