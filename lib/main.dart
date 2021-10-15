import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/src/routes/transitions_type.dart';
import 'package:get_storage/get_storage.dart';
import 'package:iotflixcinema/core/view_bindings/initial_bindings.dart';
import 'package:iotflixcinema/view/constant/constant_base64_images.dart';
import 'package:iotflixcinema/view/pages/splash/SplashScreen.dart';
import 'package:iotflixcinema/view/router/app_navigator.dart';
import 'package:paulonia_cache_image/paulonia_cache_image.dart';

import 'core/constant/storage_constant.dart';
import 'core/theme/theme.dart';
import 'core/view_models/theme_view_model.dart';

Uint8List drawerImage;

void main() async {
  drawerImage = Base64Images.getDrawerImg();
  Get.lazyPut<ThemeController>(() => ThemeController());
  WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init();
  await GetStorage.init(StorageConstant.authStorage);
  await PCacheImage.init(enableInMemory: true);

  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
      .then((_) {
    runApp(new MyApp());
  });
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    ThemeController.to.getThemeModeFromPreferences();
    return GetMaterialApp(
      initialBinding: InitialBindings(),
      //smartManagement: SmartManagement.onlyBuilder,
      debugShowCheckedModeBanner: false,
      theme: CustomTheme.lightTheme,
      defaultTransition: Transition.fadeIn,
      darkTheme: CustomTheme.darkTheme,
      home: SplashScreen(),
      getPages: AppPageNavigator.getPages,
      // home: HomePage(),
      //  home: HistoryPage(),
    );
  }
}
