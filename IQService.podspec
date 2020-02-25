#
#  Be sure to run `pod spec lint IQService.podspec' to ensure this is a
#  valid spec and to remove all comments including this before submitting the spec.
#
#  To learn more about Podspec attributes see https://docs.cocoapods.org/specification.html
#  To see working Podspecs in the CocoaPods repo see https://github.com/CocoaPods/Specs/
#

Pod::Spec.new do |spec|


  spec.name         = "IQService"
  spec.version      = "0.0.1"
  spec.summary      = "iOS端模块间通信解决方案。"
  spec.description  = <<-DESC
A solution for decoupling modules in iOS platform.
                   DESC
  spec.homepage     = "https://github.com/Lobster-King/IQService"
  spec.license      = "MIT"
  spec.author             = { "Lobster-King" => "zhiwei.geek@gmail.com" }
  spec.ios.deployment_target = '7.0'
  spec.source       = { :git => "https://github.com/Lobster-King/IQService.git", :tag => "#{spec.version}" }
  spec.source_files  = "IQService", "IQService/**/*.{h,m}"
  spec.exclude_files = "IQService/Exclude"

end
