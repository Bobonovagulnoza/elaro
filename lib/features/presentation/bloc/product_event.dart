sealed class ProductEvent {}

class ProductLoad extends ProductEvent {
  final String minPrice;
  final String maxPrice;
  final String color;

  ProductLoad({
    required this.color,
    required this.maxPrice,
    required this.minPrice,
  });
}
