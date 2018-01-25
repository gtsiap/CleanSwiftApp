source 'https://github.com/CocoaPods/Specs.git'

platform :ios, '10.0'

use_frameworks!

# Don't show warnings from pods
inhibit_all_warnings!

pod 'RxSwift', '~> 4.0'

target 'CleanSwiftApp' do
    pod 'RxDataSources', '~> 3.0'
end

target 'data' do
end

target 'Domain' do
end

post_install do |installer|
    installer.pods_project.targets.each do |target|
        if target.name == 'RxSwift'
            target.build_configurations.each do |config|
                if config.name == 'Debug'
                    config.build_settings['OTHER_SWIFT_FLAGS'] ||= ['-D', 'TRACE_RESOURCES']
                end
            end
        end
    end
end
