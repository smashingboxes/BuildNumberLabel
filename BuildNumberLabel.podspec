Pod::Spec.new do |s|

  s.name          = "BuildNumberLabel"
  s.version       = "0.0.1"
  s.summary       = "Put a build number on it!"
  s.description   = "Put a build number on it!"
  s.homepage      = "https://github.com/smashingboxes/buildnumberlabel"
  s.license       = "MIT"
  s.author        = { "David Sweetman" => "david@davidsweetman.com" }
  s.platform      = :ios
  s.source        = { :git => "https://github.com/smashingboxes/BuildNumberLabel.git", :tag => "0.0.1" }
  s.source_files  = "BuildNumberLabel/**/*.{swift}"

  s.framework     = "UIKit"

end
