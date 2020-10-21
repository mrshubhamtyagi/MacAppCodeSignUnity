#!/bin/bash
UserName="email@id.com"
ProviderName="PROVIDERNAME"
BundleID="com.bundle.id"
Pass="mfpv-iylb-cpvn-ojdd"
ZipName="./AppName.zip"

echo "----- Uploading the Zip to the notarization service"
xcrun altool --notarize-app --username $UserName --password $Pass --asc-provider $ProviderName --primary-bundle-id $BundleID --file $ZipName

echo "----- Completed! Check your email with the subject 'Your Mac software was successfully notarized'"

# Use the below cmd to get the Prodiver Long and Short name for "mfpv-iylb-cpvn-ojdd" APP
# xcrun iTMSTransporter -m provider -u $UserName -p mfpv-iylb-cpvn-ojdd
