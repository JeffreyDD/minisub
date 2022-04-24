# IMU Publisher

The IMU Publisher is responsible for sending `IMU` messages containing the current orientation of the vehicle. This is currently implemented by reading acceleration from a MPU9250 over I2C, and simply broadcasting messages as quickly as possible.