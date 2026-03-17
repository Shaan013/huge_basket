import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:huge_basket/core/theme/app_input_decoration.dart';

import '../../../date/defData/country_flag_list.dart';
import '../../../generated/l10n.dart';
import '../view_model/country_code.dart';

class CustomPhoneField extends StatefulWidget {
  final TextEditingController controller;
  final Function(String?)? onSave;

  const CustomPhoneField({super.key, required this.controller, this.onSave});

  @override
  State<CustomPhoneField> createState() => _CustomPhoneFieldState();
}

class _CustomPhoneFieldState extends State<CustomPhoneField> {
  // Default selected country
  CountryCode selectedCountry = countriesFlagList[0];

  // List of common countries (You can expand this list)

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onSaved: widget.onSave,
      maxLength: 10,
      inputFormatters: [FilteringTextInputFormatter.digitsOnly],
      controller: widget.controller,
      keyboardType: TextInputType.phone,
      style: TextTheme.of(context).bodyLarge,
      decoration: AppInputDecoration.auth(
        prefixText: S.of(context).phoneNumber,
        prefixIcon: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            10.horizontalSpace,

            _countryCodes(),
            SizedBox(height: 20, child: VerticalDivider()),
          ],
        ),
      ),
      validator: (value) {
        if (value == null || value.isEmpty) return S.of(context).pleaseEnterPhoneNumber;
        if (value.length < 10) return S.of(context).phoneNumberTooShort;
        return null;
      },
    );
  }

  Widget _countryCodes() {
    return PopupMenuButton<CountryCode>(
      initialValue: selectedCountry,
      onSelected: (CountryCode country) {
        setState(() {
          selectedCountry = country;
        });
      },
      offset: const Offset(0, 50),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Row(
        children: [
          Text(selectedCountry.code, style: TextTheme.of(context).bodyLarge),
          const Icon(Icons.arrow_drop_down, size: 20),
        ],
      ),
      itemBuilder: (BuildContext context) {
        return countriesFlagList.map((CountryCode country) {
          return popupMenuItem(country, context);
        }).toList();
      },
    );
  }

  PopupMenuItem<CountryCode> popupMenuItem(CountryCode country, BuildContext context) {
    return PopupMenuItem<CountryCode>(
          value: country,
          child: Row(
            children: [
              Text(country.flag, style: const TextStyle(fontSize: 18)),
              const SizedBox(width: 12),
              Expanded(child: Text(country.name)),
              Text(country.code, style: TextTheme.of(context).bodyLarge),
            ],
          ),
        );
  }
}
