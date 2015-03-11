#
# Be sure to run `pod lib lint ITAhoCorasik.podspec' to ensure this is a
# valid spec and remove all comments before submitting the spec.
#
# Any lines starting with a # are optional, but encouraged
#
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = "ITAhoCorasik"
  s.version          = "0.1.0"
  s.summary          = "Implementation of algorithm of Aho-Corasick (patterns searching)"
  s.homepage         = "https://github.com/alesanro/ITAhoCorasick"
  s.license          = 'MIT'
  s.author           = { "Alex Rudyak" => "aliaksandr.rudziak@instinctools.ru" }
  s.source           = { :git => "https://github.com/alesanro/ITAhoCorasick.git", :tag => s.version.to_s }

  s.platform     = :ios, '7.0'
  s.requires_arc = true

  s.source_files = 'Pod/Classes/**/*'

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  # s.dependency 'AFNetworking', '~> 2.3'
end
