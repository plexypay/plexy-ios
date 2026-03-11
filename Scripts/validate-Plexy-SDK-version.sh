#!/bin/sh

plexySdkVersion=$(agvtool what-marketing-version -terse1)
plexyHelpersPlexySdkVersion=$(sed -En 's/^.*public.*let.*plexySdkVersion.*:.*String.*=.*"([0-9]+.[0-9]+.[0-9]+)".*$/\1/p' Plexy/Helpers/PlexySdkVersion.swift)
cocoapodsPlexySdkVersion=$(sed -En "s/^.*s.version.*=.*'([0-9]+.[0-9]+.[0-9]+)'.*$/\1/p" Plexy.podspec)

echo '\nPlexy SDK Version Validation'
echo '-----------------------------------------------------'
echo "CFBundleShortVersionString: $plexySdkVersion"
echo "PlexySdkVersion.swift:      $plexyHelpersPlexySdkVersion"
echo "Plexy.podspec:              $cocoapodsPlexySdkVersion"
echo '------------------------------------------------------\n'

declare -a array=( $plexySdkVersion $plexyHelpersPlexySdkVersion $cocoapodsPlexySdkVersion )

declare -a uniq=($(echo "${array[@]}" | tr ' ' '\n' | sort -u | tr '\n' ' '))

if [ ${#uniq[@]} -ne 1 ]; then
  RED='\033[0;31m'
  NC='\033[0m'
  echo "[ERROR] : ${RED}Plexy SDK version in Info.plist (CFBundleShortVersionString), Plexy.podspec, and PlexySdkVersion.swift files do not match, please fix the conflict and try to commit again.${NC}"
  exit 1
fi
