import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:huge_basket/core/widgets/app_list_title.dart';
import 'package:huge_basket/date/defData/strore_model_list.dart';

import '../../../generated/l10n.dart';

class ReviewsPage extends StatelessWidget {
  const ReviewsPage({super.key});

  @override
  Widget build(BuildContext context) {
    int reviewCount = 100;
    final textTheme = TextTheme.of(context);
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: .spaceBetween,
              children: [
                Text(
                  S.of(context).allReviewsReviewcount,
                  style: textTheme.titleLarge,
                ),
                Text(S.of(context).viewAll, style: textTheme.titleMedium),
              ],
            ),
            ListView.separated(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: reviewCount.bitLength,
              itemBuilder: (context, index) {
                final mode = reviewList[index];
                return AppListTitle(
                  leading: ClipOval(
                    child: Image.network(mode.image, height: 70.r, width: 70.r),
                  ),
                  middle: [
                    Row(
                      mainAxisAlignment: .spaceBetween,
                      children: [
                        Expanded(
                          child: Text(mode.name, style: textTheme.titleLarge),
                        ),
                        Text(mode.time),
                      ],
                    ),
                    Row(
                      children: List.generate(
                        5,
                        (index) => Icon(
                          size: 18,
                          Icons.star,

                          color: (mode.rating > index)
                              ? Colors.yellow
                              : Colors.black,
                        ),
                      ),
                    ),
                    Text(mode.review, maxLines: 2),
                  ],
                );
              },
              separatorBuilder: (BuildContext context, int index) {
                return Divider();
              },
            ),
          ],
        ),
      ),
    );
  }
}
