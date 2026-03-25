import 'package:flutter/material.dart';
import 'package:huge_basket/core/widgets/appbar.dart';
import 'package:huge_basket/core/widgets/cart_widget.dart';
import 'package:huge_basket/core/widgets/smail_icon_with_badge.dart';
import 'package:huge_basket/feature/home_screen/view_model/bottom_bar_item_list.dart';
import 'package:huge_basket/feature/home_screen/widgets/my_orders_page.dart';
import 'package:huge_basket/feature/home_screen/widgets/profile_page.dart';
import 'package:huge_basket/feature/home_screen/widgets/store_page.dart';

import '../../../generated/l10n.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar
      body: Stack(
        children: [
          IndexedStack(
            index: _selectedIndex,
            children: [StorePage(), MyOrdersPage(), ProfilePage()],
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
}
