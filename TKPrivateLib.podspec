#
#  Be sure to run `pod spec lint TKPrivateLib.podspec' to ensure this is a
#  valid spec and to remove all comments including this before submitting the spec.
#
#  To learn more about Podspec attributes see https://guides.cocoapods.org/syntax/podspec.html
#  To see working Podspecs in the CocoaPods repo see https://github.com/CocoaPods/Specs/
#

Pod::Spec.new do |spec|

  spec.name         = "TKPrivateLib"
  spec.version      = "0.0.1"
  spec.summary      = "A short description of TKPrivateLib."
  spec.homepage     = "https://github.com/stkusegithub/TKPrivateLib"
  spec.license      = { :type => "MIT", :file => "FILE_LICENSE" }
  spec.author             = { "Bruce_kun" => "1164413398@qq.com" }
  spec.source       = { :git => "https://github.com/stkusegithub/TKPrivateLib.git", :tag => "#{spec.version}" }

  spec.platform     = :ios, "9.0"
  #  When using multiple platforms
  # spec.ios.deployment_target = "5.0"
  # spec.osx.deployment_target = "10.7"
  # spec.watchos.deployment_target = "2.0"
  # spec.tvos.deployment_target = "9.0"


  spec.source_files  = "TKPrivateLib", "TKPrivateLib/Classes/**/*"

  # spec.exclude_files = "Classes/Exclude"
  # spec.public_header_files = "Classes/**/*.h"
  # spec.resource  = "icon.png"
  # spec.resources = "Resources/*.png"
  # spec.preserve_paths = "FilesToSave", "MoreFilesToSave"

  # spec.framework  = "SomeFramework"
  # spec.frameworks = "SomeFramework", "AnotherFramework"

  # spec.library   = "iconv"
  # spec.libraries = "iconv", "xml2"

  # spec.requires_arc = true
  # spec.xcconfig = { "HEADER_SEARCH_PATHS" => "$(SDKROOT)/usr/include/libxml2" }

  # spec.dependency "JSONKit", "~> 1.4"

end
