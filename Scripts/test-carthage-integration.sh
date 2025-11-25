#!/bin/bash

set -e # Any subsequent(*) commands which fail will cause the shell script to exit immediately

function echo_header {
  echo " "
  echo "===   $1"
}

function print_help {
  echo "Test Carthage Integration"
  echo " "
  echo "test-carthage-integration [project name] [arguments]"
  echo " "
  echo "options:"
  echo "-h, --help                show brief help"
  echo "-c, --no-clean            ignore cleanup"
}

PROJECT_NAME=TempProject
NEED_CLEANUP=true

while test $# -gt 0; do
  case "$1" in
    -h|--help)
      print_help
      exit 0
      ;;
    -c|--no-clean)
      NEED_CLEANUP=false
      shift
      ;;
    -p|--project)
      PROJECT_NAME="$1"
      shift
      ;;
  esac
done

if [ "$NEED_CLEANUP" == true ]
then
  echo_header "Clean up $PROJECT_NAME"
  rm -rf $PROJECT_NAME
  mkdir -p $PROJECT_NAME && cd $PROJECT_NAME

  echo_header "Setup Carthage"
  CWD=$(pwd)
  CURRENT_COMMIT=$(git rev-parse HEAD)

  rm -rf Carthage
  rm -rf ~/Library/Caches/org.carthage.CarthageKit
  rm -rf ~/Library/Developer/Xcode/DerivedData

  echo "git \"file://$CWD/../\" \"$CURRENT_COMMIT\"" > Cartfile
  echo "github \"plexy/plexy-authentication-ios\" == 3.1.0" >> Cartfile
  carthage update --use-xcframeworks --configuration Debug
else
  cd $PROJECT_NAME
fi

echo_header "Generate Project"
echo "
name: $PROJECT_NAME
targets:
  $PROJECT_NAME:
    type: application
    platform: iOS
    sources: Source
    testTargets: Tests
    settings:
      base:
        INFOPLIST_FILE: Source/UIKit/Info.plist
        PRODUCT_BUNDLE_IDENTIFIER: com.plexy.$PROJECT_NAME
    dependencies:
      - framework: Carthage/Build/Plexy.xcframework
        embed: true
        codeSign: true
      - framework: Carthage/Build/PlexyActions.xcframework
        embed: true
        codeSign: true
      - framework: Carthage/Build/PlexyCard.xcframework
        embed: true
        codeSign: true
      - framework: Carthage/Build/PlexyCardScanner.xcframework
        embed: true
        codeSign: true
      - framework: Carthage/Build/PlexyComponents.xcframework
        embed: true
        codeSign: true
      - framework: Carthage/Build/PlexySession.xcframework
        embed: true
        codeSign: true
      - framework: Carthage/Build/PlexyDropIn.xcframework
        embed: true
        codeSign: true
      - framework: Carthage/Build/PlexyEncryption.xcframework
        embed: true
        codeSign: true
      - framework: Carthage/Build/PlexyWeChatPay.xcframework
        embed: true
        codeSign: true
      - framework: Carthage/Build/PlexyDelegatedAuthentication.xcframework
        embed: true
        codeSign: true
      - framework: Carthage/Checkouts/plexy-3ds2-ios/XCFramework/Dynamic/Plexy3DS2.xcframework
        embed: true
        codeSign: true
      - framework: Carthage/Build/PlexyNetworking.xcframework
        embed: true
        codeSign: true
      - framework: Carthage/Build/PlexyAuthentication.xcframework
        embed: true
        codeSign: true
      - framework: Carthage/Build/PlexySwiftUI.xcframework
        embed: true
        codeSign: true
  Tests:
    type: bundle.ui-testing
    platform: iOS
    sources: Tests
schemes:
  App:
    build:
      targets:
        $PROJECT_NAME: all
        Tests: [tests]
    test:
      commandLineArguments: "-UITests"
      targets:
        - Tests
" > project.yml

mkdir -p Tests
mkdir -p Source
cp "../Tests/IntegrationTests/DropIn Tests/DropInTests.swift" Tests/DropInTests.swift
cp "../Tests/IntegrationTests/DropIn Tests/DropInDelegateMock.swift" Tests/DropInDelegateMock.swift
cp "../Tests/IntegrationTests/DropIn Tests/StoredPaymentMethodDelegateMock.swift" Tests/StoredPaymentMethodDelegateMock.swift
cp "../Tests/IntegrationTests/Card Tests/Mocks/OpenExternalAppDetector+Mock.swift" Tests/OpenExternalAppDetector+Mock.swift
cp -r "../Tests/IntegrationTests/Card Tests/3DS2 Component/"* Tests/
cp "../Tests/IntegrationTests/Helpers/XCTestCase+RootViewController.swift" Tests/XCTestCase+RootViewController.swift
cp "../Tests/IntegrationTests/Helpers/XCTestCase+Wait.swift" Tests/XCTestCase+Wait.swift
cp "../Tests/IntegrationTests/Helpers/XCTestCase+Wait+UIKit.swift" Tests/XCTestCase+Wait+UIKit.swift
cp "../Tests/IntegrationTests/Helpers/UIViewController+Search.swift" Tests/UIViewController+Search.swift
cp "../Tests/IntegrationTests/Helpers/UIView+Search.swift" Tests/UIView+Search.swift
cp "../Tests/UnitTests/Helpers/PaymentMethods+Equatable.swift" Tests/PaymentMethods+Equatable.swift
cp "../Tests/UnitTests/Analytics/AnalyticsProviderMock.swift" Tests/AnalyticsProviderMock.swift
cp -r "../Tests/UnitTests/Mocks/"* Tests/
cp "../Tests/IntegrationTests/Actions Tests/ActionComponent/ActionComponentDelegateMock.swift" Tests/ActionComponentDelegateMock.swift
cp "../Tests/UnitTests/APIClientMock.swift" Tests/APIClientMock.swift
cp "../Tests/UnitTests/Helpers/String+UIImage.swift" Tests/String+UIImage.swift
cp "../Tests/UnitTests/Helpers/XCTestCase+Coder.swift" Tests/XCTestCase+Coder.swift
cp "../Tests/UnitTests/APIClientMock.swift" Source/APIClientMock.swift
cp -a "../Demo/Common" Source/
cp -a "../Demo/UIKit" Source/
cp "../Demo/Configuration.swift" Source/Configuration.swift
cp "../Demo/Configuration+secrets.swift" Source/Configuration+secrets.swift
cp "../Tests/IntegrationTests/Helpers/ErrorMock.swift" Tests/ErrorMock.swift

xcodegen generate

echo_header "Run Tests"
xcodebuild build test -project $PROJECT_NAME.xcodeproj -scheme App -destination "name=iPhone 16" -resultBundlePath ./TestResults CODE_SIGNING_REQUIRED=NO CODE_SIGNING_ALLOWED=NO | xcpretty && exit ${PIPESTATUS[0]}

if [ "$NEED_CLEANUP" == true ]
then
  echo_header "Clean up"
  cd ../
  rm -rf $PROJECT_NAME
fi 
