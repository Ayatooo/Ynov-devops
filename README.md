# devops

* Clone the repository on your local machine
* Run the deploy script with the following command
    ```bash
    ./start.sh
    ```
* Add the url `www.numeration.com` to your hosts file redirecting to the IP address of your machine
* Open the url `www.numeration.com:1234` in your browser


# How does it work : 

* we created a custom docker image of wordpress in the file `Dockerfile`
* the file docker-compose.yml contains the configuration of the following containers :
    * wordpress
    * mariadb
    * cli
    * nginx

Cli is an image used to setup the wordpress installation

Nginx is used to redirect the traffic from port 80 to port 1234
