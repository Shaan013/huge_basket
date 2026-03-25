import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:huge_basket/date/modals/db/model_address.dart';
import 'package:huge_basket/feature/profile_feature/view/service_address.dart';

import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_edge_insets.dart';

class WidgetSelectAddressRadio extends StatefulWidget {
  final ValueChanged<String> selectedAddress;

  const WidgetSelectAddressRadio({super.key, required this.selectedAddress});

  @override
  State<WidgetSelectAddressRadio> createState() =>
      _WidgetSelectAddressRadioState();
}

class _WidgetSelectAddressRadioState extends State<WidgetSelectAddressRadio> {
  String? selectedAddress;
  late ServiceAddress serviceAddress;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    serviceAddress = ServiceAddress();
  }

  void deleteAddress(ModelAddress address) async {
    print("object");
     serviceAddress.deleteAdd(address);
  }

  Future<List<ModelAddress>> getAddress() async {
    return await serviceAddress.getAllAddress();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: AppEdgeInsets.s,
      child: RadioGroup<String>(
        groupValue: selectedAddress,
        onChanged: (value) {
          setState(() {
            selectedAddress = value;
          });
        },
        child: StreamBuilder<List<ModelAddress>>(
          stream: serviceAddress.getStreemAddress(),
          initialData: serviceAddress.getallAddressAsync(),
          builder: (context, snapShort) {
            if(snapShort.hasError){
              return Text("not error ");
            }
            if (snapShort.hasData) {
              final listData = snapShort.data??[];

              if (listData.isEmpty) {
                return Text(
                  "No Data Found",
                  style: TextTheme.of(context).titleMedium,
                );
              }
              return ListView(
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                children: List.generate(snapShort.data!.length, (intex) {
                  final item = listData[intex];
                  return addressCard(
                    context,
                    address: item.getString(),
                    onDelete: () => deleteAddress(item),
                  );
                }),
              );
            } else {
              return SizedBox.square(child: CircularProgressIndicator());
            }
          },
        ),

        // FutureBuilder<List<ModelAddress>>(
        //   future: getAddress(),
        //   builder: (context, snapShort) {
        //
        //   },
        // ),
      ),
    );
  }

  Card addressCard(
    BuildContext context, {
    required String address,
    VoidCallback? onDelete,
    VoidCallback? onChange,
  }) {
    return Card(
      clipBehavior: .hardEdge,
      color: AppColors.white,
      child: Column(
        children: [
          Padding(
            padding: AppEdgeInsets.m,
            child: Row(
              children: [
                Radio(value: address),
                Expanded(
                  child: Text(
                    address,
                    style: TextTheme.of(context).titleMedium,
                    maxLines: 2,
                  ),
                ),
              ],
            ),
          ),
          10.verticalSpace,
          Divider(height: 1),
          Row(
            children: [
              Expanded(
                child: _button(
                  context,
                  icons: Icons.delete,
                  label: "Delete",
                  splashColor: Colors.red.withAlpha(50),
                  iconColor: AppColors.rad,
                  onTap: onDelete,
                ),
              ),
              SizedBox(height: 50.h, child: VerticalDivider(width: 1)),
              Expanded(
                child: _button(
                  context,
                  icons: Icons.edit,
                  label: "Change",
                  onTap: () {},
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _button(
    BuildContext context, {
    required VoidCallback? onTap,
    required IconData icons,
    required String label,
    Color? splashColor,
    Color? iconColor,
  }) {
    return Ink(
      height: 50.h,
      child: InkWell(
        onTap: onTap,
        splashColor: splashColor,
        child: Padding(
          padding: const EdgeInsets.all(8).r,
          child: Row(
            mainAxisAlignment: .center,
            children: [
              Icon(icons, color: iconColor),
              10.verticalSpace,
              Text(
                label,
                maxLines: 1,
                style: TextTheme.of(context).titleMedium,
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Widget _dialogBox(BuildContext context,{required String address}){
  //   re
  // }
}
