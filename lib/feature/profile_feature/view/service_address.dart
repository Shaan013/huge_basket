import 'package:hive_flutter/adapters.dart';
import 'package:huge_basket/date/modals/db/model_address.dart';

class ServiceAddress {
  final _dbAddress = "addresses";

  Box<ModelAddress> get _addressesBox => Hive.box(_dbAddress);

  Future<void> addAddress(ModelAddress address) async {
    await _addressesBox.add(address);
    print(address);
  }

  Stream<List<ModelAddress>> getStreemAddress(){
    return  _addressesBox.watch().map((event) {
      return _addressesBox.values.toList();
    });
  }

  Future<List<ModelAddress>> getAllAddress() async {
    final listOfList = await _addressesBox.values.toList();
    return listOfList;
  }

  List<ModelAddress> getallAddressAsync() {
    return   _addressesBox.values.toList();
  }

  void deleteAdd(ModelAddress address){
    print("deleted ");
     _addressesBox.delete(address);
  }
  Future<void> deleteAddress(ModelAddress address) async {
    return await _addressesBox.delete(address);
  }
}
