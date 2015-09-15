#!/bin/sh

DIR=tmp/certs
KEYCHAIN=$HOME/Library/Keychains/ios-build.keychain
KEYCHAIN_PASSWORD=`openssl rand -base64 48`
rm -rf $DIR
mkdir -p $DIR
echo $APPLE_CERTIFICATE | base64 -D > $DIR/apple.cer
echo $DISTRIBUTION_P12KEY | base64 -D > $DIR/dist.p12
echo $DISTRIBUTION_CERTIFICATE | base64 -D > $DIR/dist.cer
security create-keychain -p "$KEYCHAIN_PASSWORD" ios-build.keychain
security import $DIR/apple.cer -k $KEYCHAIN -T /usr/bin/codesign
security import $DIR/dist.cer  -k $KEYCHAIN -T /usr/bin/codesign
security import $DIR/dist.p12  -k $KEYCHAIN -T /usr/bin/codesign -P "$P12KEY_PASSWORD"
security list-keychain -s $KEYCHAIN
security unlock-keychain -p "$KEYCHAIN_PASSWORD" $KEYCHAIN
rm -rf $DIR

PROVISIONING=~/Library/MobileDevice/Provisioning\ Profiles
mkdir -p "$PROVISIONING"
ios profiles:download:all --type distribution -u $APPLE_DEVELOPER_ID -p $APPLE_DEVELOPER_PASSWORD --team "$DISTRIBUTION_NAME"
echo "./App.mobileprovision -> $PROVISIONING_PROFILE.mobileprovision"
mv ./App.mobileprovision "$PROVISIONING/$PROVISIONING_PROFILE.mobileprovision"
rm -rf *.mobileprovision