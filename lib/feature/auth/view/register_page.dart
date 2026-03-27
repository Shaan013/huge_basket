import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:huge_basket/core/routes/app_route.dart';
import 'package:huge_basket/core/theme/app_input_decoration.dart';
import 'package:huge_basket/core/utils/app_validation.dart';
import 'package:huge_basket/core/widgets/appbar.dart';
import 'package:huge_basket/feature/auth/widgets/custom_phone_number.dart';
import 'package:huge_basket/feature/auth/widgets/elevated_button_full_width.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../core/theme/app_colors.dart';
import '../../../generated/l10n.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final _formKey = GlobalKey<FormState>();
  final _bNameController = TextEditingController();
  final _lNameController = TextEditingController();
  final _fNameController = TextEditingController();
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _phoneController = TextEditingController();
  final _zipCodeController = TextEditingController();
  bool chack = false;
  bool checkError = false;

  // 3. Clean up is automatic when the user leaves the page
  @override
  void dispose() {
    _bNameController.dispose();
    _emailController.dispose();
    _nameController.dispose();
    _fNameController.dispose();
    _phoneController.dispose();
    _zipCodeController.dispose();

    super.dispose();
  }

  void handleChackBox(bool? value) {
    setState(() {
      chack = value ?? false;
    });
  }

  void handleSubmit() async {
    print("in");
    final res = _formKey.currentState!.validate();
    if (chack == false) {
      setState(() {
        checkError = true;
      });
    } else {
      setState(() {
        checkError = false;
      });
    }
    if (res && chack == true) {
      final pref = await SharedPreferences.getInstance();
      pref.setBool("isLogedIn", true);
      print("object");
      _formKey.currentState!.save();
      Navigator.pushNamedAndRemoveUntil(
        context,
        AppRoute.home,
        (route) => false,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: myAppBar(context, title: S.of(context).addMoreDetails),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 18.0),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: .spaceBetween,
            children: [
              20.verticalSpace,
              ragisterForm(context),
              fullWidthButton(
                context,
                text: S.of(context).add,
                onTap: handleSubmit,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Form ragisterForm(BuildContext context) {
    return Form(
      autovalidateMode: .onUnfocus,
      key: _formKey,
      child: Column(
        spacing: 20.h,
        children: [
          TextFormField(
            validator: (value) => ValidationHelper.validateName(value),
            controller: _nameController,
            decoration: AppInputDecoration.auth(
              prefixText: S.of(context).businessName,
            ),
          ),
          TextFormField(
            validator: (value) => ValidationHelper.validateName(value),
            controller: _fNameController,
            decoration: AppInputDecoration.auth(
              prefixText: S.of(context).firstName,
            ),
          ),
          TextFormField(
            validator: (value) => ValidationHelper.validateName(value),
            controller: _lNameController,
            decoration: AppInputDecoration.auth(
              prefixText: S.of(context).lastName,
            ),
          ),
          TextFormField(
            validator: (value) => ValidationHelper.validateEmail(value),
            controller: _emailController,
            decoration: AppInputDecoration.auth(
              prefixText: S.of(context).emailAddress,
            ),
          ),
          CustomPhoneField(controller: _phoneController),
          TextFormField(
            keyboardType: .numberWithOptions(signed: false, decimal: false),
            validator: (value) => ValidationHelper.noEmpty(value),
            controller: _zipCodeController,
            decoration: AppInputDecoration.auth(
              prefixText: S.of(context).zipcode,
            ),
          ),
          tcChackBox(context),
          if (checkError)
            Text(
              S.of(context).pleaseAgreeWihtTc,
              style: TextTheme.of(context).bodyMedium!.copyWith(
                color: Theme.of(context).colorScheme.error,
              ),
            ),
          // Row(children: [
          //   Text("🇮🇳")
          // ]),
        ],
      ),
    );
  }

  Text tcChackBox(BuildContext context) {
    return Text.rich(
      textAlign: .center,
      TextSpan(
        children: [
          WidgetSpan(
            alignment: .middle,
            child: Checkbox(
              value: chack,
              onChanged: handleChackBox,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(4),
                side: BorderSide(color: AppColors.deepGray, width: 0.1),
              ),
            ),
          ),
          TextSpan(text: S.of(context).iAgreeToThe),
          WidgetSpan(
            child: GestureDetector(
              onTap: () {},
              child: Text(
                S.of(context).termsCondition,
                style: TextTheme.of(context).titleMedium!.copyWith(
                  color: Theme.of(context).colorScheme.primary,
                  decoration: .underline,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
