#Install required packages
echo "Installing required packages"
sudo apt-get update -y && sudo apt-get upgrade -y
sudo apt-get install -y curl git unzip xz-utils zip libglu1-mesa

#Install FlutterSDK
echo "Installing FlutterSDK"
git clone -b main https://github.com/flutter/flutter.git
./flutter/bin/flutter --version

#Install Android studio
echo "Installing Android studio"
curl -# -O https://edgedl.me.gvt1.com/android/studio/ide-zips/2025.3.2.6/android-studio-panda2-linux.tar.gz

#Install VS Code
echo "Installing VS Code"
curl -# -O https://vscode.download.prss.microsoft.com/dbazure/download/stable/61b3d0ab13be7dda2389f1d3e60a119c7f660cc3/code_1.110.1-1772839366_amd64.deb