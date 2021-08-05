# Clone ArduPilot
cd ~
sudo apt install git
git clone https://github.com/ArduPilot/ardupilot.git
cd ardupilot
git checkout Copter-3.6
git submodule update --init --recursive

# Install Dependencies
sudo apt install python-matplotlib python-serial python-wxgtk3.0 python-wxtools python-lxml python-scipy python-opencv ccache gawk python-pip python-pexpect

# Install MAVProxy
sudo pip install future pymavlink MAVProxy
gedit ~/.bashrc
export PATH=$PATH:$HOME/ardupilot/Tools/autotest
export PATH=/usr/lib/ccache:$PATH
. ~/.bashrc

cd ~/ardupilot/ArduCopter
sim_vehicle.py -w
