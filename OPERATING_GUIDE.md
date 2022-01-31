# Operating Guide
This guide will show teach you how to operate the drone to do manual flight and autonomous flight. Specific operations won't be explained here but may be in the README.md files of the individual modules.

It is important before you start flying that you have your supervisor, or someone who knows how to fly to teach/accompany you for your first few flights.

## tmux

(TO DO. Image)

When you are putting in commands via ssh either with ethernet of Wifi, when you leave the instance, the processes also close, and the drone will stop.
This is why we need a persistent terminal which we can command, disconnect and still have the drone running. This is where tmux comes in.

Tmux is a very useful tool to let you split your terminal but importantly also keep the instances running and return to it later even you disconnect from ssh. [Read more here](https://linuxize.com/post/getting-started-with-tmux) 

It is assumed that tmux is used for this operation guide.

Install it with this command on the drone
`
sudo apt install tmux
`

## General Operating Limits
There are some limits to how you can fly the drone, whether autonomously or manually due to hardware/software/safety/legal restrictions.
1. Generally don't fly more than 30m from your controller, it should be able to handle up to 100m, but we don't want to find out if it can't. It will just keep going depending on the flight mode.
2. Don't fly for more than 8 minutes of continous heavy use on a single battery. Check battery often
3. Don't fly within 30m of other people or over private property
4. Not at night or in the rain.
5. Always keep within line of sight

## In Case of Loss of Control!!!
If you are losing control of the drone, either:
1. Put the Drone in LAND mode, if it is still not completely out of control OR
2. Flick the motor switch off to immediately cut power.

Don't act too late, better safe than sorry. Damaged drone > Injury

## Pre-Flight Checks
It is important that you do these checks before autonomous flight tests. Any accident can be very dangerous to the people around and also damage the drone. We need to make sure that the hardware is correctly setup, and that the software is working.

(TODO. Wiring Image)

1. Submit necessary flight documents (check Monash Drone rules) a day before at least and book room.
2. Check LiPo battery is charged and then plug in battery into drone
3. Secure all components (mountings, propellers, battery especially) and plug in T265 and WiFi Adaptor to Jetson Nano and connect the Jetson Nano USB to Pixhawk.
4. Check that no wires are loose by lightly pulling on the wires to ensure that they are secured and won't go into the path of the propellors.
5. Upload your Misison Planner parameters or check that they are already configured as you want them
6. Using an ethernet cable, connect the drone and your laptop. (May require some networking setup)
7. (TODO. Login. Password)
8. Plug in the drone into a monitor and connect to the WiFi (don't use eduroam, it doesn't allow SSH connections) and note down IP
9. Connect Remote Control and establish link from computer (either SSH or ROS Bridge Web Socket)
10. Go to testing room and conduct specific tests

## Manual Flying
Manual flying involves you controlling the drone yourself via remote-control. Stabilize and Alt-Hold are the two ArduPilot flight modes that you will usually fly in. [Full list of ArduPilot flight modes](https://ardupilot.org/copter/docs/flight-modes.html#full-list-of-flight-modes). This assumes you are flying without GPS, so camera guided flight. With GPS, would be a bit simpler (without ROS), check the ArduPilot wiki on how to setup the Mission Planner config, however, general process is similar.

Stabilise gives you more direct control over the drone and its motor power while Alt-Hold while try to maintain elevation which is a bit easier to control. I would suggest learning stabilise first if you want to really understand the drone before going easy-mode and flying with Alt-Hold.

Prestep: In Mission Planner, change the middle flight mode toggle to Stabilise or Alt-Hold depending on which one you want to fly on.

1. Grab a supervisor around to teach/watch based on your ability.
2. Perform Pre-Flight Checks 
3. Over SSH or direct ethernet connection in `tmux`, do the following commands:
``` 
roscore
roslaunch monash_main t265_all_nodes.launch
```
4. Grab the Taranis Remote Control that is linked to the Drone and turn it on
(TODO. Remote Picture Controls)
5. Place the drone down in your take-off area, make sure there is adequate space around
6. Check Mission Planner status screen for any warning messages
(TODO. Image)
7. Hold the flashing red motor-interlock button until you hear a beep. This enables the motor hardware switch 
8. Hold the left remote control stick to the bottom right until you hear the drone make a noise, arming the drone. Flick the motor switch on.
9. Flick the flight mode toggle to the top mode, if it isn't already
10. Start to take off by VERY slowly raising the right stick. (Refer to remote control diagram.)
11. Once in the air, use the other stick to move around.
12. Once ready to land, slowly lower the right stick OR hover in the area you want to land and flick the flight mode toggle to the bottom, putting it in LAND mode.
13. Flick the motor switch off. Push the left stick to the bottom left until a beep is heard, go to the drone hold the motor-interlock button to disarm it.

## Autonomous Flight Procedure
1. Grab a supervisor around to teach/watch based on your ability.
2. Perform Pre-Flight Checks 
3. Place the drone in the location you wish to take-off
4. Connect to the drone with either ethernet/WiFi and in a `tmux` terminal, run these scripts
` 
roscore
roslaunch monash_main t265_all_nodes.launch
rosservice call /mavros/set_stream_rate 0 10 1
roslaunch monash_motion FLIGHTPLANOFCHOICE.launch
`
5. If you want command/partner functionality from laptop, read monash_main README.md to connect to drone monitor
6. Press the Arm Button til it stays red. The arm button is located on the side of the second level of the housing which flashes red. 
7. Step back to a safe distance (at least 5m), and grab your remote control.
8. Hold the left remote control stick to the bottom right until you hear the drone make a noise, arming the drone. Flick the motor switch on.
9. Flick the flight mode toggle to the middle GUIDED mode
10. If you want to land, slowly lower the right stick OR hover in the area you want to land and flick the flight mode toggle to the bottom, putting it in LAND mode.
11. Flick the motor switch off. Push the left stick to the bottom left until a beep is heard, go to the drone hold the motor-interlock button to disarm it.


## Simulated Flight Procedure


## Mission Planner and Configs
You may find that you want to add more sensors/flight settings are weight

# Common Issues and Fixes
- T265 Camera will randomly lose feed while still providing pose information. This can be pretty bad depending on what you're doing. Not sure why. Online forums say this occurs, my best attempts at fixing are turning it on and off. Put the drone down immediately if you suspect this is happening.
- You can't connect to Mission Planner. Not sure why, I think it is a USB channel issue since it is connected to the Pixhawk via USB. Restart drone and connect to Mission Planner first.

