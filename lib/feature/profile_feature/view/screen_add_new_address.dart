import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:huge_basket/core/theme/app_edge_insets.dart';
import 'package:huge_basket/core/theme/app_input_decoration.dart';
import 'package:huge_basket/core/utils/app_validation.dart';
import 'package:huge_basket/core/widgets/appbar.dart';
import 'package:huge_basket/date/modals/db/model_address.dart';
import 'package:huge_basket/feature/auth/widgets/elevated_button_full_width.dart';
import 'package:huge_basket/feature/profile_feature/view/service_address.dart';

import '../../../generated/l10n.dart';

class ScreenAddNewAddress extends StatefulWidget {
  const ScreenAddNewAddress({super.key});

  @override
  State<ScreenAddNewAddress> createState() => _ScreenAddNewAddressState();
}

class _ScreenAddNewAddressState extends State<ScreenAddNewAddress> {
  late ServiceAddress bd;
  bool isEdit = false;
  int? oldKey;
  final _formKey = GlobalKey<FormState>();
  final _addressController = TextEditingController();
  final _unitNoController = TextEditingController();
  final _cityController = TextEditingController();
  final _stateController = TextEditingController();
  final _zipcodeController = TextEditingController();
  final _deliveryInstructionController = TextEditingController();

  @override
  void initState() {
    super.initState();
    bd = ServiceAddress();
  }

  void putData(ModelAddress address) {
    _addressController.text = address.address;
    _unitNoController.text = address.unitNo;
    _cityController.text = address.city;
    _stateController.text = address.state;
    _zipcodeController.text = address.zipcode;
    _deliveryInstructionController.text = address.instruction;
  }

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
    final Map<int, ModelAddress>? arg =
        ModalRoute.of(context)?.settings.arguments as Map<int, ModelAddress>?;
    if (arg != null && isEdit == false) {
      final ModelAddress oldAddress = arg.values.first;
      oldKey = arg.keys.first;
      print("${oldAddress.unitNo}");
      putData(oldAddress);
      isEdit = true;
    }
  }

  ModelAddress getCurrentAddress() {
    return ModelAddress(
      _addressController.text,
      _unitNoController.text,
      _cityController.text,
      _stateController.text,
      _zipcodeController.text,
      _deliveryInstructionController.text,
    );
  }

  Future<void> handletrySubmit() async {
    final res = _formKey.currentState!.validate();
    print("res: $res");
    if (res) {
      print("isEdit :$isEdit");
      if (isEdit == true) {
        bd.uploadChange(newAddress: getCurrentAddress(), index: oldKey!);
      } else {
        await bd.addAddress(getCurrentAddress());
      }
      Navigator.pop(context, false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: myAppBar(context, title:!isEdit? S.of(context).addNewAddress:"Edit Address"),
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Column(
              children: [
                Form(
                  autovalidateMode: .onUserInteraction,
                  key: _formKey,
                  child: Padding(
                    padding: AppEdgeInsets.m,
                    child: Column(
                      spacing: 18.r,
                      children: [
                        TextFormField(
                          validator: (value) => ValidationHelper.noEmpty(value),
                          controller: _addressController,
                          textInputAction: .next,
                          decoration: AppInputDecoration.auth(
                            prefixText: S.of(context).address,
                            suffix: Icon(Icons.location_pin),
                          ),
                        ),
                        TextFormField(
                          keyboardType: TextInputType.numberWithOptions(),
                          inputFormatters: [
                            FilteringTextInputFormatter.digitsOnly,
                          ],
                          validator: (value) => ValidationHelper.noEmpty(value),
                          controller: _unitNoController,
                          textInputAction: .next,
                          decoration: AppInputDecoration.auth(
                            prefixText: S.of(context).enterUnitNumber,
                          ),
                        ),
                        TextFormField(
                          validator: (value) => ValidationHelper.noEmpty(value),
                          controller: _cityController,
                          textInputAction: .next,
                          decoration: AppInputDecoration.auth(
                            prefixText: S.of(context).city,
                          ),
                        ),
                        TextFormField(
                          validator: (value) => ValidationHelper.noEmpty(value),
                          controller: _stateController,
                          textInputAction: .next,
                          decoration: AppInputDecoration.auth(
                            prefixText: S.of(context).state,
                          ),
                        ),
                        TextFormField(
                          keyboardType: TextInputType.numberWithOptions(),
                          inputFormatters: [
                            FilteringTextInputFormatter.digitsOnly,
                          ],
                          validator: (value) => ValidationHelper.noEmpty(value),
                          controller: _zipcodeController,
                          textInputAction: .next,
                          decoration: AppInputDecoration.auth(
                            prefixText: S.of(context).zipcode,
                          ),
                        ),
                        TextFormField(
                          validator: (value) => ValidationHelper.noEmpty(value),
                          controller: _deliveryInstructionController,
                          textInputAction: .done,
                          maxLines: 5,
                          decoration: AppInputDecoration.auth(
                            prefixText: S.of(context).deliveryInstruction,
                          ),
                        ),
                        40.verticalSpace,

                        // ListView(children: []),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          Align(
            alignment: .bottomCenter,
            child: Padding(
              padding: AppEdgeInsets.m,
              child: fullWidthButton(
                context,
                text: !isEdit ? S.of(context).add : "Update",
                onTap: handletrySubmit,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
