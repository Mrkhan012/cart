import 'package:dio/dio.dart';
import '../models/product_model.dart';

class NetworkService {
  static final Dio _dio = Dio();

  static Future<List<Product>> fetchProducts(int skip) async {
    final response = await _dio.get('https://dummyjson.com/products', queryParameters: {
      'limit': 10,
      'skip': skip,
    });

    if (response.statusCode == 200) {
      return (response.data['products'] as List).map((json) => Product.fromJson(json)).toList();
    } else {
      throw Exception("Failed to load products");
    }
  }
}
