# Hands-on Kubernetes-05 :Deployment nginx image
 

Purpose of the this hands-on training is to teach the students how to Deployment nginx image 

## Learning Outcomes

At the end of the this hands-on training, students will be able to;

- Configure Deployment

- Choose Scale Up & Down 


# Outline
- Part 1 - Configure Deployment

- Part 2 - Scale Up & Down  


# Part 1 - Configure Deployment

- Open VScode and run commend   

```bash
kubectl create deployment nginx-dep --image=nginx
```

- Configure yml File 

```bash

apiVersion: v1
kind: Pod
metadata:
  name: nginx
spec:
  containers:
  - name: nginx
    image: nginx:latest
    resources:
      limits:
        memory: "128Mi"
        cpu: "500m"
    ports:
      - containerPort: 80
      
```

# Part 2 - Scale Up & Down

- To add replicaset  

```bash
kubectl scale deployment nginx-web --replicas=7
```

- To Check IPs podes 

```bash
kubectl get pods -o wide
```
![1](https://user-images.githubusercontent.com/111190149/233863648-c448b6b9-8c29-48c0-a77e-7b7a43500dba.jpg)

- To accses any pods

```bash
minikube ssh
```

```bash
curl 10.244.0.13
```
![2](https://user-images.githubusercontent.com/111190149/233863669-c7f747dd-c39d-4abf-94c2-c201b6e988d8.jpg)


- To Remove Replicaset 

```bash
kubectl scale deployment nginx-web --replicas=3
```
![3](https://user-images.githubusercontent.com/111190149/233863688-8ab3ed9e-61d9-4a70-9271-524e42bd7c27.jpg)

