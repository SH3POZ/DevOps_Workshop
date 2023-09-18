# Hands-on Docker-10 :Setup Load balancing With Nginx And Docker 
 

Purpose of the this hands-on training is to teach the students how to Setup Load balancing With Nginx And Docker ) 

## Learning Outcomes

At the end of the this hands-on training, students will be able to;

- Configure Docker Compose File

- Configure index.jss

- Result


# Outline
- Part 1 - Configure Docker Compose File

- Part 2 - Configure index.jss

- Part 3 - Result 


# Part 1 - Configure Docker Compose File

- Remove container name for which service you want to scale from docker compose  

- Remove Port Number for which service you want to scale from docker compose

# Part 2 - Part 2 - Configure index.jss
  
- We Create log message inside index.js

```bash
       const os = ('os')
```
```bash
      console.log(`traffic from ${os.hostname}`);
```
 
# Part 3 - Result

- run
```bash
docker-compose -f docker-compose.yml -f docker-compose.prod.yml  up  --scale node-app=3
```


![vxv](https://user-images.githubusercontent.com/111190149/229319534-fda47f67-f492-4311-9ee6-26cc3402f356.jpg)

- Try to open http://localhost:8080/

![qwqqe](https://user-images.githubusercontent.com/111190149/229319554-ee959207-7b20-4020-8513-a8448851caa7.jpg)
