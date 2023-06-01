class FilterProducts {
  String? status;
  String? message;
  List<ProductsFilter>? products;

  FilterProducts({this.status, this.message, this.products});

  FilterProducts.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    if (json['products'] != null) {
      products = <ProductsFilter>[];
      json['products'].forEach((v) {
        products!.add(ProductsFilter.fromJson(v));
      });
    }
  }
}

class ProductsFilter{
  String? sId;
  String? status;
  String category = 'Laptops';
  String? name;
  dynamic price;
  String? description;
  String? image;
  List<String>? images;
  String? company;
  dynamic countInStock;
  bool? inCart = false;
  bool? inFavorite = false;
  int? iV;
  ProductsFilter({this.sId,
    this.status,
    this.name,
    this.price,
    this.description,
    this.image,
    this.images,
    this.company,
    this.countInStock,
    this.iV});

  ProductsFilter.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    status = json['status'];
    name = json['name'];
    price = json['price'];
    description = json['description'];
    image = json['image'];
    images = json['images'].cast<String>();
    company = json['company'];
    countInStock = json['countInStock'];
    iV = json['__v'];
  }
}