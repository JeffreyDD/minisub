#!/bin/bash
ROS_DISTRO=foxy

if [ -f "/opt/ros/${ROS_DISTRO}/setup.bash" ]; then
    source /opt/ros/${ROS_DISTRO}/setup.bash
fi

if [ -f "~/microros_ws_foxy/install/setup.bash" ]; then
    source ~/microros_ws_foxy/install/setup.bash
fi

ros2 launch ./minisub.launch.xml $@
