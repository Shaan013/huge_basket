import 'package:flutter/cupertino.dart';
import 'package:huge_basket/date/modals/address_model.dart';

class ProviderCarts extends ChangeNotifier {
  List<ProductModel> _listCarts = [];

  List<ProductModel> get listCarts => _listCarts;

  set listCarts(List<ProductModel> value) {
    _listCarts = value;
    notifyListeners();
  }

  void addProduct(ProductModel product) {
    _listCarts.add(product);
    notifyListeners();
  }

  bool removeProduct(ProductModel product) {
    bool res = _listCarts.remove(product);
    notifyListeners();
    return res;
  }

  void incrementQuantity(ProductModel product) {
    int index = _listCarts.indexWhere((item) => item.id == product.id);

    if (index != -1) {
      _listCarts[index].quantity++;
      notifyListeners();
    } else {
      product.quantity = 1;
      _listCarts.add(product);
      notifyListeners();
    }
  }

  void decrementQuantity(ProductModel product) {
    int index = _listCarts.indexWhere((item) => item.id == product.id);
    if (index != -1) {
      if (_listCarts[index].quantity > 1) {
        _listCarts[index].quantity--;
      } else {
        _listCarts.removeAt(index);
      }
      notifyListeners();
    }
  }

  int productQuantityBy(int productId) {
    int index = _listCarts.indexWhere((item) => item.id == productId);
    if (index != -1) {
      return _listCarts[index].quantity;
    } else {
      return 0;
    }
  }

  int getLength() {
    return _listCarts.length;
  }
}
