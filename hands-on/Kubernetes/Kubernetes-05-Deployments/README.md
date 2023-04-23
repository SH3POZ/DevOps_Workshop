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

- To accses any pods

```bash
minikube ssh
```

```bash
curl 10.244.0.13
```

- To Remove Replicaset 

```bash
kubectl scale deployment nginx-web --replicas=3
```

