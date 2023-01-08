

Pod::Spec.new do |s|
  s.name             = 'AnyProgress'
  s.version          = '0.1.3'
  s.summary          = 'Here you can use any progress, like gradient progress, circular progress, linear progress etc.'


  s.description      = <<-DESC
  'You can use this for progress like linear progress, circular progress, masked progress like logo progress, water wave progrss. And you can set gradient or colored progress as you want. Its easy to use and highly customisable.'
                       DESC

  s.homepage         = 'https://github.com/NurAhmadullah/AnyProgress'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'NurAhmadullah' => 'nurhstucse@gmail.com' }
  s.source           = { :git => 'https://github.com/NurAhmadullah/AnyProgress.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.ios.deployment_target = '11.0'

#  s.source_files = 'AnyProgress/Classes/**/*'
  s.source_files = 'Classes/**/*.swift'
  s.swift_version = '5.0'
  s.platforms = {
      "ios": "11.0"
  }
  
  # s.resource_bundles = {
  #   'AnyProgress' => ['AnyProgress/Assets/*.png']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  # s.dependency 'AFNetworking', '~> 2.3'
end
