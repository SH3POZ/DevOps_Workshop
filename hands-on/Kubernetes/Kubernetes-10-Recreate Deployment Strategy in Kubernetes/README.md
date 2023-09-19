# Hands-on Kubernetes-10 : Recreate Deployment Strategy in Kubernetes
 

Purpose of the this hands-on training is to teach the students how to Recreate the Deployment Strategy in Kubernetes 

## Learning Outcomes

At the end of  this hands-on training, students will be able to;

-  Configure Index.js

-  Configure Docker File 

-  Recreate Deployment Strategy

-  Recreate Deployment Strategy V2   

-  Check the result  


# Outline
- Part 1 -   Configure App.js

- Part 2 -   Configure Docker File 

- Part 3 -   Recreate Deployment Strategy V1

- Part 4 - Recreate Deployment Strategy V2  

- Part 5 - Check the result    


# Part 1 - Configure Index.js  

- crate new file name index.js 

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

- Create a Docke file    

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
- Build a docke image 

```bash
docker build . -t sh3poz/k8s-web-server:1.2.0
```
- push docker image to docker hub 

```bash
docker push sh3poz/k8s-web-server:1.2.0
```

# Part 3 - Recreate Deployment Strategy V1

- Create Recreate deployment

```bash
kubectl apply -f deployment.yaml
```
- check the podes it created 

```bash
kubectl get all 
```
 
- crate the service 

```bash
kubectl apply -f service.yaml
```

```
-show the app link 

```bash
minikube service recreate-service
```

# Part 4 - Recreate Deployment Strategy V2

- open deployment.yaml to change  the version

```bash
spec:
      containers:
      - name: helloserver
        image: sh3poz/k8s-web-server:1.2.0
```
- crate bew Deployment 

```bash
kubectl apply -f deployment.yml
```
-check

```bash
kubectl get po
```

- crate New Deployment 

```bash
kubectl apply -f deployment.yml
```



# Part 5 - Check the result

- Show the app link 

```bash
minikube service recreate-service
```