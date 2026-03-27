import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:huge_basket/core/routes/app_route.dart';
import 'package:huge_basket/core/theme/app_theme.dart';
import 'package:huge_basket/date/modals/db/model_address.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'date/provider/provider_carts.dart';
import 'generated/l10n.dart';

void main() async {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);

  await Hive.initFlutter();
  Hive.registerAdapter(ModelAddressAdapter());
  Hive.openBox<ModelAddress>("addresses");
  final pref = await SharedPreferences.getInstance();
  final bool isLogedIn = pref.getBool("isLogedIn") ?? false;

  print("is logedin : $isLogedIn");
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]).then((_) {
    runApp(MyApp(isLogedIn: isLogedIn));
  });
}

class MyApp extends StatelessWidget {
  final bool isLogedIn;

  const MyApp({super.key, required this.isLogedIn});

  @override
  Widget build(BuildContext context) {
    FlutterNativeSplash.remove();
    return ScreenUtilInit(
      designSize: const Size(382, 873),
      builder: (context, chile) {
        return ChangeNotifierProvider(
          create: (_) => ProviderCarts(),
          child: MaterialApp(
            // Add these three lines:
            localizationsDelegates: [
              S.delegate,
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
            ],
            // 2. Add the supported locales
            supportedLocales: S.delegate.supportedLocales,
            debugShowCheckedModeBanner: false,
            title: "Huge Basket",
            theme: appTheme,
            initialRoute: !isLogedIn ? AppRoute.tutorial : AppRoute.home,
            routes: AppRoute.getRoutes(),
            // home: const MyHomePage(title: 'Flutter Demo Home Page'),
          ),
        );
      },
    );
  }
}
