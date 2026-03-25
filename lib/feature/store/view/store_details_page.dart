import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:huge_basket/core/routes/app_route.dart';
import 'package:huge_basket/core/theme/app_colors.dart';
import 'package:huge_basket/feature/home_screen/view_model/home_list_model.dart';
import 'package:huge_basket/feature/home_screen/widgets/home_list_title.dart';
import 'package:huge_basket/feature/store/widgets/reviews_page.dart';

import '../../../generated/l10n.dart';
import '../widgets/transprent_app_bar.dart';

class StoreDetailsPage extends StatefulWidget {
  const StoreDetailsPage({super.key});

  @override
  State<StoreDetailsPage> createState() => _StoreDetailsPageState();
}

class _StoreDetailsPageState extends State<StoreDetailsPage> {
  String decription =
      "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.";

  late HomeListModel model =
      ModalRoute.of(context)!.settings.arguments as HomeListModel;

  void handleGoTo() {
    Navigator.pushNamed(context, AppRoute.shoppingPage, arguments: model);
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        body: Column(
          children: [
            uperPart(),
            70.verticalSpace,
            storeTabBar(),
            buildTabView(),
          ],
        ),
      ),
    );
  }

  Expanded buildTabView() {
    return Expanded(
      child: TabBarView(
        children: [Text(decription, maxLines: 20), ReviewsPage()],
      ),
    );
  }

  Widget uperPart() => Stack(
    clipBehavior: .none,
    alignment: .center,
    children: [
      Container(
        // clipBehavior: .none,
        height: 300.h,
        decoration: bgImageDecoration(),

        child: storeAppBar(context, title: S.of(context).storeDetails,),
      ),

      Positioned(
        bottom: -50,
        child: SizedBox(
          // height: 60,
          width: 330.w,
          child: GestureDetector(
            onTap: handleGoTo,
            child: HomeListTitle(model: model),
          ),
        ),
      ),
    ],
  );

  Widget storeTabBar() => Container(
    // height: 50,
    color: Theme.of(context).colorScheme.primary.withAlpha(30),
    child: Stack(
      children: [
        Align(
          alignment: Alignment.center,
          child: Container(height: 47, width: 1.5, color: Colors.white),
        ),
        TabBar(
          dividerColor: Colors.transparent,
          indicatorColor: Colors.transparent,
          labelColor: AppColors.seedColor,
          unselectedLabelColor: Colors.grey,
          tabs: [
            Tab(text: S.of(context).aboutUs),
            Tab(text: S.of(context).reviews),
          ],
        ),
      ],
    ),
  );

  BoxDecoration bgImageDecoration() => BoxDecoration(
    image: DecorationImage(
      colorFilter: ColorFilter.mode(Colors.black38, BlendMode.darken),
      image: NetworkImage(model.image),
      fit: .cover,
    ),
  );
}
