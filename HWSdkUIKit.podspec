#
# Be sure to run `pod lib lint HWSdkUIKit.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'HWSdkUIKit'
  s.version          = '0.1.2'
  s.summary          = 'A short description of HWSdkUIKit.'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
TODO: Add long description of the pod here.
                       DESC

  s.homepage         = 'https://github.com/gdhGaoFei/HWSdkUIKit'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { '华&梅' => 'gdhgaofei@163.com' }
  s.source           = { :git => 'https://github.com/gdhGaoFei/HWSdkUIKit.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.ios.deployment_target = '9.0'
  
  # mach-o 是否是静态库
  s.static_framework = true
  
  # 所有的源文件
  s.source_files = 'HWSdkUIKit/Classes/HWSdkUIKit.h'
  
  # 资源文件
  #s.resource_bundles = {
  #  'HWSdkUIKit' => ['HWSdkUIKit/Assets/*.bundle']
  #}
  #s.resource = "HWSdkUIKit.bundle"
  s.resource = 'HWSdkUIKit/**/*.bundle'

  # 暴露的头文件
  s.public_header_files = 'HWSdkUIKit/**/*.h'
  
  # 依赖系统的framework
  # s.frameworks = 'UIKit', 'MapKit'
  
  # 依赖一些第三方
  s.dependency "Masonry", "1.1.0"
  s.dependency "MBProgressHUD", "1.2.0"
  s.dependency "ReactiveObjC", "3.1.1"
  s.dependency "MJRefresh", "3.7.5"
  s.dependency "YYCategories", "1.0.4"
  
  
  # 进行分 文件夹展示
  # Macro
  s.subspec 'Macro' do |ss|
    ss.source_files = 'HWSdkUIKit/Classes/Macro/**/*.h'
    #ss.dependency 'HWSdkUIKit/Classes/HWSdkKit/HWSdkMacro.h'
  end
  
  # Common
  s.subspec 'Common' do |ss|
    ss.source_files = 'HWSdkUIKit/Classes/Common/**/*.{h,m}'
    #ss.dependency 'HWSdkUIKit/Classes/HWSdkKit/HWSdkMacro.h'
  end
  
  # HUD
  s.subspec 'HUD' do |ss|
    ss.source_files = 'HWSdkUIKit/Classes/HUD/**/*.{h,m}'
    s.dependency "MBProgressHUD", "1.2.0"
  end
  
  # HWSdkKit
  s.subspec 'HWSdkKit' do |ss|
    ss.source_files = 'HWSdkUIKit/Classes/HWSdkKit/**/*.{h,m}'
    #s.dependency "MBProgressHUD", "1.2.0"
  end
  
#  # Manager
#  s.subspec 'Manager' do |ss|
#    ss.source_files = 'HWMeetingSdkKit/Classes/Manager/**/*'
#    ss.dependency 'HWMeetingSdkKit/Classes/Header/HWSDKManager.h'
#  end
  
end
