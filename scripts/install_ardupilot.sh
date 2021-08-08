# Clone ArduPilot
cd ~
sudo apt install git
git clone https://github.com/ArduPilot/ardupilot.git
cd ardupilot
git checkout Copter-4.1
git submodule update --init --recursive

# Install Dependencies
sudo apt install python-matplotlib python-serial python-wxgtk3.0 python-wxtools python-lxml python-scipy python-opencv ccache gawk python-pip python-pexpect

# Install MAVProxy
sudo pip install future pymavlink MAVProxy
echo "export PATH=$PATH:$HOME/ardupilot/Tools/autotest" >> ~/.bashrc
echo "export PATH=/usr/lib/ccache:$PATH" >> ~/.bashrc
. ~/.bashrc

cd ~/ardupilot/ArduCopter
sim_vehicle.py -w
