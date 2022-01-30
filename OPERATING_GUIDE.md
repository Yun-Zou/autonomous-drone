# Operating Guide
This guide will show teach you how to operate the drone to do manual flight and autonomous flight. Specific operations won't be explained here but may be in the README.md files of the individual modules.

## tmux
When you are putting in commands via ssh either with ethernet of Wifi, when you leave the instance, the processes also close, and the drone will stop.
This is why we need a persistent terminal which we can command, disconnect and still have the drone running. This is where tmux comes in.

Tmux is a very useful tool to let you split your terminal but importantly also keep the instances running and return to it later even you disconnect from ssh. [Read more here](https://linuxize.com/post/getting-started-with-tmux) 

It is assumed that tmux is used for this operation guide.

Install it with this command on the drone
`
sudo apt install tmux
`

## Pre-Flight Checks
It is important that you do these checks before autonomous flight tests. Any accident can be very dangerous to the people around and also damage the drone. We need to make sure that the hardware is correctly setup, and that the software is working.

1. Submit necessary flight documents a day before at least and book room.
2. Check LiPo battery is charged and then plug in battery into drone
3. Secure all components and plug in T265 and WiFi Adaptor to Jetson Nano and connect the Jetson Nano USB to Pixhawk.
4. Check that no wires are loose by lightly pulling on the wires to ensure that they are secured and won't go into the path of the propellors.
5. Using an ethernet cable, connect the drone and your laptop. (May require some networking setup)
6. 
4. Plug in the drone into a monitor and connect to the WiFi (try not use eduroam) and note down IP
5. Connect Remote Control and Establish link from computer (either SSH or ROS Bridge Web Socket)
6. Go to testing room and conduct specific tests

## Flight Procedure
1. Place the drone in the location you wish to take-off
2. Connect to the drone with either ethernet/WiFi and in a `tmux` terminal, run your scripts, 
2. Press the Arm Button til it stays red. The arm button is located on the side of the second level of the housing which flashes red. 
3. Step back to a safe distance (at least 5m), and grab your remote control.
4. 

`
roscore
roslaunch monash_main t265_all_nodes.launch
roslaunch monash_motion (flight_plan.launch)
`

## Simulated Flight Procedure



## Manual Flying
1. Grab the Taranis Remote Control that is linked to the Drone
2. Turn on the drone

## Mission Planner and Configs
You may find that you want to add more sensors/flight settings are weight

# Common Issues and Fixes

