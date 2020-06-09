#
#  Be sure to run `pod spec lint ModuleCommon.podspec' to ensure this is a
#  valid spec and to remove all comments including this before submitting the spec.
#
#  To learn more about Podspec attributes see https://guides.cocoapods.org/syntax/podspec.html
#  To see working Podspecs in the CocoaPods repo see https://github.com/CocoaPods/Specs/
#

Pod::Spec.new do |spec|

  spec.name         = "ModuleCommon"
  spec.version      = "0.0.1"
  spec.summary      = "A short description of ModuleCommon."
  spec.description  = <<-DESC
      ModuleCommon
                   DESC

  spec.homepage     = "http://zzb/ModuleCommon"
  spec.license      = "MIT"
  spec.author       = "Cary"

  spec.platform     = :ios
  spec.ios.deployment_target = "10.0"

  spec.source       = { :git => "http://zzb/ModuleCommon.git", :tag => "#{spec.version}" }
  spec.source_files  = "Classes", "Classes/**/*.{h,m,swift}"
  spec.exclude_files = "Classes/Exclude"
  spec.resources    = "Resources/**/*.{xib,storyboard,bundle,xcassets,aac,plist,xml,json,strings,html,css,js}"
  spec.requires_arc = true

end
