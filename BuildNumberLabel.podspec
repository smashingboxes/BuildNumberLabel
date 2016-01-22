Pod::Spec.new do |s|

  s.name          = "BuildNumberLabel"
  s.version       = "0.0.1"
  s.summary       = "Put a build number on it!"
  s.description   = "Adding a build number label to an app is simple task, but it can get neglected.\n\nThis library promotes it from 'simple' to 'dead-simple', so there's no excuse! Now all your builds can have visible build numbers for testers & QA to reference."
  s.homepage      = "https://github.com/smashingboxes/buildnumberlabel"
  s.license       = "MIT"
  s.author        = { "David Sweetman" => "david@davidsweetman.com" }
  s.platform      = :ios, "8.0"
  s.source        = { :git => "https://github.com/smashingboxes/BuildNumberLabel.git", :tag => "0.0.1" }
  s.source_files  = "BuildNumberLabel/**/*.{swift}"

  s.framework     = "UIKit"

end
