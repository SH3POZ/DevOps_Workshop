# Hands-on Kubernetes-11 : Multi-Container Pods and Containers Communication in Kubernetes
 

Purpose of the this hands-on training is to teach the students how to Multi-Container Pods and Containers Communication in Kubernetes

## Learning Outcomes

At the end of  this hands-on training, students will be able to;

-  Create yaml file

-  Configure containers 

-  Check the result  


# Outline
- Part 1 -   Create yaml file

- Part 2 -   Configure containers 

- Part 5 - Check the result    


# Part 1 - Create yaml file  

- I'll create yaml file for one pod consents has 2 containers first one nginx web server default page and the second we will change this web page by Linux Ubuntu 

```bash
apiVersion: v1
kind: Pod
metadata:
  name: two-containers-pods
spec:
  restartPolicy : Never
  volumes : 
    - name: shared-area
      emptyDir: {}
  containers:
    - name: nginx-container
      image: nginx
      volumeMounts:
      - name: shared-area
        mountPath:  /usr/share/nginx/html
    - name: ubuntu-container
      image: ubuntu   
      volumeMounts:
      - name: shared-area
        mountPath: /pod-area
      command: ["/bin/sh"]
      args: ["-c", "echo Hello From Multi-Container > /pod-area/index.html"]
```

# Part 2 - Configure containers

- Create a containers    

```bash
kubectl apply -f MultiContainerPods.yaml
```

- check how many Container is created  

```bash
kubectl get pod
```
- open the nginx container 

```bash
kubectl exec -it two-containers-pods -c nginx-container -- /bin/bash 
```
- check how many containers are on one pod  

```bash
kubectl get pods two-containers-pods -o jsonpath='{.spec.containers[*].name}'
```

# Part 5 - Check the result

- check to Echo message

```bash
curl localhost
```