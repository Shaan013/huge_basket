import 'package:flutter/material.dart';
import 'package:huge_basket/date/defData/tutorial_list.dart';
import 'package:huge_basket/feature/tutorial/widget/page_indicator.dart';
import 'package:huge_basket/feature/tutorial/widget/tutorial_1.dart';

import '../../../core/routes/app_route.dart';
import '../../../generated/l10n.dart';

class AppTutorial extends StatefulWidget {
  const AppTutorial({super.key});

  @override
  State<AppTutorial> createState() => _AppTutorialState();
}

class _AppTutorialState extends State<AppTutorial> {
  final _pageController = PageController();
  int pageIndex = 0;
  final int tutorialLength = 3;

  bool get isVisible => !(pageIndex == tutorialLength - 1);

  void handlePageIndex(int value) {
    setState(() {
      pageIndex = value;
    });
  }

  void gotoHome() {
    Navigator.pushNamedAndRemoveUntil(
      context,
      AppRoute.loginPage,
      (rout) => false,
    );
  }

  void handleNextButton() {
    if (pageIndex < tutorialLength - 1) {
      setState(() {
        pageIndex++;
      });
      _pageController.animateToPage(
        pageIndex,
        duration: const Duration(milliseconds: 300),
        curve: Curves.ease,
      );
    } else {
      gotoHome();
    }
  }

  // final _pageviewController = TabController(length: 3, vsync: this);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
              Row(
                mainAxisAlignment: .end,
                children: [
                  Visibility(
                    visible: isVisible,
                    maintainState: true,
                    maintainAnimation: true,
                    maintainSize: true,
                    child: TextButton(onPressed: gotoHome, child: Text(S.of(context).skip)),
                  ),
                ],
              ),

            Expanded(
              child: PageView(
                controller: _pageController,
                onPageChanged: handlePageIndex,
                children: tutorialInfoList
                    .map((tut) => Tutorial(tutorial: tut))
                    .toList(),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 8),
              child: Row(
                mainAxisAlignment: .spaceBetween,
                children: [
                  PageIndicator(length: 3, selectedIndex: pageIndex),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Theme.of(context).colorScheme.primary,
                    ),
                    onPressed: handleNextButton,
                    child: Text(
                      (pageIndex != tutorialLength - 1) ? S.of(context).next : S.of(context).go,
                      style: TextTheme.of(context).labelLarge,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
