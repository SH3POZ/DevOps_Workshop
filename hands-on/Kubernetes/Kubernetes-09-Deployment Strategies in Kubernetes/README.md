# Hands-on Kubernetes-09: Deployment Strategies in Kubernetes
 

Purpose of the this hands-on training is to teach the students how to Deployment Strategies in Kubernetes 

## Learning Outcomes

At the end of this hands-on training, students will be able to;

-  Configure Index.mjs

-  Configure Docker File 

-  Create Deployment

-  Result 

-  Note 


# Outline
- Part 1 -   Configure App.mjs

- Part 2 -   Configure Docker File 

- Part 3 -   Create Deployment

- Part 4 - Result  

- Part 5 - Note  


# Part 1 - Configure Index.mjs 

- Create a new file name index.mjs

```bash
import Express from 'express'
import os from 'os'


const app = express()
const PORT = 3000

app.get("/", (req,res)=>{
     const message = ` Hi Hassan Im Pod ${os.hostname()} : Version 1.2.0`
     res.send(message)
})

app.listen(PORT, ()=>{
    console.log(`Web Server is listening at port ${PORT}`)
    console.log(os.hostname())
})
```

# Part 2 - Configure Docker File

- Create a Docker file    

```bash
FROM node:alpine

WORKDIR /app

EXPOSE 3000

COPY package.json package-lock.json ./

RUN npm install

COPY . ./

CMD [ "npm", "start" ]
```

- Open package.json change 

```bash
"scripts": {
    "test": "echo \"Error: no test specified\" && exit 1"
To

  "scripts": {
    "start": "node index.mjs"```
- To check the service 

```bash
npm start
```
- Build a docker image 

```bash
docker build . -t sh3poz/k8s-web-server:1.2.0
```
- push docker image to docker hub 

```bash
docker push sh3poz/k8s-web-server:1.2.0
```

# Part 3 - Create Deployment 

- Create a web-server deployment

```bash
kubectl set image deploy k8s-web-server k8s-web-server=sh3poz/k8s-web-server:1.2.0
```
- expose deployment 

```bash
kubectl expose deployment k8s-web-server --port=3000
```
 
- scale 

```bash
kubectl scale deployment k8s-web-server --replicas=6
```

```
-show the app 

```bash
kubectl rollout status deployment/k8s-web-server 
```
![1](https://github.com/SH3POZ/DevOps_Workshop/assets/111190149/ce865cd7-dae3-4d15-9901-20ef57c36093)

# Part 4 - Note

```bash
minikube service k8s-web-server
```
![3](https://github.com/SH3POZ/DevOps_Workshop/assets/111190149/3e1995b3-da3e-4457-9ed2-ecd0f71e02b4)


# Part 5 - Note

- Types of deployment strategies:-

1- Rolling Update Deployment --> Its default Deployment Strategy its update pods by podes or one by one without downtime... but the performance will be a reduction 

2- Recreate Update Deployment --> its shutdown all old podes then replace the new pods then up again 

3- Canary Update Deployment --> its crate only 25% new pods to test and kept the old pods, so few users working on the new pods and testing them and some users still working with the old pods, so if no bugs we can scale up but if we have bugs we can rollback  the old pods

A- Maxsurge --> means the maximum number or percentage of pods above the specified number of replicas 
B- maxUnavailable --> means declares the maximum number or percentage of unavailable pods during the update
