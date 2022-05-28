# MiniSub Architecture


## Local setup (test rig)

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


## Remote setup (MicroSub)

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
        metric_exporter_node[Metric Exporter Node]
        prometheus[Prometheus TSDB]

        prometheus-->metric_exporter_node
    end

    laptop<-- wifi -->controller

    subgraph thruster_node [ESP32 Thruster Nodes]
        thruster_twist_sub[Motor Control PWM Twist Subscriber]
        thruster_power_pub[Power Consumption Data Publisher]
    end
    subgraph imu_node [ESP32 IMU Node]
        imu_pub[IMU Publisher]
    end

    thruster_node-->agent_node
    imu_node-->agent_node
```