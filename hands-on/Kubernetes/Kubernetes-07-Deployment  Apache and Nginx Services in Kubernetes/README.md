# Hands-on Kubernetes-07 :Deployment Apache and Nginx Services in Kubernetes
 

Purpose of the this hands-on training is to teach the students how to Deployment Apache and Nginx Services in Kubernetes 

## Learning Outcomes

At the end of the this hands-on training, students will be able to;

-  Configure 2 YAML File

-  Configure Deployment

- Note 


# Outline
- Part 1 -   Configure 2 YAML File

- Part 2 -  Configure Deployment

- Part 3 - Note 


# Part 1 - Configure YAML File

- Configure Apache yml File 

```bash

 apiVersion: apps/v1
kind: Deployment
metadata:
  name: apache-deployment
  labels:
    app: webserver
spec:
  replicas: 2
  selector:
    matchLabels:
      app: webserver
  template:
    metadata:
      labels:
        app: webserver
    spec:
      containers:
      - name: apache
        image: bitnami/apache:latest
        ports:
          - containerPort: 80

```
- Configure Nginx yml File 

```bash

apiVersion: apps/v1
kind: Deployment
metadata:
  name: nginx-deployment
  labels:
    app: webserver
spec:
  replicas: 2
  selector:
    matchLabels:
      app: webserver
  template:
    metadata:
      labels:
        app: webserver
    spec:
      containers:
      - name: nginx
        image: nginx:latest
        ports:
          - containerPort: 80
```
# Part 2 - Configure Deployment

- Open VScode and run Apache    

```bash
kubctle apply -f apache-deployment.yml
```

- To Accses the apache servies

```bash
kubectl expose deployment apache-deployment --name=apache-service --type=ClusterIP --port=8090 --target-port=8080
```
![1](https://user-images.githubusercontent.com/111190149/233870211-8cd2af15-1229-4398-83d3-68cf60961082.jpg)


- To check the service 

```bash
kubectl get all
```
![2](https://user-images.githubusercontent.com/111190149/233870225-a92bb3e0-e510-4a1f-82b5-17bf439f5ef0.jpg)


- To access the app we must do a port forward

```bash
kubectl port-forward service/apache-service 8090:8080
```
![3](https://user-images.githubusercontent.com/111190149/233870238-2b76c21d-6bc2-4fc1-861b-8c2810414951.jpg)


- Result 

![4](https://user-images.githubusercontent.com/111190149/233870254-a069395c-9de2-4fad-a0d6-19d3b8022c35.jpg)


- Run Nginx

```bash
kubectl apply -f nginx-deployment.yml
```
- To check the deployment

![5](https://user-images.githubusercontent.com/111190149/233870284-a6cef498-b67d-4c71-9316-e585dcf4f8c3.jpg)


```bash
kubectl get deployment
```

- To Access the nginx service  

```bash
kubectl expose deployment nginx-deployment 
```
- to check the service 

```bash
kubectl get service
```

![6](https://user-images.githubusercontent.com/111190149/233870287-0dc0a6cb-7918-4a55-95d5-fde969453ab6.jpg)


```bash
minikube service nginx-deployment 
```

# Part 3 - Note 

- Imperative ----> We will be typing and creating the command only to run the deployment
EX..

```bash
kubectl create deployment nginx-dep --image=nginx
```

```bash
kubectl scale deployment nginx-web --replicas=3
```

 
- Declarative --> We will be typing and creating the config yml file by ourselves to run the deployment 

EX..

```bash
apiVersion: apps/v1
kind: Deployment
metadata:
  name: webserver
spec:
  replicas: 7
  selector:
    matchLabels:
      app: web
  template:
    metadata:
      labels:
        app: web
    spec:
      containers:
      - name: web
        image: nginx
        ports:
          - containerPort: 80

```
