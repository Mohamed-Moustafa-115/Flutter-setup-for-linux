#Get user's home directory
USER_NAME=$(whoami)
cd /home/$USER_NAME
echo -e "\e[46mCreating a directory for Flutter requirements\e[0m"
mkdir "Flutter Requirements"

#Install required packages
echo -e "\e[46mUpdating and installing required packages\e[0m"
sudo apt-get update -y && sudo apt-get upgrade -y
sudo apt-get install -y curl unzip xz-utils zip libglu1-mesa

#Install FlutterSDK
echo -e "\e[46mInstalling FlutterSDK\e[0m"
git clone -b main https://github.com/flutter/flutter.git
./flutter/bin/flutter --version
echo export PATH="$PATH:/home/$USER_NAME/flutter/bin" >> .bashrc
source .bashrc
flutter doctor

#Download and install JDK 17.0.12
cd "Flutter Requirements"
echo -e "\e[46mDownloading JDK 17.0.12\e[0m"
curl -# -O https://download.oracle.com/java/17/archive/jdk-17.0.12_linux-x64_bin.deb
ls -l
echo -e "\e[46mInstalling JDK 17.0.12 (Enter your sudo password)\e[0m"
sudo apt install ./jdk-17.0.12_linux-x64_bin.deb -y

#Download VS Code
echo -e "\e[46mDownloading VS Code\e[0m"
curl -# -O https://vscode.download.prss.microsoft.com/dbazure/download/stable/6928394f91b684055b873eecb8bc281365131f1c/code_1.124.2-1781225536_amd64.deb
echo -e "\e[46mInstalling VS Code\e[0m"
sudo apt install ./code_1.124.2-1781225536_amd64.deb -y

#Download and install Android studio
echo -e "\e[46mDownloading Android studio\e[0m"
curl -# -O https://edgedl.me.gvt1.com/android/studio/ide-zips/2026.1.1.9/android-studio-quail1-patch1-linux.tar.gz
tar -xzvf 'android-studio-quail1-patch1-linux.tar.gz' --checkpoint=.1000
mv "android-studio" ../
cd ../

while true; do
    # For GitHub Actions, use an environment variable
  if [ -n "$GITHUB_ACTIONS" ]; then
    # In GitHub Actions, skip prompt or use env var
      CHOICE="${INPUT_KEEP_FOLDER:-n}"  # Use input variable or default to 'n'
      echo "GitHub Actions detected, using: $CHOICE"
  else
      # Interactive terminal
      read -p "Do you want to keep Flutter Requirements folder (Setup packages) y/n" CHOICE
  fi
  if [ "$CHOICE" = "n" ] || [ "$CHOICE" = "N" ]; then
    sudo rm -rf "Flutter Requirements"
    echo -e "Flutter Requirements folder is removed"
    echo -e "Setup finsihed, now run Andriod Studio to download the remaining SDK components"
    break
  elif [ "$CHOICE" = "y" ] || [ "$CHOICE" = "Y" ]; then
    echo -e "\e[46mSetup finsihed, now run Android Studio to download the remaining SDK components\e[0m"
    break
  else
  echo -e "\e[41mInvalid input\e[0m"
  fi
done
