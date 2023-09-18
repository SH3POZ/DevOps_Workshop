# Hands-on Docker-07 :Run Docker with PostgresSQL 

Purpose of the this hands-on training is to teach the students how to Run Docker with PostgresSQL 

## Learning Outcomes

At the end of the this hands-on training, students will be able to;

- Configure Docker_compose File 

- Configure PostgresSQL

- Configure index.js File with PostgresSQL

- Result 


# Outline
- Part 1 - Create & Configure Docker Compose File 

- Part 2 - Configure PostgresSQL

- Part 3 - Configure index.js File with PostgresSQL

- Part 4 - Result

# Part 1 - Configure Docker_compose File

- open docker hub --> search PostgreSQL> under Using environment variables in PostgreSQL configuration --> copy new service PostgreSQL    

- add service in docker compos.
```bash
  postgres:
    image: postgres
    restart: always
    volumes:
      - postgres-dp:/var/lib/postgresql/data
    environment:
      POSTGRES_USER: root
      POSTGRES_PASSWORD: example
```
- add now volume
```bash
 volumes:
   postgres-dp:
```    
# Part 2 - Configure PostgresSQL

- Run Commend  

```bash
npm install pg 
```
                                                          
# Part 3 - Configure index.js File with PostgresSQL

- open https://node-postgres.com/features/connecting --> under Connection URI copy code 

![afe](https://user-images.githubusercontent.com/111190149/228690483-aa7937ba-fa6b-4c80-a984-e680c9b6ef23.jpg)

- add in index.js 
```bash
const {client} = require('pg');
```
```bash
// connect db
const DB_USER= 'root';
const DB_PASSWORD = 'example';
const DB_PORT = 5432;
const DB_HOST = 'postgres';

const URI= `postgresql://${DB_USER}:${DB_PASSWORD}@${DB_HOST}:${DB_PORT}`;
const client = new Client({
 connectionString: URI,
});
client
.connect()
.then(() => console.log('connect to postgres db ...'))
.catch((err) => console.log('faild to connect to postgres dp: ', err));
```

- Run Commend 
```bash
docker-compose -f docker-compose.yml -f docker-compose.dev.yml up -d --build
```
# Part 4 - Result to check 

![qwrqwr](https://user-images.githubusercontent.com/111190149/228690638-ca63523a-90aa-47cb-9fc5-c9997bc6215a.jpg)


