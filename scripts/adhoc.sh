#!/bin/sh

            
#ti build --platform ios --target dist-adhoc --distribution-name "$DISTRIBUTION_NAME" --pp-uuid $PROVISIONING_PROFILE --output-dir ./
#misc/Crashlytics.framework/submit $CLASHLYTICS_API_KEY $CLASHLYTICS_BUILD_SECRET -groupAliases $CLASHLYTICS_GROUP_ALIASE -notifications YES -ipaPath ./App.ipa

./Crashlytics.framework/submit 5bdbe9ae6136390bc29a6acb9e1dd772d61ec229 fd5426806991b769ee69e8cdfb5f925cb6d45367e68b531342b1d7fc0d776562 -emails satorupan@icloud.com notifications YES -ipaPath ./armoredSkeleton.ipa

#bundle exec fastlane deploy