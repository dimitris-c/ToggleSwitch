Pod::Spec.new do |s|
 s.name = 'ToggleSwitch'
 s.version = '1.3'
 s.license = { :type => "MIT", :file => "LICENSE" }
 s.summary = 'A custom UISwitch'
 s.homepage = 'https://decimal.digital'
 s.authors = { "Dimitris C." => "hello@decimal.gr" }
 s.source = { :git => "https://github.com/dimitris-c/ToggleSwitch.git", :tag => s.version.to_s }
 s.platforms     = { :ios => "11.0" }
 s.requires_arc = true

 s.default_subspec = "Core"
 s.subspec "Core" do |ss|
     ss.source_files  = "Sources/*.swift"
     ss.framework  = "UIKit"
 end

end
