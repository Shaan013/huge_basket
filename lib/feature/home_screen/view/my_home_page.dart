import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:huge_basket/core/routes/app_route.dart';
import 'package:huge_basket/core/theme/app_colors.dart';
import 'package:huge_basket/core/theme/app_edge_insets.dart';
import 'package:huge_basket/core/widgets/appbar.dart';
import 'package:huge_basket/core/widgets/smail_icon_with_badge.dart';
import 'package:huge_basket/date/defData/home_title_list.dart';
import 'package:huge_basket/feature/home_screen/view_model/bottom_bar_item_list.dart';
import 'package:huge_basket/feature/home_screen/view_model/home_list_model.dart';

import '../../../generated/l10n.dart';
import '../widgets/home_list_title.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _selectedIndex = 0;

  void goToStorePage({required HomeListModel model}) {
    Navigator.pushNamed(context, AppRoute.store, arguments: model);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: myAppBar(
        leading: smallIconsBadge(icons: Icons.notifications, count: 2),
        context,
        title: S.of(context).hugeBasket,
        action: [smallIconsBadge(icons: Icons.shopping_cart, count: 3)],
      ),
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Column(
              spacing: 8.h,
              children: [
                _notif(context),
                ...storeList.map(
                  (model) => GestureDetector(
                    onTap: () => goToStorePage(model: model),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: HomeListTitle(model: model),
                    ),
                  ),
                ),
                56.verticalSpace,
              ],
            ),
          ),
          homeBottomBar(context),
        ],
      ),
    );
  }

  Align homeBottomBar(BuildContext context) {
    return Align(
      alignment: .bottomCenter,
      child: BottomNavigationBar(
        backgroundColor: Theme.of(
          context,
        ).colorScheme.primaryContainer.withAlpha(200),
        currentIndex: _selectedIndex,
        onTap: (index) => setState(() => _selectedIndex = index),
        items: bottemBarItemList
            .map(
              (item) => BottomNavigationBarItem(
                icon: smallIconsBadge(
                  icons: item['icon'],
                  count: item['count'],
                ),
                label: item['label'],
              ),
            )
            .toList(),
      ),
    );
  }

  Widget _notif(BuildContext context) {
    return Container(
      padding: AppEdgeInsets.m,
      alignment: .center,
      width: double.infinity,

      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(color: AppColors.gray, spreadRadius: 12, blurRadius: 4),
        ],
        color: Theme.of(context).colorScheme.primary.withAlpha(20),
      ),
      child: Text(
        S.of(context).naxtDeliveryOnWed14Nov2020,
        style: TextTheme.of(
          context,
        ).titleMedium!.copyWith(color: Theme.of(context).colorScheme.primary),
        maxLines: 1,
      ),
    );
  }
}
