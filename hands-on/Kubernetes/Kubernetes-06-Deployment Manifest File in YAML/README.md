# Hands-on Kubernetes-05 :Deployment Manifest File in YAML
 

Purpose of the this hands-on training is to teach the students how to Deployment Manifest File in YAML 

## Learning Outcomes

At the end of the this hands-on training, students will be able to;

-  Configure YAML File

-  Configure Deployment


# Outline
- Part 1 -  Configure YAML File

- Part 2 -  Configure Deployment


# Part 1 - Configure YAML File

- Configure yml File 

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

# Part 2 - Configure Deployment

- Open VScode and run commend   

```bash
kubectl apply -f deployment-file.yml
```

- Delete pod

```bash
kubectl delete pods webserver-6cbf99fd-sqrwr
```
- Delete deployment 

```bash
kubectl delete deployment webserver
```