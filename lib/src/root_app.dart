import 'package:brand_city/src/core/constant/config.dart';
import 'package:brand_city/src/core/constant/theme_manager.dart';
import 'package:brand_city/src/core/localization/translation_controller.dart';
import 'package:brand_city/src/core/localization/translation_manager.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'route/pages.dart';

class RootApp extends StatelessWidget {
  RootApp({Key? key}) : super(key: key);
  final _config = Get.put<Configs>(Configs());
  final getstorag = Get.put<GetStorage>(GetStorage());

  @override
  Widget build(BuildContext context) {
    final languageController =
        Get.put<TranslationController>(TranslationController());
    return GestureDetector(
      onTap: () {
        final FocusScopeNode currentFocus = FocusScope.of(context);
        if (!currentFocus.hasPrimaryFocus && currentFocus.hasFocus) {
          FocusManager.instance.primaryFocus!.unfocus();
        }
      },
      child: GetMaterialApp(
        useInheritedMediaQuery: true,
        title: 'BRAND CITY',
        debugShowCheckedModeBanner: false,
        theme: ThemeManager.themeLight,
        // theme: ThemeData.dark(),
        locale: languageController.language ?? Locale(_config.english),
        fallbackLocale: Locale(_config.english),
        translations: TranslationManager(),
        // initialBinding: InitialBindings(),
        getPages: AppPages.pages,
        initialRoute: Routers.verification,
        defaultTransition: Transition.fadeIn,
      ),
    );
  }
}
