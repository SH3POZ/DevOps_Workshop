# Hands-on Kubernetes-05 :Deployment Apache and Nginx Services in Kubernetes
 

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
- To check the service 

```bash
kubectl get all
```
- To accses app we must be do port forward 

```bash
kubectl port-forward service/apache-service 8090:8080
```
- Rusalt 

- Run Nginx

```bash
kubectl apply -f nginx-deployment.yml
```
- To check the deployment

```bash
kubectl get deployment
```

- To Accses the nginx servies  

```bash
kubectl expose deployment nginx-deployment 
```
- to check the service 

```bash
kubectl get service
```

```bash
minikube service nginx-deployment 
```

# Part 3 - Note 

- Imperative ---->we will typing and create the commend onle to run the deployment 
EX..

```bash
kubectl create deployment nginx-dep --image=nginx
```

```bash
kubectl scale deployment nginx-web --replicas=3
```

 
- Declarative --> we will typing and create the config yml file by ourselves to run the deployment 

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