# Hands-on Docker-11 :Setup Automate Docker Deployment ( Watchtower )( Means we need deploy Automate new image to app in EC2 Instance ) 
 

Purpose of the this hands-on training is to teach the students how to Setup Setup Automate Docker Deployment ( Watchtower )(Means we need deploy Automate new image to app in EC2 Instance ) 

## Learning Outcomes

At the end of the this hands-on training, students will be able to;

- Configure Docker Watchtower in EC2 Instance

- Configure new Docker image in local PC 

- Result


# Outline
- Part 1 - Configure Docker Watchtower in EC2 Instance

- Part 2 - Configure new Docker image in local PC 

- Part 3 - Result


# Part 1 - Configure Docker Watchtower in EC2 Instanc

We will choose specific continer to Automate the new docker image ( App-06 ) , the poll interval it will be 30 second ..

- Open EC2 Instance run commend 

```bash
docker run -d --name watchtower -e WATCHTOWER_TRACE_TRACE=true -e WATCHTOWER_POLL_INTERVAL=30 -v /var/run/docker.sock:/var/run/docker.sock containrrr/watchtower app-06
```
- Check the continer created 

```bash
docker ps
```
- Follow logs

```bash
docker logs  watchtower -f
```

# Part 2 - Configure new Docker image in local PC

- Rebulid new Docker image in local PC   

```bash
docker-compose -f docker-compose.yml -f docker-compose.prod.yml build
```
- Push image from local to git hub

```bash
docker-compose -f docker-compose.yml -f docker-compose.Prod.yml push node-app
```

# Part 3 - Result

- Check the Follow logs

![wqdq](https://user-images.githubusercontent.com/111190149/229323813-2436c4ae-abfd-4b7b-b91a-6ed2376939a6.jpg)


- open your browser to check

![qf](https://user-images.githubusercontent.com/111190149/229323848-a0b5498b-fdab-43cf-abfe-cbc6e0afca55.jpg)


