Pod::Spec.new do |s|
  s.name = 'Plexy'
  s.version = '5.20.1'
  s.summary = "Plexy Components for iOS"
  s.description = <<-DESC
    Plexy Components for iOS allows you to accept in-app payments by providing you with the building blocks you need to create a checkout experience.
  DESC

  s.homepage = 'https://plexy.com'
  s.license = { :type => 'MIT', :file => 'LICENSE' }
  s.author = { 'Plexy' => 'support@plexy.com' }
  s.source = { :git => 'https://github.com/plexypay/plexy-ios.git', :tag => "#{s.version}" }
  s.platform = :ios
  s.ios.deployment_target = '12.0'
  s.swift_version = '5.7'
  s.frameworks = 'Foundation'
  s.default_subspecs = 'Core', 'Components', 'Actions', 'Card', 'Encryption', 'DropIn', 'Session'
  s.pod_target_xcconfig = {'SWIFT_SUPPRESS_WARNINGS' => 'YES' }

  s.subspec 'DropIn' do |plugin|
    plugin.source_files = 'PlexyDropIn/**/*.swift'
    plugin.dependency 'Plexy/Core'
    plugin.dependency 'Plexy/Actions'
    plugin.dependency 'Plexy/Card'
    plugin.dependency 'Plexy/Encryption'
    plugin.dependency 'Plexy/Components'
  end

  # Payment Methods
  s.subspec 'WeChatPay' do |plugin|
    plugin.source_files = 'PlexyWeChatPay/**/*.swift'
    plugin.dependency 'Plexy/Core'
    plugin.dependency 'Plexy/Actions'
    plugin.dependency 'PlexyWeChatPayInternal', '2.2.0'
  end

  s.subspec 'CashAppPay' do |plugin|
    plugin.source_files = 'PlexyCashAppPay/**/*.swift'
    plugin.dependency 'Plexy/Core'
    plugin.dependency 'CashAppPayKit', '0.6.2'
    plugin.dependency 'CashAppPayKitUI', '0.6.2'
  end

  s.subspec 'PlexyTwint' do |plugin|
    plugin.source_files = 'PlexyTwint/**/*.swift'
    plugin.dependency 'Plexy/Core'
    plugin.vendored_frameworks = 'XCFramework/Dynamic/TwintSDK.xcframework'
  end

  s.subspec 'Card' do |plugin|
    plugin.dependency 'Plexy/Core'
    plugin.dependency 'Plexy/Encryption'
    plugin.source_files = 'PlexyCard/**/*.swift'
    plugin.exclude_files = 'PlexyCard/**/BundleSPMExtension.swift'
    plugin.resource_bundles = {
        'PlexyCard' => [
            'PlexyCard/Assets/**/*.xcassets'
        ]
    }
  end

  s.subspec 'CardScanner' do |plugin|
    plugin.dependency 'PlexyCardScanner'
  end

  s.subspec 'Components' do |plugin|
    plugin.dependency 'Plexy/Core'
    plugin.dependency 'Plexy/Encryption'
    plugin.source_files = 'PlexyComponents/**/*.swift'
  end

  s.subspec 'Session' do |plugin|
    plugin.dependency 'Plexy/Core'
    plugin.dependency 'Plexy/Actions'
    plugin.source_files = 'PlexySession/**/*.swift'
  end

  s.subspec 'Actions' do |plugin|
    plugin.dependency 'Plexy/Core'
    plugin.dependency 'Plexy3DS2', '2.4.3'
    plugin.source_files = 'PlexyActions/**/*.swift'
    plugin.exclude_files = 'PlexyActions/**/BundleSPMExtension.swift'
    plugin.resource_bundles = {
        'PlexyActions' => [
            'PlexyActions/Assets/**/*.xcassets'
        ]
    }
  end

  s.subspec 'Encryption' do |plugin|
    plugin.source_files = 'PlexyEncryption/**/*.swift'
  end

  s.subspec 'SwiftUI' do |plugin|
    plugin.source_files = 'PlexySwiftUI/**/*.swift'
  end
  
  s.subspec 'DelegatedAuthentication' do |plugin|
    plugin.source_files = 'PlexyDelegatedAuthentication/**/*.swift'
    plugin.dependency 'PlexyAuthentication', '3.1.0'
  end

  s.subspec 'Core' do |plugin|
    plugin.source_files = 'Plexy/**/*.swift'
    plugin.exclude_files = 'Plexy/**/BundleSPMExtension.swift'
    plugin.dependency 'PlexyNetworking', '3.0.1'
    plugin.resource_bundles = {
        'Plexy' => [
            'Plexy/Assets/**/*.strings',
            'Plexy/Assets/**/*.xcassets',
            'Plexy/PrivacyInfo.xcprivacy'
        ]
    }
  end

end
