# Hands-on Docker-04 : Run Docker with Mongo-Express (means how we will save date in DB container if we close or delete same DB Container ) 2 way
Purpose of the this hands-on training is to teach the students how to Run Docker with Mongo-Express (means how we will save date in DB container if we close or delete same DB Container ).


## Learning Outcomes

At the end of the this hands-on training, students will be able to;

- Configure Docker_compose File 

- Configure MongoDB

- Configure DB

- Configure Mongo-Express

# Outline
- Part 1 - Create & Configure Docker Compose File 

- Part 2 - Configure MongoDB

- Part 3 - Configure DB

- Part 3 - Configure Mongo-Express 

#  First Way :-
# Part 1 - Configure Docker_compose File

- open docker hub --> search mongo DB --> under via  docker-compose or docker stack deploy--> copy new service mongo-express  
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
	    volumes:
	      - mongo-db:/data/db
	    environment:
	      MONGO_INITDB_ROOT_USERNAME: root
	      MONGO_INITDB_ROOT_PASSWORD: example
	
  	volumes:
	   mongo-db:

```
- Run docker compose . 
```bash
docker-compose -f docker-compose.yml -f docker-compose.dev.yml up -d
```

# Part 2 - Configure MongoDB

```bash
- Run npm i mongoose  
```
                                                          
# Part 3 - Configure DB

- open DB container

```bash
docker exec -it node-app-mongo-1 mongosh -u root -p example
```
- add DB

```bash
Use test
```
- add data inside DB

```bash
db.books.insert({ title: "book 1")}
```
- Close the container 

```bash
docker-compose -f docker-compose.yml -f docker-compose.dev.yml down
```

- Final Result we will found the DB Volume still there ..

![qwd](https://user-images.githubusercontent.com/111190149/226538423-c7dc9a13-f5a5-4132-a554-37e54190032b.jpg)


#  Second Way :-
#  Part 3 - Configure Mongo-Express 

-  open docker hub --> search mangoDB --> under via  docker-compose or docker stack deploy--> copy new service mongo-express--> past inside the docker comopse 


```bash
	mongo-express:
	    image: mongo-express
	    restart: always
	    ports:
	      - 8081:8081
	    environment:
	      ME_CONFIG_MONGODB_ADMINUSERNAME: root
	      ME_CONFIG_MONGODB_ADMINPASSWORD: example
	      ME_CONFIG_MONGODB_URL: mongodb://root:example@mongo:27017/
```
- run docker compose .
```bash
docker-compose -f docker-compose.yml -f docker-compose.dev.yml up -d
```


- Final Result we can access GUI console for DB Volume .


![dqwwqw](https://user-images.githubusercontent.com/111190149/226539164-d2939038-bc3b-40ae-b277-83c0fe2f8acb.jpg)




