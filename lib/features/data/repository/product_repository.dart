import '../models/product_model.dart';
import '../products/products_remote.dart';

class ProductRepository {
  final ProductsRemote client;

  ProductRepository({required this.client});

  List<ProductModel> products = [];

  Future<List<ProductModel>> fetchFilterProduct(
    String minPrice,
    String maxPrice,
    String color,
  ) async {
    final response = await client.fetchProductsByFilter(
      minPrice,
      maxPrice,
      color,
    );

    final data = response['data'];

    final List<dynamic> productsJson = data['products'];

    final products = productsJson.map((e) => ProductModel.fromJson(e)).toList();

    return products;
  }
}
