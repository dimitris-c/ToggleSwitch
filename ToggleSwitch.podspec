Pod::Spec.new do |s|
 s.name = 'ToggleSwitch'
 s.version = '1.0'
 s.license = { :type => "MIT", :file => "LICENSE" }
 s.summary = 'A custom UISwitch'
 s.homepage = 'http://decimal.gr'
 s.social_media_url = 'https://twitter.com/decimalstudio'
 s.authors = { "Dimitris C." => "hello@decimal.gr" }
 s.source = { :git => "https://github.com/Decimal/ToggleSwitch.git", :tag => "v"+s.version.to_s }
 s.platforms     = { :ios => "8.0", :osx => "10.10", :tvos => "9.0", :watchos => "2.0" }
 s.requires_arc = true

 s.default_subspec = "Core"
 s.subspec "Core" do |ss|
     ss.source_files  = "Sources/*.swift"
     ss.framework  = "Foundation"
 end

end
