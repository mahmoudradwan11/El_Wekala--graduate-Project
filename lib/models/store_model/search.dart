class SearchModel {
  String? status;
  String? message;
  List<SearchProducts>? products;
  SearchModel({this.status, this.message, this.products});
  SearchModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    if (json['products'] != null) {
      products = <SearchProducts>[];
      json['products'].forEach((v) {
        products!.add(SearchProducts.fromJson(v));
      });
    }
  }
}
class SearchProducts {
  String? sId;
  String? status;
  String? category;
  String? name;
  dynamic price;
  String? description;
  String? image;
  String? company;
  List<String>? images;
  dynamic countInStock;
  int? iV;
  bool? inCart = false;
  bool? inFavorite = false;
  SearchProducts(
      {this.sId,
        this.status,
        this.category,
        this.name,
        this.price,
        this.description,
        this.image,
        this.company,
        this.countInStock,
        this.iV});

  SearchProducts.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    status = json['status'];
    category = json['category'];
    name = json['name'];
    price = json['price'];
    images = json['images'].cast<String>();
    description = json['description'];
    image = json['image'];
    company = json['company'];
    countInStock = json['countInStock'];
    iV = json['__v'];
  }
}