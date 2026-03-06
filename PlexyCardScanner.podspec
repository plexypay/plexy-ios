Pod::Spec.new do |s|
  s.name = 'PlexyCardScanner'
  s.version = '1.0.0'
  s.summary = "Plexy Card Scanner Module for iOS"

  s.homepage = 'https://plexy.money'
  s.license = { :type => 'MIT', :file => 'LICENSE' }
  s.author = { 'Plexy' => 'support@plexy.money' }

  s.source = { :git => 'https://github.com/plexypay/plexy-ios.git', :tag => "#{s.version}" }
  s.source_files = 'PlexyCardScanner/**/*.swift'
  s.framework = 'Foundation'
  s.ios.deployment_target = '12.0'
  s.swift_version = '5.7'

  s.pod_target_xcconfig = {
    'DEFINES_MODULE' => 'YES',
    'PRODUCT_MODULE_NAME' => 'PlexyCardScanner',
    'BUILD_LIBRARY_FOR_DISTRIBUTION' => 'YES'
  }
end
