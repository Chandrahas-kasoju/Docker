# Use the official ROS 2 Humble base image
FROM ros:humble-ros-base

# Set environment variables
ENV ROS_DISTRO=humble
ENV DEBIAN_FRONTEND=noninteractive

# Install necessary dependencies
RUN apt update && apt install -y \
    python3-colcon-common-extensions \
    git \
    python3-rosdep \
    && rm -rf /var/lib/apt/lists/*


WORKDIR /home/micro_ros

COPY scripts /home/micro_ros

RUN chmod +x ./micro_ros.sh
RUN chmod +x ./stepper_ws.sh

RUN /bin/bash -c "source /opt/ros/humble/setup.bash && ./micro_ros.sh"
RUN /bin/bash -c "source /opt/ros/humble/setup.bash && ./stepper_ws.sh"

# Set entrypoint to source ROS 2
ENTRYPOINT ["/bin/bash", "-c", "source /opt/ros/humble/setup.bash && exec bash"]



