#!/bin/sh

ti build --platform ios --target dist-adhoc --distribution-name "$DISTRIBUTION_NAME" --pp-uuid $PROVISIONING_PROFILE --output-dir ./
misc/Crashlytics.framework/submit $CLASHLYTICS_API_KEY $CLASHLYTICS_BUILD_SECRET -groupAliases $CLASHLYTICS_GROUP_ALIASE -notifications YES -ipaPath ./App.ipa
