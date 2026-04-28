#!/bin/bash

# Android SDK ফোল্ডার তৈরি করা
mkdir -p /workspaces/android-sdk/cmdline-tools
cd /workspaces/android-sdk/cmdline-tools

# Command Line Tools ডাউনলোড করা
wget https://dl.google.com/android/repository/commandlinetools-linux-10406996_latest.zip -O cmdline-tools.zip
unzip cmdline-tools.zip
mv cmdline-tools latest
rm cmdline-tools.zip

# এনভায়রনমেন্ট ভেরিয়েবল সেট করা
export ANDROID_HOME=/workspaces/android-sdk
export PATH=$PATH:$ANDROID_HOME/cmdline-tools/latest/bin:$ANDROID_HOME/platform-tools

# লাইসেন্স একসেপ্ট করা এবং SDK 36 ইন্সটল করা
yes | sdkmanager --licenses
sdkmanager "platform-tools" "platforms;android-36" "build-tools;34.0.0"

# টার্মিনালে সবসময় যেন SDK কাজ করে তার জন্য bashrc আপডেট করা
echo 'export ANDROID_HOME=/workspaces/android-sdk' >> ~/.bashrc
echo 'export PATH=$PATH:$ANDROID_HOME/cmdline-tools/latest/bin:$ANDROID_HOME/platform-tools' >> ~/.bashrc

echo "✅ Android SDK 36 and Build Tools Installed Successfully!"