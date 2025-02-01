import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:mlijoan_apps/api/urls.dart';
import 'package:mlijoan_apps/features/cart/data/models/cart_models.dart';
import 'package:mlijoan_apps/shared/utils/storage.dart';

abstract class CartRemoteDataSource {
  Future<List<CartModel>> all();
  Future<List<CartModel>> update(int id);
  Future<bool> destroy(int id);
}

class CartRemoteDataSourceImpl implements CartRemoteDataSource {
  final http.Client client;
  final SecureStorage secureStorage;

  CartRemoteDataSourceImpl(this.client, this.secureStorage);



  Future<String> _getAuthorizationHeader() async {
    String? token = await SecureStorage.getToken();
    if (token == null) throw Exception('Token is not set');
    return 'Bearer $token';
  }

  @override
  Future<List<CartModel>> all() async {
    Uri url = Uri.parse('${Urls.base}/product-cart');
    try {
      String authorization = await _getAuthorizationHeader();
      final response = await client.get(
        url,
        headers: {'Authorization': authorization},
      );

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        return (data['data'] as List).map((cartJson) => CartModel.fromJson(cartJson)).toList();
      } else {
        throw HttpException('Failed to load cart data', uri: url);
      }
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<List<CartModel>> update(int id) async {
    Uri url = Uri.parse('${Urls.base}/product-cart/$id');
    try {
      String authorization = await _getAuthorizationHeader();
      final response = await client.patch(
        url,
        headers: {
          'Content-Type': 'application/json',
          'Authorization': authorization,
        },
        body: json.encode({'quantity': 3}),
      );

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        return (data['data'] as List).map((cartJson) => CartModel.fromJson(cartJson)).toList();
      } else {
        throw HttpException('Failed to update cart', uri: url);
      }
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<bool> destroy(int id) async {
    Uri url = Uri.parse('${Urls.base}/product-cart/$id');
    try {
      String authorization = await _getAuthorizationHeader();
      final response = await client.delete(
        url,
        headers: {'Authorization': authorization},
      );

      if (response.statusCode == 200) {
        return true;
      } else {
        throw HttpException('Failed to delete cart', uri: url);
      }
    } catch (e) {
      rethrow;
    }
  }
}
