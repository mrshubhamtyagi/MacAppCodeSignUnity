#!/bin/bash
AppName="AppName"
DeveloperName="Developer Name"
AppLicationCertificate="3rd Party Mac Developer Application"
AppPath="./$AppName.app"


CodeForSigning="codesign --force --verify --verbose --timestamp --options runtime"


echo "----- Setting Permission"
sudo chmod -R a+xr "$AppPath"

echo "----- Copying Provisional"
cp ./embedded.provisionprofile $AppPath/Contents/

echo "----- Singning Library libcrypto.dylib"
$CodeForSigning --entitlements "$AppName.entitlements" --sign "$AppLicationCertificate: $DeveloperName" "$AppPath/Contents/Frameworks/libcrypto.dylib"

echo "----- Singning Library libssl.dylib"
$CodeForSigning --entitlements "$AppName.entitlements" --sign "$AppLicationCertificate: $DeveloperName" "$AppPath/Contents/Frameworks/libssl.dylib"

echo "----- Singning Library UnityPlayer.dylib"
$CodeForSigning --entitlements "$AppName.entitlements" --sign "$AppLicationCertificate: $DeveloperName" "$AppPath/Contents/Frameworks/UnityPlayer.dylib"

echo "----- Singning Library libmonobdwgc-2.0.dylib"
$CodeForSigning --entitlements "$AppName.entitlements" --sign "$AppLicationCertificate: $DeveloperName" "$AppPath/Contents/Frameworks/MonoBleedingEdge/MonoEmbedRuntime/osx/libmonobdwgc-2.0.dylib"

echo "----- Singning Library libMonoPosixHelper.dylib"
$CodeForSigning --entitlements "$AppName.entitlements" --sign "$AppLicationCertificate: $DeveloperName" "$AppPath/Contents/Frameworks/MonoBleedingEdge/MonoEmbedRuntime/osx/libMonoPosixHelper.dylib"


echo "----- Singning Plugin.bundle"
$CodeForSigning --entitlements "$AppName.entitlements" --sign "$AppLicationCertificate: $DeveloperName" "$AppPath/Contents/Plugins/PluginName.bundle"


echo "----- Singning Entire Application"
$CodeForSigning --entitlements "$AppName.entitlements" --sign "$AppLicationCertificate: $DeveloperName" "$AppPath"

echo "----- Singning Completed"