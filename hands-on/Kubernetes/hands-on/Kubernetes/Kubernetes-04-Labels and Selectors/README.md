# Hands-on Kubernetes-04 :Create a Labels and Selectors
 

Purpose of the this hands-on training is to teach the students how to Create a Labels and choose Selectors 

## Learning Outcomes

At the end of the this hands-on training, students will be able to;

- Configure Labels

- Choose Selectors 


# Outline
- Part 1 - Configure Labels

- Part 2 - Chosse Selectors 


# Part 1 - Configure Labels

- Open PoweShell and run commend   

```bash
code helloworld-pod.ymlKind 
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
-  Add labels to pods
- We Have 2 way
- First By Commend line 

```bash
kubectl label pod nginx owner=Hassan
```
- Create new pods

```bash
kubectl apply -f helloworld-pod.yml
```
- Second By yml file

```bash
apiVersion: v1
kind: Pod
metadata:
  name: nginx
  labels:
    webserver : nginx
    env : Production
    counter : EG
```

# Part 2 - Choose Selectors

- Selcate specific podes

- We Have 2 way

- First Equality-based Requirment  

```bash
kubectl get pods --selector owner=Hassan
```
```bash
kubectl get pods -l owner=Hassan
```

![1](https://user-images.githubusercontent.com/111190149/231119259-a4ab477c-a371-462d-96e7-3be277814edd.jpg)

- But if i want except specific labels 

```bash
kubectl get pods -l owner!=Hassan
```

- Second Set-based Requirment 

```bash
kubectl get pods -l 'owner in (Hassan)'
```
![1](https://user-images.githubusercontent.com/111190149/231119116-45a52bc8-cace-4bec-878c-57867321c2e8.jpg)

- But if i want except specific labels 

```bash
kubectl get pods -l 'owner notin (Hassan)'
```
