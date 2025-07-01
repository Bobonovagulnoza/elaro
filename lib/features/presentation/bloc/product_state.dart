import '../../data/models/product_model.dart';

enum ProductStatus { idle, error, loading }

class ProductState {
  final ProductStatus status;
  final List<ProductModel> product;

  ProductState({required this.status, required this.product});

  factory ProductState.initial() {
    return ProductState(status: ProductStatus.loading, product: []);
  }

  ProductState copyWith({ProductStatus? status, List<ProductModel>? product}) {
    return ProductState(
      status: status ?? this.status,
      product: product ?? this.product,
    );
  }


}
