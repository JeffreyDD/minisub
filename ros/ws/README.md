# MiniSub ROS Workspace
This is a ROS workspace which can be used for MiniSub development.

# Setup

- Setup the system using the Ansible base role
  ```bash
  cd ../../ansible # Change to ansible dir
  ansible-playbook --ask-become-pass main.yaml # --ask-become-pass only required on first run, when passwordless sudo hasn't been setup yet
  ```
- Make sure rosdep is setup properly
  ```bash
  sudo rosdep init
  rosdep update
  ```
- Clone repo's using vcstool
  ```bash
  mkdir src
  vcs import src/ < minisub.repos
  ```
- Build ROS packages using colcon
  ```bash
  colcon build # Use --packages-select to limit packages to build
  ```
- Source to local setup after the ROS install from repo has been sourced. Probably wise to add to `.bashrc` on dedicated minisub devices.
  ```bash
  source /opt/ros/galactic/setup.bash # Has to be sourced first
  source install/local_setup.bash
  ```

# Building MicroROS Agent

```bash
# Clone the micro_ros_setup repo
git clone -b $ROS_DISTRO https://github.com/micro-ROS/micro_ros_setup.git src/micro_ros_setup

# Run rosdep
sudo apt update && rosdep update
rosdep install --from-paths src --ignore-src -y

# Run build and source
colcon build
source install/local_setup.bash

# Use micro_ros_setup to create agent WS
ros2 run micro_ros_setup create_agent_ws.sh

# Run build and source
ros2 run micro_ros_setup build_agent.sh
source install/local_setup.bash

# Run micro-ROS agent
ros2 run micro_ros_agent micro_ros_agent udp4 --port 8888
```