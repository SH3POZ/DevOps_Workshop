# Hands-on Kubernetes-01 :Setup Kubernetes on AWS EC2 instance 
 

Purpose of the this hands-on training is to teach the students how to Setup Kubernetes on AWS EC2 instance  

## Learning Outcomes

At the end of the this hands-on training, students will be able to;

- Create new EC2 Instance

- Configure Docker in EC2 Instance

- Configure Kubernetes in EC2 Instance

- Create New Cluster


# Outline
- Part 1 - Create new EC2 Instance

- Part 2 - Configure Docker in Ec2 Instance

- Part 3 - Configure Kubernetes in EC2 Instance

- Part 4 - Create New Cluster


# Part 1 - Create new EC2 Instance

- Open https://aws.amazon.com/console  

- go to Launch Instance

![1](https://user-images.githubusercontent.com/111190149/229000030-1c53fbd4-d90d-44cd-ba60-109a0e0fa98b.jpg)


- Choose Name instanse and OS

![2](https://user-images.githubusercontent.com/111190149/228996648-2e3fa0ae-c3e8-4be5-8e78-1cdbc10a6737.jpg)

- Choose Instance Type

![3](https://user-images.githubusercontent.com/111190149/228996841-07fa2618-e401-469a-b7fb-572ac0e375ff.jpg)

- Choose VPC,Supnet,Enable auto assign Public IP, SG ( Must be open port SSH )

![4](https://user-images.githubusercontent.com/111190149/228997040-220845d2-6825-43c3-be94-dc7faac27db5.jpg)

- Connect to EC2 Instance by SSH Client  .

![5](https://user-images.githubusercontent.com/111190149/228997150-9b990060-10fa-4084-b872-0db3c793de87.jpg)

- Open PuTTY add Host Name

![6](https://user-images.githubusercontent.com/111190149/228997236-4ba6ceec-e29b-4d2c-b964-abe67fceaa2d.jpg)

- Open PuTTY add Private Key File 

![7](https://user-images.githubusercontent.com/111190149/228997328-c212efe2-e542-4609-86b5-5cff195f7cb9.jpg)

# Part 2 - Configure Docker in Ec2 Instance

- Step 1. Installing Docker   
- Update your existing packages:

```bash
sudo apt update
```
- Install a prerequisite packages which let apt utilize HTTPS:
```bash
sudo apt install apt-transport-https ca-certificates curl software-properties-common
```
- Add GPG key for the official Docker repo to the Ubuntu system:

```bash
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
```
- Add the Docker repo to APT sources:

```bash
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu focal stable"
```
- Update the  database with the Docker packages from the added repo:

```bash
sudo apt update
```

- Install Docker software:

```bash
sudo apt install docker-ce
```
- Docker should now be installed, the daemon started, and the process enabled to start on boot. To verify:

```bash
sudo systemctl status docker
 ```
- NOTE: To avoid using sudo for docker activities, add your username to the Docker Group

```bash
sudo usermod -aG docker ${USER}
 ```
- Step 2. Installing docker-compose

```bash
sudo curl -L "https://github.com/docker/compose/releases/download/1.28.5/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
```
- Set permissions so that the docker-compose command is executable:

```bash
sudo chmod +x /usr/local/bin/docker-compose
```
- Verify that the installation was successful by viewing version information:

```bash
docker-compose --version
```

```bash
docker-compose version 1.28.5, build c4eb3a1f
```
Now your ready to run our endpoint software. Follow these instructions to continue your NetFoundry containerized journey.

 
# Part 3 - Configure Kubernetes in EC2 Instance

```bash
sudo apt install -y curl wget apt-transport-https
```
```bash
wget https://storage.googleapis.com/minikube/releases/latest/minikube-linux-amd64
```
```bash
sudo cp minikube-linux-amd64 /usr/local/bin/minikube
```
```bash
sudo chmod +x /usr/local/bin/minikube
```
```bash
curl -LO https://storage.googleapis.com/kubernetes-release/release/`curl -s https://storage.googleapis.com/kubernetes-release/release/stable.txt`/bin/linux/amd64/kubectl
```
```bash
chmod +x kubectl
```
```bash
sudo mv kubectl /usr/local/bin
```
```bash
minikube start --driver=docker --force
```

# Part 4 - Create New Cluster  

```bash
kubectl create deployment nginx-web --image=nginx 
```
- To check

```bash
kubectl cluster-info .
```
- To check the nodes
```bash
kubectl get nodes
```
- To check which addons we have 
```bash
kubectl addons list
```
- To enable dashbord we run commend 

```bash
minikube dashboard
```
