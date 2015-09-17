#!/bin/sh

bundle exec ios profiles:download:all --type distribution -u "$ITUNES_CONNECT_ACCOUNT" -p "$ITUNES_CONNECT_PASSWORD" >/dev/null 2>&1
mkdir MobileProvisionings
mv *.mobileprovision MobileProvisionings