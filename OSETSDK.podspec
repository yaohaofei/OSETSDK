Pod::Spec.new do |s|

  s.name         = "OSETSDK"
  s.version      = "4.8.0.0"
  s.summary      = "Objective-C编程基础工具类"

  s.homepage     = "https://github.com/yaohaofei/OSETSDK"

  #s.license      = "MIT"
  s.license      = { :type => "MIT", :file => "LICENSE" }


  s.author             = { "Lix" => "xiao.liunit@gmail.com" }

  s.platform     = :ios
  s.platform     = :ios, "9.0"

  s.source       = { :git => "https://github.com/yaohaofei/OSETSDK.git", :tag => "#{s.version}" }

  s.source_files  = "OSETSDK", "OSETSDK/**/*.{h,m}"
  s.frameworks = "Foundation", "UIKit"
  #s.dependency 'LixMacro', '~> 0.0.3'

end
