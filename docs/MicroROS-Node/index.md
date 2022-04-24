# MicroROS Node

The MicroROS node is responsible for communicating between MiniSub's hardware and the ROS nodes responsible for driving MiniSub.

The node is built using [micro-ROS for Arduino](https://github.com/micro-ROS/micro_ros_arduino), which offers a low-level entry into MicroROS development, especially when used in combination with [PlatformIO](https://platformio.org/). It is also easier to build and flash microcontrollers from PlatformIO than using (Micro)ROS's own, custom build toolchain.

!!! Note
    Recently, MicroROS has released [MicroROS for PlatformIO](https://github.com/micro-ROS/micro_ros_platformio), which has not yet been tested / integrated with this project.

A single codebase is used to implement all functionality required by MiniSub. Publishers and Subscribers can be enabled and disabled using build flags, but all components can run on a single node as well.


## Currently used hardware

* An ESP32 is used as the main microcontroller
  * Currently only Wifi transport is supported, though ethernet and serial transports will be supported in the near future
* An MPU9250 is used to gather IMU data
* Generic reversible ESCs are used, simply driven using a PWM signal straight from the ESP32
* Inside MiniSub, a LM2596 voltage regulator is used to regulate battery voltage (which should be between 12-24V) down to 5V.