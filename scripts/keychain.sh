#!/bin/sh

DIR=tmp/certs
KEYCHAIN=$HOME/Library/Keychains/ios-build.keychain
KEYCHAIN_PASSWORD=`openssl rand -base64 48`
rm -rf $DIR
mkdir -p $DIR
echo $APPLE_AUTHORITY_BASE64 | base64 -D > $DIR/apple.cer
echo $DISTRIBUTION_P12KEY | base64 -D > $DIR/dist.p12
echo $DISTRIBUTION_CERTIFICATE | base64 -D > $DIR/dist.cer
security create-keychain -p "$KEYCHAIN_PASSWORD" ios-build.keychain
security import $DIR/apple.cer -k $KEYCHAIN -T /usr/bin/codesign
security import $DIR/dist.cer  -k $KEYCHAIN -T /usr/bin/codesign
security import $DIR/dist.p12  -k $KEYCHAIN -T /usr/bin/codesign -P "$P12KEY_PASSWORD"
security list-keychain -s $KEYCHAIN
security unlock-keychain -p "$KEYCHAIN_PASSWORD" $KEYCHAIN
rm -rf $DIR
