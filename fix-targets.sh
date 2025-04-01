#!/bin/bash
cordova prepare ios
cp Podfile.backup platforms/ios/Podfile
cd platforms/ios
pod install
cd ../..
find platforms/ios -type f -name "*.pbxproj" -exec sed -i '' 's/IPHONEOS_DEPLOYMENT_TARGET = 11.0/IPHONEOS_DEPLOYMENT_TARGET = 15.0/g' {} \;
find platforms/ios -type f -name "*.pbxproj" -exec sed -i '' 's/IPHONEOS_DEPLOYMENT_TARGET = 8.0/IPHONEOS_DEPLOYMENT_TARGET = 15.0/g' {} \;
find platforms/ios -type f -name "*.pbxproj" -exec sed -i '' 's/IPHONEOS_DEPLOYMENT_TARGET = 13.0/IPHONEOS_DEPLOYMENT_TARGET = 15.0/g' {} \;
echo "Deployment targets fixed to 15.0"