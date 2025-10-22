Pod::Spec.new do |s|
  s.name             = 'MyPhsarModule'
  s.version          = '1.0.0'
  s.summary          = 'A Flutter module for iOS'
  s.description      = <<-DESC
  This module provides Flutter functionality to native iOS apps.
                       DESC
  s.homepage         = 'https://github.com/myphsar/myphsarModule'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'Sam Piksak' => 'connecttopiksak@gmail.com' }
  
  s.ios.deployment_target = '15.0'
  s.source = {
    :git =>  'https://github.com/myphsar/myphsarModule.git',:tag => s.version.to_s
  }
  
  s.vendored_frameworks = [
      'Flutter.xcframework',
      'App.xcframework',
      'FlutterPluginRegistrant.xcframework',
      'path_provider_foundation.xcframework',
      'camera_avfoundation.xcframework',
	'flutter_inappwebview_ios.xcframework',
	'image_picker_ios.xcframework',
	'OrderedSet.xcframework',
	'permission_handler_apple.xcframework',
	'share_plus.xcframework',
	'shared_preferences_foundation.xcframework',
	'url_launcher_ios.xcframework'
  ]
  
  # s.preserve_paths = '**/*.xcframework'
end