# MiniSub Architecture


## Local setup

Local is easiest to use when testing locally as it only requires a single computer, and communicates with the vehicle over the ESP32's WiFi directly.

```mermaid
flowchart LR
    joystick[USB Joystick]-->joy_node
    subgraph base [Laptop / other computer]
        joy_node[ROS2 Joy Node]
        joy_teleop_node[ROS2 Joy Teleop Node]
        agent_node[MicroROS Agent Node]
    end
    esp32node-->agent_node
    subgraph esp32node [ESP32 Node]
        motor_sub[Motor PWM Control Subscriber]
        imu_pub[IMU Publisher]
    end
```


## Remote setup

The Remote setup is more robust and intended to allow the vehicle to perform autonomously while providing various methods to connect to the vehicle over long distances.

```mermaid
flowchart LR
    joystick[USB Joystick]-->joy_node
    subgraph laptop [Shore Laptop / other computer]
        joy_node[ROS2 Joy Node]
        joy_teleop_node[ROS2 Joy Teleop Node]
    end
    
    subgraph controller [RasPI Controlller on Vessel]
        agent_node[MicroROS Agent Node]
    end

    laptop<-->controller

    subgraph motor_1_node [ESP32 Motor Top Node]
        motor_1_sub[Motor PWM Control Subscriber]
    end
    subgraph motor_2_node [ESP32 Motor Bottom Node]
        motor_2_sub[Motor PWM Control Subscriber]
    end
    subgraph imu_node [ESP32 IMU Node]
        imu_pub[IMU Publisher]
    end

    motor_1_node-->agent_node
    motor_2_node-->agent_node
    imu_node-->agent_node
```