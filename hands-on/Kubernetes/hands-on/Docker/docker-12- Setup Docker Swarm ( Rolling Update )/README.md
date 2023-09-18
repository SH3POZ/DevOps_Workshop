# Hands-on Docker-12 :Setup Docker Swarm ( Rolling Update )
 

Purpose of the this hands-on training is to teach the students how to Setup Docker Swarm ( Rolling Update ) 

## Learning Outcomes

At the end of the this hands-on training, students will be able to;

- Configure Docker Swarm in EC2 Instance

- Configure Docker compose 

- Create image and Push in Docker Hup 

- Pull new image to EC2 Instance

- Result 

# Outline
- Part 1 - Configure Docker Swarm in EC2 Instance

- Part 2 - Configure Docker compose 

- Part 3 - Create image and Push in Docker Hup  

- Part 4 - Pull new image to EC2 Instance

- Part 5 - Result


# Part 1 - Configure Docker Swarm in EC2 Instance

- Open EC2 and run commend  

```bash
docker swarm init
```
![g4](https://user-images.githubusercontent.com/111190149/229380731-3c90015b-b288-450f-92c6-fcc092e6f331.jpg)

- Create stack 

```bash
   docker stack deploy -c docker-compose.yml -c docker-compose.Prod.yml stack-01 
   ```
   
 - Pull Image from docker hup
 
  ```bash
docker-compose -f docker-compose.yml -f docker-compose.Prod.yml pull
```

 - deploy Image to EC2 
 ```bash
docker stack deploy -c docker-compose.yml -c docker-compose.Prod.yml stack-01 
 ```
 
 -  Check how many stack i have run commend
 ```bash
   docker stack ls
```

 - Check which servics inside this stack i have run commend
  ```bash
   docker stack services stack-01
 ```
 
-  Check which container is running i have run commend
  ```bash
   docker stack ps stack-01
  ```
  
 ![gee](https://user-images.githubusercontent.com/111190149/229381874-4fdda85c-6f0c-4203-882c-9648e576859a.jpg)

    
- Result 01

![gw](https://user-images.githubusercontent.com/111190149/229381267-d9eb8ae5-436b-4eb3-a7bd-1c1060d2c990.jpg)

   
   
# Part 2 - Configure Docker compose 

- Open browser and https://docs.docker.com/compose/compose-file/compose-file-v3/ --> under deploy then add to docker compose under Noed-app services   

```bash
deploy:
      replicas: 4
      placement:
        max_replicas_per_node: 1
      update_config:
        parallelism: 2
        delay: 10s
      restart_policy:
        condition: on-failure
```
- Configure index.js New message

```bash
app.get('/data', async (req, res) => { 
  const products =await redisClient.get('products');
  res.send(`<h1> Hi man im Hassan From AWS Using Docker Hup<h1> <h2>{products}</h2>`);
   });
```
# Part 3 - Create image and Push in Docker Hup

- Rebulid new local image

```bash
docker-compose -f docker-compose.yml -f docker-compose.prod.yml build
```
- Push again new image from local to git hub

```bash
docker-compose -f docker-compose.yml -f docker-compose.Prod.yml push node-app
```

# Part 4 - Pull new image to EC2 Instance

- Open EC2 Instance and run

```bash
docker-compose -f docker-compose.yml -f docker-compose.Prod.yml pull
```
- Open director

```bash
cd DevOps_Workshop/hands-on/Docker$ cd 'docker-12- Setup Docker Swarm ( Rolling Update )'
```
- Rebulid new image 

```bash
docker stack deploy -c docker-compose.yml -c docker-compose.Prod.yml stack-01
 ```
-  Check which container is running i have run commend

  ```bash
   docker stack ps stack-01
  ```
    
 ![fqw](https://user-images.githubusercontent.com/111190149/229381765-908e034e-35c8-4aac-bb1a-1d35f9c90fe0.jpg)

    
- Part 5 - Result

![qwerq](https://user-images.githubusercontent.com/111190149/229381755-def6bbee-cedf-4309-840b-08ddc2ffc463.jpg)

 






