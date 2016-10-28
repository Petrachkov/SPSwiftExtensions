#
# Be sure to run `pod lib lint SPSwiftExtensions.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
s.name             = 'SPSwiftExtensions'
s.version          = '0.5.0'
s.summary          = 'SPSwiftExtensions gives you a set of tools to work with standard classes.'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

s.description      = 'SPSwiftExtensions gives you a set of tools to work with standard classes such as UIDevice, UIView, CGRect, etc'

s.homepage         = 'https://github.com/Petrachkov/SPSwiftExtensions'
# s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
s.license          = { :type => 'MIT', :file => 'LICENSE' }
s.author           = { 'sergey petrachkov' => 'petrachkovsergey@gmail.com' }
s.source           = { :git => 'https://github.com/Petrachkov/SPSwiftExtensions.git', :tag => s.version.to_s }
# s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

s.ios.deployment_target = '9.0'

s.source_files = 'SPSwiftExtensions/Classes/**/*'

# s.resource_bundles = {
#   'SPSwiftExtensions' => ['SPSwiftExtensions/Assets/*.png']
# }

# s.public_header_files = 'Pod/Classes/**/*.h'
# s.frameworks = 'UIKit', 'MapKit'
# s.dependency 'AFNetworking', '~> 2.3'
end
