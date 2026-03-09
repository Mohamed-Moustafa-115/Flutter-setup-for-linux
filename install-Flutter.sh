#Get user's home directory
read -p  "👤 Current home username: "    USER_NAME
cd /home/$USER_NAME
mkdir "Flutter IDE"

#Install required packages
echo "Installing required packages"
#sudo apt-get update -y && sudo apt-get upgrade -y
sudo apt-get install -y curl git unzip xz-utils zip libglu1-mesa

#Install FlutterSDK
echo "Installing FlutterSDK"
git clone -b main https://github.com/flutter/flutter.git
./flutter/bin/flutter --version
echo export PATH="$PATH:/home/$USER_NAME/flutter/bin" >> .bashrc
source .bashrc
flutter doctor

#Download and install JDK 17.0.12
cd Flutter\ IDE/
echo "Downloading JDK 17.0.12"
curl -# -O https://download.oracle.com/java/17/archive/jdk-17.0.12_linux-x64_bin.deb
ls -l
echo "Installing JDK 17.0.12 (Enter your sudo password)"
sudo apt install ./jdk-17.0.12_linux-x64_bin.deb -y

#Download Android studio
echo "Downloading Android studio"
curl -# -O https://edgedl.me.gvt1.com/android/studio/ide-zips/2025.3.2.6/android-studio-panda2-linux.tar.gz

#Download VS Code
echo "Downloading VS Code"
curl -# -O https://vscode.download.prss.microsoft.com/dbazure/download/stable/61b3d0ab13be7dda2389f1d3e60a119c7f660cc3/code_1.110.1-1772839366_amd64.deb
