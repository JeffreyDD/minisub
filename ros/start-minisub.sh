#!/bin/bash

if [ -f "ros-env.sh" ]; then
    source ros-env.sh
fi

ros2 launch ./minisub.launch.xml $@
