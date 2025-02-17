# Docker container with ROS2 Humble and Microros
This repository contains a dockerfile which uses ROS2 Humble-base as base layer and Microros packages are built over it.

## Running the container
Open a new terminal and run the below commands to start the container
```
cd Hospibot_ws/Docker
docker compose up -d
docker exec -it hospibot bash
```
Now you should be inside the container.

## Starting up Microros communication with ESP32
Inside the container run the following commands:
Note: Make sure you are in the microros workspace directory and check for the assigned serial port to ESP32(in my case it is tty/ACM0)
```
source /opt/ros/humble/setup.bash
export RMW_IMPLEMENTATION=rmw_microxrcedds
source install/locak_setup.bash
ros2 run micro_ros_agent micro_ros_agent serial --dev /dev/ttyACM0
```
Press Reset button on the ESP32 to start the communication!
To check if its working properly, in another terminal of the container run these commands:
```
source /opt/ros/humble/setup.bash
ros2 topic list
```
Look for "/stepper_command" topic in the list
