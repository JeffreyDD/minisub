# Setup MiniSub ROS components

There are several ways to setup MiniSub's ROS components, which best suits your needs depends on which platform and hardware you are using to run the components on.


## Docker
A Docker container containing all required components is available at "jeffreydd/minisub:latest".


## Virtual Appliance
A virtual appliance based on Ubuntu 20.04 containing all required components will be made available at a later stage.


## Ubuntu using Ansible
To install the required ROS package from repository on Linux, the playbook in `/env/ansible.yml` can be used to setup your machine. You will still need to source the `/opt/ros/{{ ros_distro }}/setup.bash` file.


## Windows and MacOS
On Windows and MacOS `conda` can be used to install precompiled ROS packages using the repository provided by RoboStack.
