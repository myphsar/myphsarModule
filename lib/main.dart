

import 'package:country_code_picker/country_code_picker.dart';
//import 'package:firebase_core/firebase_core.dart';
//import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:myphsar/splash_screen_view.dart';

import 'package:path/path.dart';

import '../base_colors.dart';
import '../base_message_view.dart';
import '../base_theme.dart';
import '../local_language.dart';
import 'base_widget/myphsar_text_view.dart';
import '../configure/config_controller.dart';
import 'dashborad/dash_board_view.dart';
import '../denpendency_injection.dart';
import '../helper/share_pref_controller.dart';
import 'qr/QRCoderGenerator.dart';
import 'welcome/welcome_view.dart';


Future<void> main() async {
	WidgetsFlutterBinding.ensureInitialized();

	 await DependencyBinding("https://myphsar.com").dependencies();


	runApp(
		const MyApp(),
	);
}

@pragma('vm:entry-point')
Future<void> myPhsarEntryPoint() async {
	WidgetsFlutterBinding.ensureInitialized();

	await DependencyBinding("https://myphsar.com").dependencies();

	runApp(
		const MyApp(),
	);
}

class MyApp extends StatelessWidget {
	const MyApp({super.key});

	// This widget is the root of application.
	@override
	Widget build(BuildContext context) {
		final navigatorKey = GlobalKey<NavigatorState>();
		return GetMaterialApp(
				smartManagement: SmartManagement.full,
				debugShowCheckedModeBanner: false,
				theme: Get.find<SharePrefController>().getLocalLanguage().languageCode == 'en' ? enBaseTheme : khBaseTheme,
				translations: LocalLanguage(),
				locale: Get.find<SharePrefController>().getLocalLanguage(),
				fallbackLocale: const Locale('en', 'US'),
				localizationsDelegates: const [
					CountryLocalizations.delegate,
				],
				navigatorKey: navigatorKey,
				home: DashBoardView());
	}
}
