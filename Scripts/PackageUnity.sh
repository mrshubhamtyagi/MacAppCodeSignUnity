#!/bin/bash
AppName="AppName.app"
InstallerCertificate="3rd Party Mac Developer Installer: Developer Name"

echo "----- Packaging game"
productbuild --component "$AppName" "/Applications" --sign "$InstallerCertificate" "$AppName.pkg"

echo "----- Package created" 