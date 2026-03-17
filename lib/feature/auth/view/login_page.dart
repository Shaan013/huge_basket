import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:huge_basket/core/constent/app_image_path.dart';
import 'package:huge_basket/core/routes/app_route.dart';
import 'package:huge_basket/feature/auth/widgets/custom_phone_number.dart';
import 'package:huge_basket/feature/auth/widgets/elevated_button_full_width.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  final _phoneNoController = TextEditingController();

  void handleSubmit() {
    bool res = _formKey.currentState!.validate();

    if (res && _phoneNoController.text.isNotEmpty) {
      Navigator.pushNamed(context, AppRoute.varification);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              spacing: 10.r,
              children: [
                100.verticalSpace,
                logoImage(),
                CustomPhoneField(controller: _phoneNoController),
                fullWidthButton(context, text: "Login", onTap: handleSubmit),
              ],
            ),
          ),
        ),
      ),
    );
  }

  AspectRatio logoImage() {
    return AspectRatio(
                aspectRatio: 1,
                child: Image.asset(AppImagePath.fullLogo),
              );
  }
}
