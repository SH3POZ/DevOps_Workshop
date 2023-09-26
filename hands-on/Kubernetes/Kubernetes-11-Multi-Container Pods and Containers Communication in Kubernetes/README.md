# Hands-on Kubernetes-11: Multi-Container Pods and Containers Communication in Kubernetes
 

Purpose of the this hands-on training is to teach the students how to Multi-Container Pods and Containers Communication in Kubernetes

## Learning Outcomes

At the end of  this hands-on training, students will be able to;

-  Create yaml file

-  Configure containers 

-  Check the result

-  Note


# Outline
- Part 1 -   Create yaml file

- Part 2 -   Configure containers 

- Part 3 - Check the result

- Part 4 - Note   


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
![3](https://github.com/SH3POZ/DevOps_Workshop/assets/111190149/2f808f81-add2-4e4b-a370-93e62e67b892)

- open the nginx container 

```bash
kubectl exec -it two-containers-pods -c nginx-container -- /bin/bash 
```
![5](https://github.com/SH3POZ/DevOps_Workshop/assets/111190149/750b57c3-0748-410b-bf49-265d95b7b79f)


- check how many containers are on one pod  

```bash
kubectl get pods two-containers-pods -o jsonpath='{.spec.containers[*].name}'
```
![efw](https://github.com/SH3POZ/DevOps_Workshop/assets/111190149/84ef8cf5-9e60-46c5-974a-4e9e6a6b7a4a)

![wwef](https://github.com/SH3POZ/DevOps_Workshop/assets/111190149/be8d885f-d29a-4da1-834c-229fcb5daf3c)



# Part 3 - Check the result

- check to Echo message

```bash
curl localhost
```
![5](https://github.com/SH3POZ/DevOps_Workshop/assets/111190149/750b57c3-0748-410b-bf49-265d95b7b79f)

# Part 4 - Note

- Multi-Container Pods and Containers Communication in Kubernetes means creating 2 containers in the same Pod >>> one is primary and the second one is a helper container

 ![1](https://github.com/SH3POZ/DevOps_Workshop/assets/111190149/f3d9259e-df07-4215-91c7-7d6716b49c5a)


- Design - Patterns Of Multi Container Pods:-

  1- Sidecar Design pattern --> means consists of the main applications (web applications and helper container ) and the helper container is important for your applications but is not necessarily a part

  ![Sidecar Design pattern](https://github.com/SH3POZ/DevOps_Workshop/assets/111190149/88467da3-663b-4f90-8eae-193a1ad46f7a)


  2- Adapter Design pattern --> means this pattern is a container that transforms the output of the main container to an external word

![1](https://github.com/SH3POZ/DevOps_Workshop/assets/111190149/bc1b0af8-d0dc-4e65-8447-0cfcc41f591f)


  3- Ambassador Design pattern -->means the helper container works as a proxy that allows other containers to connect to a port on the localhost

  ![Ambassador Design pattern](https://github.com/SH3POZ/DevOps_Workshop/assets/111190149/cde492fe-171e-4b40-962e-3d48c894e32f)


- Communication inside a multi-container pod in three ways:-

  1- Shared Network namespace --> means all containers in pods Shared namespace, so they can communicate

  ![Shared Network namespace](https://github.com/SH3POZ/DevOps_Workshop/assets/111190149/6075689f-52af-443b-bb16-f2b0ed3cbbfd)


  2- shared Storage Volumes --> means all containers in pods Share the same Volumes, so they can communicate

  ![shared Storage Volumes](https://github.com/SH3POZ/DevOps_Workshop/assets/111190149/f5af5327-cdb0-4be8-a2a0-3135a8180d03)


  3- Shared Process namespace --> means we have a flag or attribute name ( namespace ) under the pod specification in yml file we just enable it, so they can communicate

  ![Shared Process namespace](https://github.com/SH3POZ/DevOps_Workshop/assets/111190149/d257a61c-0ead-4c17-9e88-496d64107509)
