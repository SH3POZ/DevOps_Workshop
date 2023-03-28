# Hands-on Docker-06 :Run Docker with Nginx (Means make nginx receive all requests from outside and then send them to the app )

Purpose of the this hands-on training is to teach the students how to Run Docker with Nginx Nginx (Means make nginx receive all requests from outside and then send them to the app )

## Learning Outcomes

At the end of the this hands-on training, students will be able to;

- Configure Docker_compose File 

- Configure Nginx

- Configure Docker_compose File with Nginx

- Result 


# Outline
- Part 1 - Create & Configure Docker Compose File 

- Part 2 - Configure Nginx

- Part 3 - Configure Docker_compose File with Nginx

- Part 4 - Rusalt

# Part 1 - Configure Docker_compose File

- open docker hub --> search nginx--> under Using environment variables in nginx configuration --> copy new service nginx    

- add service in docker compos.
```bash
nginx:
  image: nginx:stable-alpine
  ports:
   - "8080:80"
  depends_on:
   - node-app
```

- Run Commend 
```bash
 docker-compose -f docker-compose.yml -f docker-compose.dev.yml up -d 
```
- open chrome browser in type ( http://localhost:8080/ ) to check the nginx working or not

![asdasdqq](https://user-images.githubusercontent.com/111190149/228302201-9a2e8d57-5222-4451-8434-eae879abaf58.jpg)


# Part 2 - Configure Nginx

- create new file for nginx configuration --> then we create ( default.conf) 

```bash
server {
    listen 80;

    location / {
        proxy_set_header X-Real-IP $remote_addr;
        proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
        proxy_set_header Host $http_host;
        proxy_set_header X-NginX-Proxy true;

        proxy_pass http://node-app:4000;
        proxy_redirect off;
    }
}
 
```
                                                          
# Part 3 - Configure Docker_compose File with Nginx

- Add new volume in docker compose file under Nginx service 

```bash
volumes:
   - ./nginx/default.conf:/etc/nginx/conf.d/default.conf
```
- Run Commend 
```bash
docker-compose -f docker-compose.yml -f docker-compose.dev.yml up -d 
```
- result to check 
![photo_5843653926967164160_w](https://user-images.githubusercontent.com/111190149/228301993-2d57e585-539d-4bd3-b0fc-635a28e773fb.jpg)
![photo_5843653926967164162_w](https://user-images.githubusercontent.com/111190149/228302012-959639c7-6c00-4035-a3f7-f4c08d2beb9c.jpg)

