#steps to install micro_ros

#!/bin/bash

# Source the ROS 2 installation
source /opt/ros/humble/setup.bash
sudo apt install joystick ros-humble-joy -y

# Create a workspace and download the micro-ROS tools
mkdir stepper_ws
cd stepper_ws
mkdir src
cd src
git clone https://github.com/Chandrahas-kasoju/joy_stick_stepper_control.git
cd ..
colcon build
source install/setup.bash

