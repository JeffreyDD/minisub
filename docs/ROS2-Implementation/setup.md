# Setup MiniSub ROS components

There are several ways to setup MiniSub's ROS components, which best suits your needs depends on which platform and hardware you are using to run the components on.

## Ubuntu using Ansible

To install the required ROS packages from repository on Linux, the playbook in `ansible/main.yml` can be used to setup your machine. You will still need to source the `/opt/ros/{{ ros_distro }}/setup.bash` file. The playbook includes additional functionality to configure the host to run MiniSub components, by installing Docker for instance.