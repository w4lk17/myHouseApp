import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:my_house/app.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';

///---Entry Point of the App---///
Future<void> main() async {
  ///-- Add Widget Binding
  final WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();

  ///-- Init Local Storage
  await GetStorage.init();

  ///-- Await Native Splash
  // FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);

  ///-- Initialize Firebase and Authentication repository
  await Firebase.initializeApp();
  // .then(
  //   (FirebaseApp value) => Get.put(AuthenticationRepository()),
  // );

  ///-- Load all the Material Design, themes , Localizations and much more
  runApp(const App());
}
