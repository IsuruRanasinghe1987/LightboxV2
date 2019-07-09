Pod::Spec.new do |s|
  s.name             = "LightboxV2"
  s.summary          = "A convenient and easy to use image viewer for your iOS app. Updated to swift 5.0. The credit go the original developer Hyper Interaktiv AS."
  s.version          = "2.4.2"
  s.homepage         = "https://github.com/FlammerSL/LightboxV2"
  s.license          = 'MIT'
  s.author           = {"Isuru Ranasinghe" => "ranasinghe.i.u@gmail.com"}
  s.source           = { :git => "https://github.com/FlammerSL/LightboxV2.git", :tag => s.version.to_s }
  s.platform     = :ios, '10.0'
  s.requires_arc = true
  s.source_files = 'Source/**/*'
  s.ios.resource = 'Resources/Lightbox.bundle'
  s.swift_version = '5.0'
  s.frameworks = 'UIKit', 'AVFoundation', 'AVKit'
  s.dependency 'AlamofireImage', '~> 3.5.2'

end
