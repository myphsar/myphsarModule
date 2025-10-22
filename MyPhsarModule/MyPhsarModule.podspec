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
    :http => 'https://your-repo.com/flutter-modules/MyFlutterModule/1.0.0/MyFlutterModule.zip'
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




    # Add other plugin frameworks your module uses
  ]
  
  s.preserve_paths = '**/*.xcframework'
end