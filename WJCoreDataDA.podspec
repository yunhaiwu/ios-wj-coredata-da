
Pod::Spec.new do |s|

  s.name         = "WJCoreDataDA"

  s.version      = "1.0"

  s.summary      = "A short description of WJCoreDataDA."

  s.homepage     = "https://github.com/yunhaiwu"

  s.license      = { :type => "MIT", :file => "LICENSE" }

  s.author       = { "Marin Usalj" => "mneorr@gmail.com" }

  s.source           = { :git => "https://github.com/yunhaiwu/ios-wj-coredata-da.git", :tag => "#{s.version}" }

  s.platform     = :ios, "5.0"

  s.source_files = "Classes/*.{h,m}"

  s.exclude_files = "Example"

  s.requires_arc = true

  s.framework  = 'CoreData', 'UIKit', 'Foundation'

  s.dependency "WJCommon/Core"
  s.dependency "WJCommon/Utils"
  s.dependency "WJLoggingAPI"

end
