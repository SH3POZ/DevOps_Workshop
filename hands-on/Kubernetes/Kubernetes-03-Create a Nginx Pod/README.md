# Hands-on Kubernetes-03 :Create a Nginx Pod
 

Purpose of the this hands-on training is to teach the students how to Create a Nginx Pod 

## Learning Outcomes

At the end of the this hands-on training, students will be able to;

- Configure yml File

- Create New Pods


# Outline
- Part 1 - Configure yml File

- Part 2 - Create New Pods


# Part 1 - Configure yml File

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
  labels:
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

# Part 2 - Create New Pods

- Run commend

```bash
kubectl apply -f helloworld-pod.yml
```
- Check the pods 

```bash
kubectl get pods
```

![1](https://user-images.githubusercontent.com/111190149/231018477-9ef19b6c-f556-40d3-acd2-a9c8df32f013.jpg)

![2](https://user-images.githubusercontent.com/111190149/231018489-3a3746aa-d766-453b-92e8-4a6f6b33e40e.jpg)


- Describe the pods

```bash
kubectl describe pods nginx
```
- Connect nginx pods

```bash
kubectl exec -it nginx -- /bin/bash
```

- Typing Message 

```bash
echo "Hello Hassan From Pod in Kubernetes" > /usr/share/nginx/html/index.html
```

- Check the reslaut

```bash
curl http://localhost
```
![3](https://user-images.githubusercontent.com/111190149/231018520-647d451c-2b08-485f-bb90-86a9ff31713b.jpg)



