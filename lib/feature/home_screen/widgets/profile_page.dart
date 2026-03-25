import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:huge_basket/core/theme/app_edge_insets.dart';
import 'package:huge_basket/core/widgets/appbar.dart';
import 'package:huge_basket/date/list%20_map_data/profile_list_item.dart';
import 'package:huge_basket/feature/home_screen/view_model/profile_item_model.dart';

import '../../../generated/l10n.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  void handleGoToNext(BuildContext context, String? route) {
    if (route != null) {
      Navigator.pushNamed(context, route);
    } else {
      print("rount does not exist !!!");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        myAppBar(
          context,
          title: S.of(context).profile,
          action: [Icon(Icons.drive_file_rename_outline)],
        ),
        Expanded(
          child: GridView.builder(
            padding: EdgeInsets.only(left: 18, right: 18, bottom: 40).r,
            shrinkWrap: true,
            gridDelegate: buildSliverGridDelegateWithFixedCrossAxisCount(),
            itemCount: profileItemList.length,
            itemBuilder: (context, index) {
              final item = profileItemList[index];
              return builldAddressCard(item, context);
            },
          ),
        ),
        40.verticalSpace,
      ],
    );
  }

  SliverGridDelegateWithFixedCrossAxisCount
  buildSliverGridDelegateWithFixedCrossAxisCount() {
    return SliverGridDelegateWithFixedCrossAxisCount(
      crossAxisCount: 2,
      mainAxisSpacing: 10.r,
      crossAxisSpacing: 10.r,
      mainAxisExtent: 150.h,
    );
  }

  Widget builldAddressCard(ProfileCard item, BuildContext context) {
    return GestureDetector(
      onTap: ()=>handleGoToNext(context, item.route),
      child: Card(
        shadowColor: Colors.black,
        color: Colors.white,
        child: Padding(
          padding: AppEdgeInsets.m,
          child: Column(
            mainAxisAlignment: .start,
            crossAxisAlignment: .start,
            children: [
              Expanded(
                child: Icon(
                  item.icon,
                  size: 56,
                  color: Theme.of(context).colorScheme.primary,
                ),
              ),
              Text(
                item.name,
                style: TextTheme.of(context).titleLarge,
                maxLines: 2,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
