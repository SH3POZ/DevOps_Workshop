# Hands-on Kubernetes-08 : Deploying Node.js Application in Kubernetes
 

Purpose of the this hands-on training is to teach the students how to Deploying Node.js Application in Kubernetes 

## Learning Outcomes

At the end of the this hands-on training, students will be able to;

-  Configure App.mjs

-  Configure Docker File 

-  Create Deployment

- Note 


# Outline
- Part 1 -   Configure App.mjs

- Part 2 -   Configure Docker File 

- Part 3 -   Create Deployment

- Part 4 - Note 


# Part 1 - Configure App.mjs

- Configure Node.js Application 

```bash
npm init -y

```

```bash
npm install express
```
- crate new file name index.mjs

```bash
import Express from 'express'
import os from 'os'


const app = express()
const PORT = 3000

app.get("/", (req,res)=>{
     const message = ` Hi Hassan Im Pod ${os.hostname()}`
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
docker build . -t sh3poz/k8s-web-server
```
- push docker image to docker hub 

```bash
docker push sh3poz/k8s-web-server
```

# Part 3 - Create Deployment 

- Create web-server deployment

```bash
kubctl create deployment k8s-web-server --image=sh3poz/k8s-web-server
```
- exopse deployment 

```bash
kubectl expose deployment k8s-web-server --port=3000
```

 
- scale 

```bash
kubectl scale deployment k8s-web-server --replicas=6
```

-exsses te pods

```bash
kubectl get pods -o wide
```

```bash
minikube ssh 
```

```bash
curl 10.244.0.42:3000
```
- Deleate k8s-web-server service

```bash
kubectl delete service k8s-web-serve
```

-exopse deployment again

```bash
kubectl expose deployment k8s-web-server --type=NodePort --port=3000
```
-show the app 

```bash
minikube service k8s-web-server 
```

# Part 4 - Note

- Types of Services :-
1- Culsetr IP --> the default value all pods they can request togezet intenal 
2- node Port --> you can accessible each node in clusetr though static port from outside
3- LoadBalancer --> you can accessible each node in clusetr though Cloud from outside
4- ExternlName --> you can accessible each node in clusetr though Alias its lik DNS from outside
5- Ingress --> its not service but it as entry point for the cluster you can accessible multiple services under the same IP address