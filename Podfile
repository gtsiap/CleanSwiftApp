source 'https://github.com/CocoaPods/Specs.git'

platform :ios, '10.0'

use_frameworks!

# Don't show warnings from pods
inhibit_all_warnings!

pod 'RxSwift', '~> 4.0'

abstract_target 'Application' do
    pod 'RxDataSources', '~> 3.0'
    pod 'Kingfisher', '~> 4.8'

    target 'CleanSwiftApp' do
    end

    target 'Presentation' do
    end
end

target 'data' do
    pod 'RxCocoa', '~> 4.0'
end

target 'Domain' do

end


abstract_target 'Tests' do
    pod 'RxBlocking', '~> 4.0'

    target 'DomainTests' do
    end

    target 'dataTests' do
    end
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
