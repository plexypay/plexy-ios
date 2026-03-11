Pod::Spec.new do |s|
  s.name = 'Plexy'
  s.version = '4.0.0'
  s.summary = "Plexy Components for iOS"
  s.description = <<-DESC
    Plexy Components for iOS allows you to accept in-app payments by providing you with the building blocks you need to create a checkout experience.
  DESC

  s.homepage = 'https://plexy.money'
  s.license = { :type => 'MIT', :file => 'LICENSE' }
  s.author = { 'Plexy' => 'support@plexy.money' }
  s.source = { :git => 'https://github.com/plexypay/plexy-ios.git', :tag => "#{s.version}" }
  s.platform = :ios
  s.ios.deployment_target = '12.0'
  s.swift_version = '5.7'
  s.frameworks = 'Foundation'
  s.default_subspecs = 'Core', 'Components', 'Actions', 'Card', 'Encryption', 'DropIn', 'Session'
  s.pod_target_xcconfig = {'SWIFT_SUPPRESS_WARNINGS' => 'YES' }

  s.subspec 'Core' do |plugin|
    plugin.source_files = 'Plexy/**/*.swift'
    plugin.exclude_files = 'Plexy/**/BundleSPMExtension.swift'
    plugin.dependency 'PlexyNetworking'
    plugin.resource_bundles = {
        'Plexy' => [
            'Plexy/Assets/**/*.strings',
            'Plexy/Assets/**/*.xcassets',
            'Plexy/PrivacyInfo.xcprivacy'
        ]
    }
  end

  s.subspec 'Encryption' do |plugin|
    plugin.source_files = 'PlexyEncryption/**/*.swift'
  end

  s.subspec 'SwiftUI' do |plugin|
    plugin.source_files = 'PlexySwiftUI/**/*.swift'
  end

  s.subspec 'Actions' do |plugin|
    plugin.dependency 'Plexy/Core'
    plugin.source_files = 'PlexyActions/**/*.swift'
    plugin.exclude_files = 'PlexyActions/**/BundleSPMExtension.swift'
    plugin.resource_bundles = {
        'PlexyActions' => [
            'PlexyActions/Assets/**/*.xcassets'
        ]
    }
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

  s.subspec 'DropIn' do |plugin|
    plugin.source_files = 'PlexyDropIn/**/*.swift'
    plugin.dependency 'Plexy/Core'
    plugin.dependency 'Plexy/Actions'
    plugin.dependency 'Plexy/Card'
    plugin.dependency 'Plexy/Encryption'
    plugin.dependency 'Plexy/Components'
  end

end
