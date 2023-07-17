# Hands-on Kubernetes-08: Deploying Node.js Application in Kubernetes
 

Purpose of the this hands-on training is to teach the students how to Deploying Node.js Applications in Kubernetes 

## Learning Outcomes

At the end of this hands-on training, students will be able to;

-  Configure App.js

-  Configure Docker File 

-  Create Deployment

-  Note 


# Outline
- Part 1 -   Configure App.mjs

- Part 2 -   Configure Docker File 

- Part 3 -   Create Deployment

- Part 4 -   Note 


# Part 1 - Configure App.js

- Configure Node.js Application 

```bash
npm init -y

```

```bash
npm install express
```
- Create a new file name index.mjs

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
- Run

```bash
npm start
```
![1](https://user-images.githubusercontent.com/111190149/233929874-d9d50cc4-84f0-4989-994d-b00ce41b8af0.jpg)
![2](https://user-images.githubusercontent.com/111190149/233930045-94085d52-0328-4ce7-be14-5e56b90ee18e.jpg)





# Part 2 - Configure Docker File

- Create a Docker file    

```bash
FROM node: alpine

WORKDIR /app

EXPOSE 3000

COPY package.json package-lock.json ./

RUN npm install

COPY. ./

CMD [ "npm", "start" ]
```

- Open package.json and change 

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
- Build a Docker image 

```bash
docker build. -t sh3poz/k8s-web-server
```
- Push docker image to docker hub 

```bash
docker push sh3poz/k8s-web-server
```
![4](https://user-images.githubusercontent.com/111190149/233930215-114e1485-a322-4fe8-abc5-5da22ba08566.jpg)

# Part 3 - Create Deployment 

- Create a web-server deployment

```bash
kubctl create deployment k8s-web-server --image=sh3poz/k8s-web-server
```
- Expose deployment 

```bash
kubectl expose deployment k8s-web-server --port=3000
```
![6](https://user-images.githubusercontent.com/111190149/233930694-b4a7831b-4c3b-4cec-a900-21f2de9239d2.jpg)

 
- Scale Up 

```bash
kubectl scale deployment k8s-web-server --replicas=6
```
![3](https://user-images.githubusercontent.com/111190149/233930294-f103012d-720a-4c08-854b-be2e0a5d7c5c.jpg)


-Access the pods

```bash
kubectl get pods -o wide
```
![3](https://user-images.githubusercontent.com/111190149/233930533-3c32b215-6a8b-4d8e-8ee4-757a32869978.jpg)

```bash
minikube ssh 
```

```bash
curl 10.244.0.42:3000
```
![5](https://user-images.githubusercontent.com/111190149/233930361-5bb1ead6-34c4-4cb9-9463-6e7564880091.jpg)


- Delete the k8s-web-server service

```bash
kubectl delete service k8s-web-serve
```

-Expose Deployment Again

```bash
kubectl expose deployment k8s-web-server --type=NodePort --port=3000
```
![7](https://user-images.githubusercontent.com/111190149/233930761-8f7f1540-c8c5-4aa7-bdad-365fc18cc806.jpg)


-Show the app 

```bash
minikube service k8s-web-server 
```

# Part 4 - Note

- Types of Services:-

- Cluster IP --> the default value for all pods they can request togezet internal 
- Node Port --> You can access each node in the cluster through a static port from outside
- LoadBalancer --> You can access each node in Cluster through the Cloud from outside
- ExternlName --> You can access each node in the cluster through Alias its like DNS from outside
- Ingress --> It's not a service but it is an entry point for the cluster you can access multiple services under the same IP address
