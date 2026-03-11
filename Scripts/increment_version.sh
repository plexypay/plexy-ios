#!/bin/bash

PODSPEC_PATH=Plexy.podspec
PLEXY_SDK_VERSION_PATH='./Plexy/Helpers/PlexySdkVersion.swift'
PLEXY_README_PATH='./README.md'
PLEXY_GITHUB_DOCS_PREFIX='https:\/\/plexypay.github.io\/plexy-ios\/'
PLEXY_GITHUB_DOCS_SUFFIX='\/documentation\/plexy'
CURRENT_VERSION=`agvtool mvers -terse1`
CURRENT_BUILD=`agvtool vers -terse`

echo ""
echo "Current Version: ${CURRENT_VERSION} (${CURRENT_BUILD})"
echo ""

NEW_VERSION=$1

if [ -n "$NEW_VERSION" ]
then
  agvtool new-marketing-version $NEW_VERSION
  agvtool next-version # Bumping build number

  sed -i '' -e "s/$CURRENT_VERSION/$NEW_VERSION/" $PODSPEC_PATH
  sed -i '' '$d' $PLEXY_SDK_VERSION_PATH && echo 'public let plexySdkVersion: String = "'$NEW_VERSION'"' >> $PLEXY_SDK_VERSION_PATH
  sed -i '' -e 's/'$PLEXY_GITHUB_DOCS_PREFIX'.*'$PLEXY_GITHUB_DOCS_SUFFIX'/'$PLEXY_GITHUB_DOCS_PREFIX''$NEW_VERSION''$PLEXY_GITHUB_DOCS_SUFFIX'/g' $PLEXY_README_PATH
fi

CURRENT_VERSION=`agvtool mvers -terse1`
CURRENT_BUILD=`agvtool vers -terse`

echo "New Version:     ${CURRENT_VERSION} (${CURRENT_BUILD})"
echo ""

echo "### New Version: ${CURRENT_VERSION} (${CURRENT_BUILD})" >> $GITHUB_STEP_SUMMARY
