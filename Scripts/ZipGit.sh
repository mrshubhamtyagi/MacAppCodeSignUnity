echo "----- Creating Zip"
AppName="AppName"

ditto -c -k --sequesterRsrc --keepParent "$AppName.app" "$AppName.zip"

echo "----- Zip Created"