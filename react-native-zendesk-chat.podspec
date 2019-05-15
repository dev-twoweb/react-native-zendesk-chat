require "json"

json = File.read(File.join(__dir__, "package.json"))
package = JSON.parse(json).deep_symbolize_keys

Pod::Spec.new do |s|
  s.name = package[:name].include?("/") ? package[:name].split("/").last : package[:name]
  s.version = package[:version]
  s.license = package[:license]
  s.authors = package[:author]
  s.summary = package[:description]
  s.source = { :git => 'https://github.com/jramalho/react-native-zendesk-support.git',  :tag => 'v'+s.version.to_s }
  s.homepage = 'https://github.com/jramalho/react-native-zendesk-support'
  s.source_files   = 'ios/RNZendeskChatModule.{h,m}'

  s.platform = :ios, "9.0"

  s.dependency 'ZDCChat'
  s.dependency 'React'
  s.ios.xcconfig = {
    'FRAMEWORK_SEARCH_PATHS' => '"${PODS_ROOT}/ZDCChat"',
    'OTHER_LDFLAGS' => '-framework ZDCChat'
  }
  s.user_target_xcconfig = { 'CLANG_ALLOW_NON_MODULAR_INCLUDES_IN_FRAMEWORK_MODULES' => 'YES' }


end
