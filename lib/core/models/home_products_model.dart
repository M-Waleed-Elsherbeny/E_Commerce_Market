HomeProductsModel homeProductsModelFromJson(
  Map<String, dynamic> jsonResponse,
) => HomeProductsModel.fromJson(jsonResponse);

class HomeProductsModel {
  String? productId;
  String? createdAt;
  String? productName;
  String? productDescription;
  String? productOldPrice;
  String? productSale;
  String? productNewPrice;
  String? productImage;
  String? productCategory;
  List<FavoriteProductsTable>? favoriteProductsTable;
  List<SoldProducts>? soldProducts;

  HomeProductsModel({
    this.productId,
    this.createdAt,
    this.productName,
    this.productDescription,
    this.productOldPrice,
    this.productSale,
    this.productNewPrice,
    this.productImage,
    this.productCategory,
    this.favoriteProductsTable,
    this.soldProducts,
  });

  HomeProductsModel.fromJson(Map<String, dynamic> json) {
    productId = json['product_id'];
    createdAt = json['created_at'];
    productName = json['product_name'];
    productDescription = json['product_description'];
    productOldPrice = json['product_old_price'];
    productSale = json['product_sale'];
    productNewPrice = json['product_new_price'];
    productImage = json['product_image'];
    productCategory = json['product_category'];
    if (json['favorite_products_table'] != null) {
      favoriteProductsTable = <FavoriteProductsTable>[];
      json['favorite_products_table'].forEach((v) {
        favoriteProductsTable!.add(FavoriteProductsTable.fromJson(v));
      });
    }
    if (json['sold_products'] != null) {
      soldProducts = <SoldProducts>[];
      json['sold_products'].forEach((v) {
        soldProducts!.add(SoldProducts.fromJson(v));
      });
    }
  }
}

class FavoriteProductsTable {
  String? id;
  Users? users;
  String? userId;
  String? createdAt;
  String? productId;
  bool? isFavorite;

  FavoriteProductsTable({
    this.id,
    this.users,
    this.userId,
    this.createdAt,
    this.productId,
    this.isFavorite,
  });

  FavoriteProductsTable.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    users = json['users'] != null ? Users.fromJson(json['users']) : null;
    userId = json['user_id'];
    createdAt = json['created_at'];
    productId = json['product_id'];
    isFavorite = json['is_favorite'];
  }
}

class Users {
  String? name;
  String? email;
  String? userId;
  String? createdAt;

  Users({this.name, this.email, this.userId, this.createdAt});

  Users.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    email = json['email'];
    userId = json['user_id'];
    createdAt = json['created_at'];
  }
}

class SoldProducts {
  String? id;
  bool? isSold;
  String? userId;
  String? createdAt;
  String? productId;

  SoldProducts({
    this.id,
    this.isSold,
    this.userId,
    this.createdAt,
    this.productId,
  });

  SoldProducts.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    isSold = json['is_sold'];
    userId = json['user_id'];
    createdAt = json['created_at'];
    productId = json['product_id'];
  }
}
