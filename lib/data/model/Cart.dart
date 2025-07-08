class Cart {
  int? id;
  double? subtotal;
  int? userId;
  var coupon;
  double? totalAmount;
  var discountAmount;
  double? distance;
  double? deliveryAmount;
  String? createdAt;
  List<Items>? items;

  Cart(
      {this.id,
      this.subtotal,
      this.userId,
      this.coupon,
      this.totalAmount,
      this.discountAmount,
      this.distance,
      this.deliveryAmount,
      this.createdAt,
      this.items});

  Cart.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    subtotal = double.parse(((json['subtotal'] as num).toInt()).toString());
    userId = json['user_id'];
    coupon = json['coupon'];
    totalAmount = json['total_amount'];
    discountAmount = json['discount_amount'];
    distance = json['distance'];
    deliveryAmount = json['delivery_amount'];
    createdAt = json['created_at'];
    if (json['items'] != null) {
      items = <Items>[];
      json['items'].forEach((v) {
        items!.add(Items.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['subtotal'] = subtotal;
    data['user_id'] = userId;
    data['coupon'] = coupon;
    data['total_amount'] = totalAmount;
    data['discount_amount'] = discountAmount;
    data['distance'] = distance;
    data['delivery_amount'] = deliveryAmount;
    data['created_at'] = createdAt;
    if (items != null) {
      data['items'] = items!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Items {
  int? id;
  String? name;
  String? image;
  int? cartId;
  int? productId;
  int? quantity;
  dynamic price;
  dynamic totalPrice;
  Product? product;

  Items(
      {this.id,
      this.name,
      this.image,
      this.cartId,
      this.productId,
      this.quantity,
      this.price,
      this.totalPrice,
      this.product});

  Items.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    image = json['image'];
    cartId = json['cart_id'];
    productId = json['product_id'];
    quantity = json['quantity'];
    price = (json['price'] is double)
        ? json['price'] as double
        : (json['price'] is int)
            ? json['price'] as int
            : double.parse(json['price'] as String);
    totalPrice = (json['total_price'] is double)
        ? json['total_price'] as double
        : (json['total_price'] is int)
            ? json['total_price'] as int
            : double.parse(json['total_price'] as String);
    product =
        json['product'] != null ? Product.fromJson(json['product']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['image'] = image;
    data['cart_id'] = cartId;
    data['product_id'] = productId;
    data['quantity'] = quantity;
    data['price'] = price;
    data['total_price'] = totalPrice;
    if (product != null) {
      data['product'] = product!.toJson();
    }
    return data;
  }
}

class Product {
  int? id;
  String? name;
  String? slug;
  dynamic price;
  dynamic salePrice;
  int? categoryId;
  int? subCategoryId;
  String? image;
  String? summary;
  String? description;
  int? unitId;
  int? quantity;
  int? stock;
  int? status;
  String? createdAt;
  String? updatedAt;

  Product(
      {this.id,
      this.name,
      this.slug,
      this.price,
      this.salePrice,
      this.categoryId,
      this.subCategoryId,
      this.image,
      this.summary,
      this.description,
      this.unitId,
      this.quantity,
      this.stock,
      this.status,
      this.createdAt,
      this.updatedAt});

  Product.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    slug = json['slug'];
    price = (json['price'] is double)
        ? json['price'] as double
        : (json['price'] is int)
            ? json['price'] as int
            : double.parse(json['price'] as String);
    salePrice = (json['sale_price'] is double)
        ? json['sale_price'] as double
        : (json['sale_price'] is int)
            ? json['sale_price'] as int
            : double.parse(json['sale_price'] as String);
    categoryId = json['category_id'];
    subCategoryId = json['sub_category_id'];
    image = json['image'];
    summary = json['summary'];
    description = json['description'];
    unitId = json['unit_id'];
    quantity = json['quantity'];
    stock = json['stock'];
    status = json['status'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['slug'] = slug;
    data['price'] = price;
    data['sale_price'] = salePrice;
    data['category_id'] = categoryId;
    data['sub_category_id'] = subCategoryId;
    data['image'] = image;
    data['summary'] = summary;
    data['description'] = description;
    data['unit_id'] = unitId;
    data['quantity'] = quantity;
    data['stock'] = stock;
    data['status'] = status;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }
}
