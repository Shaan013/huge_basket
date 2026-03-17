import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:huge_basket/core/theme/app_colors.dart';
import 'package:huge_basket/feature/home_screen/view_model/home_list_model.dart';

class HomeListTitle extends StatelessWidget {
  final HomeListModel model;

  const HomeListTitle({super.key, required this.model});

  @override
  Widget build(BuildContext context) {
    final textTheme = TextTheme.of(context);
    return Card(
      color: Colors.white,
      elevation: 3,
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Row(
          spacing: 18.r,
          children: [
            Badge(
              offset: Offset(-45, 68),
              backgroundColor: AppColors.seedColor,
              label: Row(
                spacing: 3.r,
                children: [
                  Expanded(child: Icon(Icons.star, size: 16.r,color:AppColors.white,)),
                  Text(
                    model.rating.toString(),
                    style: TextTheme.of(context).titleSmall!.copyWith(
                      color: AppColors.white
                    ),
                    maxLines: 1,
                  ),
                ],
              ),
              child: buildClipOval(),
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: .start,
                crossAxisAlignment: .start,
                children: [
                  Row(
                    children: [
                      Expanded(child: Text(model.title, style: textTheme.titleLarge, maxLines: 1)),
                      Text(model.distance, maxLines: 1)
                    ],
                  ),
                  Text(model.category, maxLines: 1),
                  Text(model.address, maxLines: 1),
                ],
              ),
            ),
            // Column(
            //   mainAxisAlignment: .start,
            //   children: [Text(model.distance, maxLines: 1)],
            // ),
          ],
        ),
      ),
    );
  }

  ClipOval buildClipOval() {
    return ClipOval(
      child: Image.network(model.image, fit: .cover, height: 80.r),
    );
  }
}
