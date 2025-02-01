import 'dart:convert';

import 'package:mlijoan_apps/features/cart/data/models/cart_models.dart';
import 'package:mlijoan_apps/shared/utils/shared_preferences_manager.dart';

abstract class CartLocalDataSource {
  Future<List<CartModel>> getAll();
  Future<bool> cacheAll(List<CartModel> list);
}

class CartLocalDataSourceImpl implements CartLocalDataSource{
  
  static const String cartKey = 'cartData';

  @override
  Future<bool> cacheAll(List<CartModel> list) async {
    List<String> jsonCartList = list.map((cart) => json.encode(cart.toJson())).toList();
    await SharedPreferencesManager.saveStringList(cartKey, jsonCartList);
    return true;
  }

  @override
  Future<List<CartModel>> getAll() async {
    List<String>? jsonCartList = await SharedPreferencesManager.getStringList(cartKey);
    if (jsonCartList == null) return [];
    return jsonCartList.map((cartJson) => CartModel.fromJson(json.decode(cartJson))).toList();
  }
}