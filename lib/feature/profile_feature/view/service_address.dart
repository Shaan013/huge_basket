import 'dart:developer';

import 'package:hive_flutter/adapters.dart';
import 'package:huge_basket/date/modals/db/model_address.dart';

class ServiceAddress {
  final _dbAddress = "addresses";

  Box<ModelAddress> get _addressesBox => Hive.box(_dbAddress);

  Future<void> addAddress(ModelAddress address) async {
    await _addressesBox.add(address);
    print(address);
  }

  Stream<List<ModelAddress>> getStreemAddress() {
    return _addressesBox.watch().map((event) {
      return _addressesBox.values.toList();
    });
  }

  Future<List<ModelAddress>> getAllAddress() async {
    final listOfList = await _addressesBox.values.toList();
    return listOfList;
  }

  List<ModelAddress> getallAddressAsync() {
    return _addressesBox.values.toList();
  }

  void deleteAdd(int index) {
    // print("deleted index : $index");

    final tem = _addressesBox.keyAt(index);

    // print("key :$tem");

    _addressesBox.delete(tem);
  }

  Future<void> uploadChange({required ModelAddress newAddress, required int index}) async {
    final key = _addressesBox.keyAt(index);
    log(" : key :$key");
   await _addressesBox.put(key, newAddress);
  }

  void clearAll() {
    _addressesBox.clear();
  }

  Future<void> deleteAddress(ModelAddress address) async {
    return await _addressesBox.delete(address);
  }
}
