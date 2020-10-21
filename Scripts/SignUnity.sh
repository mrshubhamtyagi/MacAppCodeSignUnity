#!/bin/bash
AppName="AppName"
DeveloperCertificate="3rd Party Mac Developer Application: Developer Name"
AppPath="./$AppName.app"
CodeForSigning="codesign -o runtime -f --deep -s"

echo "----- Setting Permission"
sudo chmod -R a+xr "$AppPath"
echo "----- Copying Provisional"
cp ./embedded.provisionprofile $AppPath/Contents/


echo "----- Singning Library libcrypto.dylib"
$CodeForSigning "$DeveloperCertificate" --entitlements "./$AppName.entitlements" "$AppPath/Contents/Frameworks/libcrypto.dylib"
echo "----- Singning Library libssl.dylib"
$CodeForSigning "$DeveloperCertificate" --entitlements "./$AppName.entitlements" "$AppPath/Contents/Frameworks/libssl.dylib"
echo "----- Singning Library UnityPlayer.dylib"
$CodeForSigning "$DeveloperCertificate" --entitlements "./$AppName.entitlements" "$AppPath/Contents/Frameworks/UnityPlayer.dylib"
echo "----- Singning Library libmonobdwgc-2.0.dylib"
$CodeForSigning "$DeveloperCertificate" --entitlements "./$AppName.entitlements" "$AppPath/Contents/Frameworks/MonoBleedingEdge/MonoEmbedRuntime/osx/libmonobdwgc-2.0.dylib"
echo "----- Singning Library libMonoPosixHelper.dylib"
$CodeForSigning "$DeveloperCertificate" --entitlements "./$AppName.entitlements" "$AppPath/Contents/Frameworks/MonoBleedingEdge/MonoEmbedRuntime/osx/libMonoPosixHelper.dylib"


echo "----- Singning Plugin.bundle"
$CodeForSigning "$DeveloperCertificate" --entitlements "./$AppName.entitlements" "$AppPath/Contents/Plugins/PluginName.bundle"

echo "----- Singning Entire Application"
$CodeForSigning "$DeveloperCertificate" --entitlements "./$AppName.entitlements" "$apppath"


echo "----- Singning Completed"