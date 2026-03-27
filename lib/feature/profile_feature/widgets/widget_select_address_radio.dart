import 'package:flutter/material.dart';
import 'package:huge_basket/core/routes/app_route.dart';
import 'package:huge_basket/date/modals/db/model_address.dart';
import 'package:huge_basket/feature/profile_feature/view/service_address.dart';
import 'package:huge_basket/core/widgets/alert_dailog.dart';

import '../../../core/theme/app_edge_insets.dart';
import 'address_card.dart';

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
    super.initState();
    serviceAddress = ServiceAddress();
  }

  void deleteAddress(int index) async {
    alertDailog(
      context,
      message: "Do you want Delete Address",
      onAgree: () => serviceAddress.deleteAdd(index),
    );
  }

  Future<List<ModelAddress>> getAddress() async {
    return await serviceAddress.getAllAddress();
  }

  @override
  Widget build(BuildContext context) {
    // serviceAddress.clearAll();
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
            if (snapShort.hasError) {
              return Text("not error ");
            }
            if (snapShort.hasData) {
              final listData = snapShort.data ?? [];
              if (listData.isEmpty) {
                return Text(
                  "No Data Found",
                  style: TextTheme.of(context).titleMedium,
                );
              }
              return buildListView(snapShort, listData, context);
            } else {
              return SizedBox.square(child: CircularProgressIndicator());
            }
          },
        ),
      ),
    );
  }

  ListView buildListView(
    AsyncSnapshot<List<ModelAddress>> snapShort,
    List<ModelAddress> listData,
    BuildContext context,
  ) {
    return ListView(
      physics: NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      children: List.generate(snapShort.data!.length, (intex) {
        final item = listData[intex];
        return AddressCard(
          address: item.getString(),
          onDelete: () => deleteAddress(intex),
          onEdit: (){
            Navigator.pushNamed(context, AppRoute.addNewAddress,arguments: {intex:item});
          },
        );
      }),
    );
  }
}
