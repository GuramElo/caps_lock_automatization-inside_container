sudo docker build -t caps-lock-test1 .

xhost +local:docker

sudo docker run -it --rm --net=host -e DISPLAY=$DISPLAY -v /tmp/.X11-unix:/tmp/.X11-unix -v $XAUTHORITY:/home/nodeuser/.Xauthority -e XAUTHORITY=/home/nodeuser/.Xauthority caps-lock-test1 /bin/sh
