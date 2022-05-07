ARG ROS_DISTRO=galactic

FROM microros/micro-ros-agent:$ROS_DISTRO

RUN apt update && apt install -y \
        ros-$ROS_DISTRO-key-teleop \
        ros-$ROS_DISTRO-joy-teleop \
        ros-$ROS_DISTRO-turtlesim \
        ros-$ROS_DISTRO-turtle-tf2-cpp \
        ros-$ROS_DISTRO-turtle-tf2-cpp \
        ros-$ROS_DISTRO-tf2-tools  \
        ros-$ROS_DISTRO-tf-transformations

ADD ros .

ENTRYPOINT ./start-minisub.sh start_agent:=true