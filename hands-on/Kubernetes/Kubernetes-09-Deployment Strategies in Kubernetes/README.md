# Hands-on Kubernetes-09 : Deployment Strategies in Kubernetes
 

Purpose of the this hands-on training is to teach the students how to Deployment Strategies in Kubernetes 

## Learning Outcomes

At the end of the this hands-on training, students will be able to;

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

- crate new file name index.mjs

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

- Cerate Docker file    

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
- Bulid docker image 

```bash
docker build . -t sh3poz/k8s-web-server:1.2.0
```
- push docker image to docker hub 

```bash
docker push sh3poz/k8s-web-server:1.2.0
```

# Part 3 - Create Deployment 

- Create web-server deployment

```bash
kubectl set image deploy k8s-web-server k8s-web-server=sh3poz/k8s-web-server:1.2.0
```
- exopse deployment 

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

# Part 4 - Note

```bash
minikube service k8s-web-server
```


# Part 5 - Note

- Types of deployment strategies :-
1- Rolling Update Deployment --> the default value all pods they can request togezet intenal 
2- Recreate Update Deployment --> you can accessible each node in clusetr though static port from outside
3- Canary Update Deployment --> you can accessible each node in clusetr though Cloud from outside

A- Maxsurge --> means maximum number or percentage of pods above spacified number of replicas 
B- maxUnavailable --> means declares th maximum number pr precentage of unavailable pods during the update