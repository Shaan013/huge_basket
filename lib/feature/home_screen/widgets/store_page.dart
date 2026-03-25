import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/routes/app_route.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_edge_insets.dart';
import '../../../core/widgets/appbar.dart';
import '../../../core/widgets/cart_widget.dart';
import '../../../core/widgets/smail_icon_with_badge.dart';
import '../../../date/defData/home_title_list.dart';
import '../../../generated/l10n.dart';
import '../view_model/home_list_model.dart';
import 'home_list_title.dart';

class StorePage extends StatelessWidget {
  const StorePage({super.key});

  @override
  Widget build(BuildContext context) {
    void goToStorePage({required HomeListModel model}) {
      Navigator.pushNamed(context, AppRoute.store, arguments: model);
    }

    return SingleChildScrollView(
      child: Column(
        spacing: 8.h,
        children: [
          myAppBar(
            leading: smallIconsBadge(icons: Icons.notifications, count: 2),
            context,
            title: S.of(context).hugeBasket,
            action: [cartIcon(context)],
          ),
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
