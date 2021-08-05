# Default Directory
DEFAULTDIR=autonomous-drone/catkin_ws
CLDIR="$1"
if [ ! -z "$CLDIR" ]; then 
 DEFAULTDIR="$CLDIR"
fi
# Check to see if qualified path already
if [ -d "$DEFAULTDIR" ] ; then
   echo "Fully qualified path"
else
   # Have to add path qualification
   DEFAULTDIR=$HOME/$DEFAULTDIR
fi
echo "DEFAULTDIR: $DEFAULTDIR"

# Setup Catkin Workspace
sudo apt-get install python-wstool python-rosinstall-generator python-catkin-tools
mkdir -p ~/autonomous-drone/catkin_ws/src
cd $DEFAULTDIR
catkin init

# Install Dependencies MAVROS and MAVLink
cd $DEFAULTDIR
wstool init $DEFAULTDIR/src

rosinstall_generator --upstream mavros | tee /tmp/mavros.rosinstall
rosinstall_generator mavlink | tee -a /tmp/mavros.rosinstall
wstool merge -t src /tmp/mavros.rosinstall
wstool update -t src
rosdep install --from-paths src --ignore-src --rosdistro `echo $ROS_DISTRO` -y

catkin build

echo "source ~/autonomous-drone/catkin_ws/devel/setup.bash" >> ~/.bashrc
source ~/.bashrc

sudo $DEFAULTDIR/src/mavros/mavros/scripts/install_geographiclib_datasets.sh

