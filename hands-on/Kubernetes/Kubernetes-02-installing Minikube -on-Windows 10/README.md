# Hands-on Kubernetes-02 :Setup Minikube on Windows 10 
 

Purpose of the this hands-on training is to teach the students how to Setup Minikube on Windows 10 

## Learning Outcomes

At the end of the this hands-on training, students will be able to;

- Configure Minikube in Windows 10

- Create New Cluster


# Outline
- Part 1 - Configure Minikube in Windows 10

# Note :- 
- Must be install docker before start install Minikube in Windows 10

# Part 1 - Configure Minikube in Windows 10

- open link https://github.com/kubernetes/minikube/releases --> choose Your os example windwos  

![vc](https://user-images.githubusercontent.com/111190149/230151515-604096f7-f5f4-445f-98ab-a949682fe6c3.jpg)

![7](https://user-images.githubusercontent.com/111190149/230161334-a39dc8b5-b9b3-4170-a1cf-ac7f24c6bf15.jpg)
![9](https://user-images.githubusercontent.com/111190149/230161353-18666e0d-453b-49db-8337-ce76a0685c38.jpg)
![10](https://user-images.githubusercontent.com/111190149/230161376-42719f00-d280-46fd-a8fd-31bad8d214ae.jpg)
![12](https://user-images.githubusercontent.com/111190149/230161393-490c0ce7-ead1-4e5c-a5b0-8022c5914e7c.jpg)
![13](https://user-images.githubusercontent.com/111190149/230161413-52b42aaa-f0be-4623-8b68-395d2855b04d.jpg)


- Configure Docker 

open docker desktop --> seting --> Kubernetes --> check box Enable Kubernetes , Show system containers (advanced)

![bmbn](https://user-images.githubusercontent.com/111190149/230151400-0fc1744c-b11e-48b7-a3f8-d1c3125e9715.jpg)


- To install minikube Open powershell or Vscode as administrator 

```bash
minikube start
```
![1](https://user-images.githubusercontent.com/111190149/230157643-3b619d41-a52c-466f-b028-14bc59ee2e83.jpg)


- To check minikube status

```bash
minikube status
```
![2](https://user-images.githubusercontent.com/111190149/230157879-58d4a28b-2402-443b-bc38-73b244d935b0.jpg)


- To create new cluster

```bash
kubectl create deployment nginx-web --image=nginx
```

![3](https://user-images.githubusercontent.com/111190149/230158212-ec278976-841b-4209-be70-b658ed958401.jpg)

-To check deployment list

```bash
kubectl get deployment 
```
-To check Pods list

```bash
kubectl get pods
```
- To check services list

```bash
kubectl get services
```
- To add Replicase

```bash
kubectl scale deployment nginx-web --replicas=3
```
![Untitled](https://user-images.githubusercontent.com/111190149/230159640-881d0cdc-a304-47e2-a7ab-1467330c617c.jpg)

- To delete all deployment

```bash
  kubectl delete deployment --all 
```
