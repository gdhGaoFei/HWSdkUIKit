#
# Be sure to run `pod lib lint HWSdkUIKit.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'HWSdkUIKit'
  s.version          = '0.1.0'
  s.summary          = 'A short description of HWSdkUIKit.'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
TODO: Add long description of the pod here.
                       DESC

  s.homepage         = 'https://github.com/gdhgaofei@163.com/HWSdkUIKit'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'gdhgaofei@163.com' => 'gdhgaofei@163.com' }
  s.source           = { :git => 'https://github.com/gdhgaofei@163.com/HWSdkUIKit.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.ios.deployment_target = '9.0'

  s.source_files = 'HWSdkUIKit/Classes/**/*'
  
  # s.resource_bundles = {
  #   'HWSdkUIKit' => ['HWSdkUIKit/Assets/*.png']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  s.dependency "Masonry", "1.1.0"
  s.dependency "MBProgressHUD", "1.2.0"
  s.dependency "ReactiveObjC", "3.1.1"
  s.dependency "MJRefresh", "3.7.5"
  s.dependency "YYCategories", "1.0.4"
end