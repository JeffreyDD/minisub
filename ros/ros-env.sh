#!/bin/bash
ROS_DISTRO=${ROS_DISTRO:='foxy'}

if [ -f "/opt/ros/${ROS_DISTRO}/setup.bash" ]; then
    source /opt/ros/${ROS_DISTRO}/setup.bash
fi

if [ -f "/uros_ws/install/local_setup.sh" ]; then
    source "/uros_ws/install/local_setup.sh"
elif [ "${ROS_DISTRO}" == "foxy" ]; then
    if [ -f "${HOME}/microros_ws_foxy/install/setup.bash" ]; then
        source ${HOME}/microros_ws_foxy/install/setup.bash
    fi
fi
