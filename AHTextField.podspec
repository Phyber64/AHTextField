#
# Be sure to run `pod lib lint AHTextField.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'AHTextField'
  s.version          = '0.1.0'
  s.summary          = 'AHTextField makes work with TextFields easier, including: Images, gradients, textPadding etc.'
  s.swift_version    = '4.2'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
AHTextField lets you easily work with images, one-side borders, gradients, text padding etc. inside TextFields. AHTextField inherits from UITextField and adds some other functionality on top.
                       DESC

  s.homepage         = 'https://github.com/Phyber64/AHTextField'
  s.screenshots      = 'https://imgur.com/Rq3cXaG.png', 'https://imgur.com/Oxy32J7.png', 'https://imgur.com/uu17SR8.png'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'Aleš Hanžlík' => 'hanzlikale@gmail.com' }
  s.source           = { :git => 'https://github.com/Phyber64/AHTextField.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.ios.deployment_target = '8.0'

  s.source_files = 'AHTextField/Classes/**/*'
  
  # s.resource_bundles = {
  #   'AHTextField' => ['AHTextField/Assets/*.png']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  s.frameworks = 'UIKit'
  s.platform = :ios, "9.0"
end
