import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:huge_basket/core/routes/app_route.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LogOutScreen extends StatelessWidget {
  const LogOutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = TextTheme.of(context);
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisSize: .min,
          mainAxisAlignment: .center,
          crossAxisAlignment: .center,
          children: [
            Text(
              "Alert",
              style: textTheme.displayMedium!.copyWith(
                color: Theme.of(context).colorScheme.error,
              ),
            ),
            Text(
              "Do you really want to log out ",
              style: textTheme.headlineMedium,
            ),
            Row(
              spacing: 20.w,
              mainAxisAlignment: .center,
              children: [
                ElevatedButton(
                  onPressed: () => handleLogout(context),
                  child: Text("YES"),
                ),
                ElevatedButton(
                  onPressed: () => handleGoBack(context),
                  child: Text("NO"),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  void handleLogout(BuildContext context) async {
    final pref = await SharedPreferences.getInstance();
    pref.setBool("isLogedIn", false);
    print("out call");
    Navigator.pushNamedAndRemoveUntil(
      context,
      AppRoute.tutorial,
      (route) => false,
    );
  }

  void handleGoBack(BuildContext context) {
    Navigator.pop(context, false);
  }
}
