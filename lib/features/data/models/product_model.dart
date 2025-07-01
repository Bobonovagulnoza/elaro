class ProductModel {
  final int id;
  final String nameUz;
  final String nameCrl;
  final String nameRu;
  final String color;
  final String price;
  final int qty;
  final int discountedPrice;
  final String discount;
  final String? discountType;
  final String? discountStart;
  final String? discountEnd;
  final String descriptionUz;
  final String descriptionCrl;
  final String descriptionRu;
  final int categoryId;
  final int brandId;
  final List<ImageModel> images;

  ProductModel({
    required this.id,
    required this.nameUz,
    required this.nameCrl,
    required this.nameRu,
    required this.color,
    required this.price,
    required this.qty,
    required this.discountedPrice,
    required this.discount,
    required this.discountType,
    required this.discountStart,
    required this.discountEnd,
    required this.descriptionUz,
    required this.descriptionCrl,
    required this.descriptionRu,
    required this.categoryId,
    required this.brandId,
    required this.images,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      id: json['id'],
      nameUz: json['name_uz'],
      nameCrl: json['name_crl'],
      nameRu: json['name_ru'],
      color: json['color'],
      price: json['price'],
      qty: json['qty'],
      discountedPrice: json['discounted_price'],
      discount: json['discount'],
      discountType: json['discount_type'],
      discountStart: json['discount_start'],
      discountEnd: json['discount_end'],
      descriptionUz: json['description_uz'],
      descriptionCrl: json['description_crl'],
      descriptionRu: json['description_ru'],
      categoryId: json['category_id'],
      brandId: json['brand_id'],
      images: (json['images'] as List)
          .map((e) => ImageModel.fromJson(e))
          .toList(),
    );
  }
}

class ImageModel {
  final int id;
  final String image;

  ImageModel({
    required this.id,
    required this.image,
  });

  factory ImageModel.fromJson(Map<String, dynamic> json) {
    return ImageModel(
      id: json['id'],
      image: json['image'],
    );
  }
}
