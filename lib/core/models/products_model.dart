class ProductsModel {
  String productId;
  DateTime createdAt;
  String productName;
  String productDescription;
  String productOldPrice;
  String productSale;
  String productNewPrice;
  dynamic productImage;
  String productCategory;
  List<FavoriteTable> favoriteProductsTable;
  List<RatesTable> ratesTable;

  ProductsModel({
    required this.productId,
    required this.createdAt,
    required this.productName,
    required this.productDescription,
    required this.productOldPrice,
    required this.productSale,
    required this.productNewPrice,
    required this.productImage,
    required this.productCategory,
    required this.favoriteProductsTable,
    required this.ratesTable,
  });

  factory ProductsModel.fromJson(Map<String, dynamic> json) => ProductsModel(
    productId: json["product_id"],
    createdAt: DateTime.parse(json["created_at"]),
    productName: json["product_name"],
    productDescription: json["product_description"],
    productOldPrice: json["product_old_price"],
    productSale: json["product_sale"],
    productNewPrice: json["product_new_price"],
    productImage: json["product_image"],
    productCategory: json["product_category"],
    favoriteProductsTable: List<FavoriteTable>.from(
      json["favorite_products_table"].map((x) => FavoriteTable.fromJson(x)),
    ),
    ratesTable: List<RatesTable>.from(
      json["rates_table"].map((x) => RatesTable.fromJson(x)),
    ),
  );


}

class FavoriteTable {
  String id;
  String userId;
  DateTime createdAt;
  String productId;
  bool? isFavorite;
  int? rate;

  FavoriteTable({
    required this.id,
    required this.userId,
    required this.createdAt,
    required this.productId,
    this.isFavorite,
    this.rate,
  });

  factory FavoriteTable.fromJson(Map<String, dynamic> json) => FavoriteTable(
    id: json["id"],
    userId: json["user_id"],
    createdAt: DateTime.parse(json["created_at"]),
    productId: json["product_id"],
    isFavorite: json["is_favorite"],
    rate: json["rate"],
  );

}
class RatesTable {
  String id;
  String userId;
  DateTime createdAt;
  String productId;
  int? rate;

  RatesTable({
    required this.id,
    required this.userId,
    required this.createdAt,
    required this.productId,
    this.rate,
  });

  factory RatesTable.fromJson(Map<String, dynamic> json) => RatesTable(
    id: json["id"],
    userId: json["user_id"],
    createdAt: DateTime.parse(json["created_at"]),
    productId: json["product_id"],
    rate: json["rate"],
  );

}
