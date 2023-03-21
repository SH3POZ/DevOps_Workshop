# Hands-on Docker-05 : Run Docker with Redis (Means store your data in memory )
Purpose of the this hands-on training is to teach the students how to Run Docker with  Redis (Means store your data in memory )

## Learning Outcomes

At the end of the this hands-on training, students will be able to;

- Configure Docker_compose File 

- Configure Redis

- Configure index.js

- Configure Depends_on


# Outline
- Part 1 - Create & Configure Docker Compose File 

- Part 2 - Configure Redis

- Part 3 - Configure index.js

- Part 4 - Configure Depends_on

# Part 1 - Configure Docker_compose File

- open docker hub --> search Redis--> under start Redis-->    
```bash
docker run --name some-Redis -d Redis
```
- add service in docker compos.
```bash
redis:
    image: redis
```
# Part 2 - Configure Redis

```bash
- npm i Redis 
```
                                                          
# Part 3 - Configure index.js

- open google search--> Redis NodeJS --> under Basic Example--> $ copy the code to index.js

```bash
const redis = require('redis');

// connect to redis
const REDIS_PORT =6379;
const REDIS_HOST = 'redis';

const redisClient = redis.createClient({
  url: `redis://${REDIS_HOST}:${REDIS_PORT}`,
});
redisClient.on('error', (err) => console.log('Redis Client Error', err));
redisClient.on('connect', () => console.log('Connected to Redis'));
redisClient.connect();
```
- run docker compose .
```bash
docker-compose -f docker-compose.yml -f docker-compose.dev.yml up -d --build
```
- result to check 

```bash
docker logs app-06 -f
```

![afasfasf](https://user-images.githubusercontent.com/111190149/226755748-ddb98dbc-f45c-43b5-a0a9-0fc5c635d361.jpg)



- EX-->
 We will add to the code ..

```bash
app.get('/', (req, res) => { 
 redisClient.set('products', 'products...');
    res.send('<h1> Hi Hassan<h1>');
});

app.get('/data', async (req, res) => { 
  const products =await redisClient.get('products');
  res.send(`<h1> Hi Hassan<h1> <h2>{products}</h2>`);
   });
```
- run docker compose .
```bash
docker-compose -f docker-compose.yml -f docker-compose.dev.yml up -d --build
```

- Final Result  ..


![asdsd](https://user-images.githubusercontent.com/111190149/226756170-273c9fdf-ee4c-4523-9405-8f37879eb798.jpg)
![dsadsad](https://user-images.githubusercontent.com/111190149/226756185-7c0762c4-cd38-4fa9-925f-f1e8225dd0c8.jpg)

# Part 4 - Configure Depends_on

- note: - if we need reschedule container run we will used depends on under app container we will add new line ..

```bash
depends on:
  - service Name
```



