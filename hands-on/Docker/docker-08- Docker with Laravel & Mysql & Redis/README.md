# Hands-on Docker-07 :Run Docker with Laravel & Mysql & Redis
 

Purpose of the this hands-on training is to teach the students how to Run Docker with Laravel & Mysql & Redis 

## Learning Outcomes

At the end of the this hands-on training, students will be able to;

- Configure Laravel & Mysql & Redis 

- Check Docker Compose File

- Note Getting Started On Windows


# Outline
- Part 1 - Configure Laravel & Mysql & Redis  

- Part 2 - Check Docker Compose File

- Part 3 - Note Getting Started On Windows


# Part 1 - Configure Laravel & Mysql & Redis 

- Open https://laravel.com/docs/10.x --> under Choosing Your Sail Services --> copy new service Laravel ..    

![asd](https://user-images.githubusercontent.com/111190149/228834148-5bf40c61-8f00-490b-a278-0f897aa962d4.jpg)


- open terminal machine and rub commend 
```bash
 curl -s "https://laravel.build/example-app?with=mysql,redis" | bash
```

-	Result 

![qwdqw](https://user-images.githubusercontent.com/111190149/228834350-d71c5c3c-55a6-40df-ac17-1cf88c1db43b.jpg)


# Part 2 - Check Docker Compose File

- To run container used common  

```bash
./vendor/bin/sail up
```
 -	Result 
 
 ![zxc](https://user-images.githubusercontent.com/111190149/228834732-2ceadab5-ff9b-4656-950e-2027b3026b88.jpg)

 
# Part 3 - Note Getting Started On Windows

- Before we create a new Laravel application on your Windows machine, make sure to install Docker Desktop. Next, you should ensure that Windows Subsystem for Linux 2 (WSL2) is 
installed and enabled. WSL allows you to run Linux binary executables natively on Windows 10. Information on how to install and enable WSL2 can be found within Microsoft's developer environment documentation. (https://learn.microsoft.com/en-us/windows/wsl/install)

- After installing and enabling WSL2, you should ensure that Docker Desktop is configured to use the WSL2 backend. ( https://docs.docker.com/desktop/windows/wsl/ )
- Next, you are ready to create your first Laravel project. Launch Windows Terminal and begin a new terminal session for your WSL2 Linux operating system. Next, you can use

- a simple terminal command to create a new Laravel project. For example, to create a new Laravel application in a directory named "example-app", you may run the following command in your terminal:

```bash
curl -s https://laravel.build/example-app | bash
```
