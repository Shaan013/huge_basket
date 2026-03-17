import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:huge_basket/core/constent/app_image_path.dart';
import 'package:huge_basket/core/routes/app_route.dart';
import 'package:huge_basket/core/widgets/back_button.dart';
import 'package:huge_basket/feature/auth/widgets/single_number_feild_input.dart';

import '../../../generated/l10n.dart';
import '../widgets/elevated_button_full_width.dart';

class VerificationPage extends StatefulWidget {
  const VerificationPage({super.key});

  @override
  State<VerificationPage> createState() => _VerificationPageState();
}

class _VerificationPageState extends State<VerificationPage> {
  final TextEditingController _otpController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    _otpController.dispose();
    _formKey;
    super.dispose();
  }

  void handleResandCode() {}

  void handleSubmit() {
    print("object");
    if (_formKey.currentState?.validate() ?? false) {
      print("object1");
      _formKey.currentState!.save();
      Navigator.pushNamed(context, AppRoute.register);
    }
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = TextTheme.of(context);
    return Scaffold(
      appBar: varificationAppBAr(context, textTheme),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 18.0),
        child: SingleChildScrollView(
          child: Column(
            spacing: 20.h,
            children: [
              100.verticalSpace,
              Text(
                S
                    .of(context)
                    .verificationCodeHasBeenSendOnYourRegisteredMobileNumber,
                style: textTheme.bodyLarge,
                maxLines: 5,
                textAlign: .center,
              ),
              otpForm(context, textTheme),
            ],
          ),
        ),
      ),
    );
  }

  Form otpForm(BuildContext context, TextTheme textTheme) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          SingleNumberFieldInput(
            numberSize: 4,
            validation: (value) {
              if (value == null) return " plese enter value";
              if (value.isNaN) {
                return "please wirte some thsnd";
              }
            },
            controller: TextEditingController(),
            onSaved: (int? newValue) {
              print(" $newValue");
            },
          ),
          40.verticalSpace,
          fullWidthButton(context, text: 'submit', onTap: handleSubmit),
          20.verticalSpace,
          GestureDetector(
            onTap: handleResandCode,
            child: Text(
              "Resend code",
              style: textTheme.bodyLarge!.copyWith(decoration: .underline),
            ),
          ),
          opacityLogi(textTheme: textTheme),
        ],
      ),
    );
  }

  AppBar varificationAppBAr(BuildContext context, TextTheme textTheme) {
    return AppBar(
      leading: backButton(context),
      centerTitle: true,
      scrolledUnderElevation: 40,
      shadowColor: Colors.black12,
      title: Text(
        "Verification Code",
        style: textTheme.headlineMedium!.copyWith(
          color: Theme.of(context).colorScheme.primary,
        ),
      ),
    );
  }

  Widget opacityLogi({required TextTheme textTheme}) {
    return Image.asset(
      AppImagePath.fullLogo,
      opacity: AlwaysStoppedAnimation(0.4),
    );
  }
}
