import 'package:dio/dio.dart';

class ProductsRemote {
  final Dio dio;

  ProductsRemote({Dio? dio})
    : dio = dio ?? Dio(BaseOptions(baseUrl: "https://api.elaro.uz/api"));

  Future<Map<String, dynamic>> fetchProductsByFilter(
    String minPrice,
    String maxPrice,
    String color,
  ) async {
    final response = await dio.get(
      '/categories/3',
      queryParameters: {
        'min_price': minPrice,
        'max_price': maxPrice,
        'color': color,
      },
    );

    if (response.statusCode == 200) {
      return response.data;
    } else {
      throw Exception("XATOLIK");
    }
  }
}
