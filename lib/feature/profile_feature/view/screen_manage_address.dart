import 'package:flutter/material.dart';
import 'package:huge_basket/core/routes/app_route.dart';
import 'package:huge_basket/core/theme/app_colors.dart';
import 'package:huge_basket/core/widgets/appbar.dart';
import 'package:huge_basket/feature/profile_feature/widgets/widget_select_address_radio.dart';

import '../../../generated/l10n.dart';

class ScreenManageAddress extends StatelessWidget {
  const ScreenManageAddress({super.key});

  String get address =>
      "799 lost creak Road Seattle ,Fort Washington Us  19034 ";

  @override
  Widget build(BuildContext context) {
    // String? selectedAddress;
    void handleAddNewAddress() {
      Navigator.pushNamed(context, AppRoute.addNewAddress);
    }

    // print("object");
    return Scaffold(
      appBar: myAppBar(context, title: S.of(context).manageAddress),
      body: ListView(
        children: [
          WidgetSelectAddressRadio(selectedAddress: (String value) {}),
          buildAddNewAddress(context, onTap: handleAddNewAddress),
        ],
      ),
    );
  }

  GestureDetector buildAddNewAddress(
    BuildContext context, {
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Row(
        spacing: 4,
        mainAxisAlignment: .center,
        children: [
          Icon(Icons.add_circle_outline, color: AppColors.primary),
          Text(
            S.of(context).addNew,
            style: TextTheme.of(
              context,
            ).titleMedium!.copyWith(color: AppColors.primary),
          ),
        ],
      ),
    );
  }
}
