# autonomous-drone
FYP Project at Monash. Creating an autonomous DIY drone platform running on Ardupilot. Originally developed by Yun Zou (yunzou2@gmail.com) in 2021, supervised by Dr Wesley Chan (wesley.chan@monash.edu) and Calvin Vong (calvin.vong@monash.edu). There is also an accompanying set of resources in a Google Drive (contact supervisors for access).

This drone platform uses a Nvidia Jetson Nano as a companion computer on the drone with a Pixhawk Flight Controller controlling hardware and running ArduPilot flight software. Notably, also uses the T265 Intel RealSense Camera for grayscale stereo fisheye imaging and receives position data from its onboard Visual Inertial Odometry computing unit as well. A **very helpful** online resource that I relied on were these [forum posts](https://discuss.ardupilot.org/t/integration-of-ardupilot-and-vio-tracking-camera-part-1-getting-started-with-the-intel-realsense-t265-on-rasberry-pi-3b/43162). That contributer has many other great form posts which you can have a look at.

This workspace helps integrate many of the hardware components (Pixhawk, Nvidia Jetson Nano and Intel T265) so they can communicate together how we want. It also controls many of the autonomous flight features and computer vision. It is made up of both open-source libraries and customised self-written ones. The self-written ones are prepended with `monash-xxx`.

This platform is built on top of the open-source autopilot software platform ArduPilot running the Copter version (ArduCopter). It's very powerful and worth reading the docs to understand it more. [ArduCopter](https://ardupilot.org/copter/docs/introduction.html). [ArduPilot with ROS](https://ardupilot.org/dev/docs/ros.html).

To use this workspace, it is expected that you know the basics of Linux, ROS, Git and Catkin. 

Expected Knowledge
- Linux terminal, basic commands and permissions
- How ROS works. Ex. Nodes, roslaunch, rosrun, param files
- ROS basic functions such as subscribers and advertisers, and common libraries
- How Git works, branches, pushing and pulling.
- How to build with Catkin. Aka `catkin build` in terminal the catkin_ws folder
- Basic Cmake understanding
- File structure of catkin

# Getting this repo
This workspace is stored on a private Github which you should request access to if you are going to work on this project. It authenticates uses SSH authentication so you will need to setup a key [Docs on how to authenticate with SSH for GitHub](https://docs.github.com/en/authentication/connecting-to-github-with-ssh)

To get the repo, put this command into where you want the workspace to be.
````
git clone git@github.com:Yun-Zou/autonomous-drone.git
````

# Installing for Nvidia Nano
Flash your Nvidia Nano with Jetpack 4.3 (Tested with 4.3)



# Installing for Computer
Installing this workspace on your computer will let you develop the packages easier, run simulations on Gazebo and monitor/command the drone with the monitoring app.

Be familiar with ROS and Catkin
To install, get this repo and then run 

# Ground Control Stations
[Ground Control Stations](https://ardupilot.org/copter/docs/common-choosing-a-ground-station.html) are useful and not discussed much in the report as they are not strictly necessary for autonomous flight but they are very uesful for manual flight, testing and making changes to the Ardupilot configuration. The one that was used in 2021 was Mission Planner which runs on Windows. There is also QGroundControl and APM Planner which also runs on Linux distributions. 

Something that you may do is change [Ardupilot configurations](https://ardupilot.org/copter/docs/parameters.html) to tune the flight, change hardware configurations and autopilot settings. Most you won't need to know, but some notable ones are  It would be worth understanding what some of those configurations do such as the [Extended Kalman Filter settings](https://ardupilot.org/copter/docs/common-apm-navigation-extended-kalman-filter-overview.html) among others.

Configurations are not set in stone and there can be more tuning to do. Configurations used historically ares stored in the Google Drive under mission_planner_configs. You can compare different configs in Mission Planner to see what was changed in detail.

# Summary of Packages
The packages used are included as submodules in catkin_ws/src. This helps keep track of the version of the package we need and make sure that you're not modifying the entire workspace with every change.

This github page has a nice explanation about submodules [here, I recommend you read this](https://gist.github.com/gitaarik/8735255).

- **apriltag** - AprilTags Library. [Learn more](https://github.com/AprilRobotics/apriltag)
- **apriltag_ros** - ROS Detectors for AprilTags library [Learn more](http://wiki.ros.org/apriltag_ros)
- **arni** - Tracks RAM/CPU resources
- **async_web_server_cpp** - Dependency of web_video_server
- **ddynamic_reconfigure** - Dependency for mavlink
- **mavlink-gbp-release** - Communication protocol for Nano to Pixhawk. [Wiki](https://mavlink.io/en/messages/common.html)
- **mavros** - ROS Wrapper for Mavlink
- **monash_main** - Customied Package. Responsible for launch files and Drone Monitoring/Commanding
- **monash_motion** - Customised Package. Responsible for flight. Built on top of [iq_gnc package](https://github.com/Intelligent-Quads/iq_gnc)
- **monash_perception** - Customised Package. Responsible for vision. Detecting AprilTags and finding coords in local frame.
- **realsense-ros** - ROS Wrapper for Intel Librealsense library used for T265 Camera
- **t265_depth** - Creates depth map and undistorts images. Not used as first choice
- **vision_opencv** - ROS Library Addon for OpenCV
- **vision_to_mavros** - Important Library. Turns T265 positional data and sends it to Pixhawk. Also undistorts image 
- **web_video_server** - Used to stream images drone to computer over an internet connection


# Common Issues and Fixes


# Future Work
