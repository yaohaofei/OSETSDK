Pod::Spec.new do |s|

  s.name         = "OSETSDK"
  s.version      = "4.8.0.2"
  s.summary      = "Objective-C编程基础工具类"

  s.homepage     = "https://github.com/yaohaofei/OSETSDK"

  s.license      = { :type => "MIT", :file => "LICENSE" }
  s.author           = { 'yaohaofei' => '313888178@qq.com' }

  s.platform     = :ios
  s.platform     = :ios, "9.0"

  s.source       = { :git => "https://github.com/yaohaofei/OSETSDK.git", :tag => "#{s.version}" }

  s.source_files  = "OSETSDK", "OSETSDK/OSETSDK.framework/Headers/*.{h,m}"
  s.frameworks = "Foundation", "UIKit"
    ##s.dependency 'LixMacro', '~> 0.0.3'
  s.vendored_frameworks = 'OSETSDK/OSETSDK.framework'
s.pod_target_xcconfig = { 'VALID_ARCHS' => 'armv7 arm64' }

end
