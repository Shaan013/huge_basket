import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:huge_basket/feature/tutorial/view_model/tutorial_model.dart';

class Tutorial extends StatelessWidget {
  final TutorialModel tutorial;

  const Tutorial({super.key, required this.tutorial});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AspectRatio(aspectRatio: 1, child: Image.asset(tutorial.imagePath)),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16).r,
          child: Column(
            spacing: 16.r,
            children: [
              Text(tutorial.title, style: TextTheme.of(context).headlineMedium),
              Text(
                tutorial.content,
                style: TextTheme.of(context).bodyLarge,
                maxLines: 3,
                textAlign: .center,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
