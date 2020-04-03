source 'https://github.com/CocoaPods/Specs.git'

platform :ios, '10.0'

use_frameworks!

# ignore all warnings from all pods
inhibit_all_warnings!

target 'Write_' do

  pod 'R.swift', '~> 5.0.0'
  pod 'RxCocoa', '~> 5.0.0'
  pod 'RxDataSources', '~> 4.0.0'

  pod 'SwiftLint', '~> 0.31.0'
  pod 'SwiftFormat/CLI', '~> 0.44.0'

  target 'Write_Tests' do
    inherit! :search_paths

    pod 'RxBlocking', '~> 5.0.0'
    pod 'RxTest', '~> 5.0.0'
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
