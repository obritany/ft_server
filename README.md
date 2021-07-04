# ft_server

The goal of ft_server is to create a web server with ```Nginx``` capable of running a ```WordPress``` website, ```phpMyAdmin```, and a ```MySQL``` database. This server will run in only one Docker container, under Debian Buster.

## Description:
When you type in the search bar "Google.com" a web server stores the files constituting the website (images, etc.). To obtain the page, your browser makes a request for a web page to the server which then sends the files (if the server doesn't find the requested document, it returns a 404 response instead).

There are different types of web servers: static or dynamic. In our case, we will create a dynamic web server. 

From a software point of view, the components of a dynamic web server are:
* An OS (ex: Windows or Linux)
* An HTTP server = software that supports client-server requests for the HTTP protocol (ex: Apache or Nginx)
* A database (ex: mySQL, Oracle)
* A script language = allows to interpret customer requests and translate them into html (ex: PHP, Python, Java)
---------------
* Our OS = Debian Buster 
* Our HTTP server = Nginx
* Our Database = Maria DB. 
* Our scripting language = PHP. 
> Plus we will install and configure phpMyAdmin and WordPress

We are going to do all of this in a Docker container. Why in a Docker container?

The problem: Often we end up with applications that have tons of dependencies: need magic to convert images, need a particular database, need nginx or apache etc. When working with a third-party web host it is a bit hell. The system administrator will have to install the correct versions on a number of machines etc., puzzle.

The solution: Docker makes it possible to package an application in a virtual container. It's a sort of box that is completely isolated from our operating system. In which we can install all the libraries that our application needs to function. And we also install our application there. And so we can send this box all over the place, and it's going to work no matter what operating system.

The Docker image include:
* Nginx
* PHP 
* MariaDB SQL database
* PhpMyAdmin
* Wordpress

## Instructions

### Installation 
```
git clone https://github.com/obritany/ft_server
```
### Build Docker image
```
docker build -t ft_server .
```
### Run a container
```
docker run --name ft_server -d -p 443:443 -p 80:80 ft_server
```
### Shell acces to the container
```
docker exec -it ft_server bash
```
