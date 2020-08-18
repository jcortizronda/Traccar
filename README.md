# Traccar Docker for RaspberryPi

I will bring you here the latest version of Traccar for Docker and RaspberryPi

Instructions:

1) Download Dockerfile to your favourite path
2) CD to the path that contents Dockerfile
3) Create image from this Dockerfile using this command:
    ```ruby
    sudo docker build --tag traccar/traccar:4.10 ./
    ```
4) Now, you can create container using this:

    ```ruby
    sudo docker run -itd --network=hassio \
    -d --restart always \
    --name Traccar \
    --hostname traccar \
    -p 8082:8082 \
    -p 5000-5150:5000-5150 \
    -p 5000-5150:5000-5150/udp \
    -v /home/jotace/Docker/Traccar/logs:/opt/traccar/logs:rw \
    -v /home/jotace/Docker/Traccar/traccar.xml:/opt/traccar/conf/traccar.xml:ro \
    -v /home/jotace/Docker/Traccar/templates:/opt/traccar/templates:rw \
    traccar/traccar:4.10
  ```
  
NOTE:
 - Change the network flag as you want
 - Change -v directories as you want
I like to create volume for templates folder, so I can modify them easily for notifications
