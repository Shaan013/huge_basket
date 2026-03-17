import 'package:flutter/cupertino.dart';
import 'package:huge_basket/feature/auth/view/login_page.dart';
import 'package:huge_basket/feature/auth/view/register_page.dart';
import 'package:huge_basket/feature/auth/view/varifiication_page.dart';
import 'package:huge_basket/feature/home_screen/view/my_home_page.dart';
import 'package:huge_basket/feature/store/view/shopping_page.dart';
import 'package:huge_basket/feature/store/view/store_details_page.dart';
import 'package:huge_basket/feature/tutorial/view/app_tutorial.dart';

class AppRoute {
  static String home = '/';
  static String tutorial = '/tutorial';
  static String loginPage = '/login';
  static String varification = '/varification';
  static String register = '/register';
  static String store = '/store_details';
  static String shoppingPage = '/$store/shopping_page';

  static Map<String, WidgetBuilder> getRoutes() => {
    home: (content) => const MyHomePage(),
    tutorial: (content) => const AppTutorial(),
    loginPage: (content) => const LoginPage(),
    varification: (content) => const VerificationPage(),
    register: (content) => const RegisterPage(),
    store: (content) => const StoreDetailsPage(),
    shoppingPage: (context) => const ShoppingPage(),
  };
}
