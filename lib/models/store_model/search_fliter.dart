class SearchFilterModel {
  String? status;
  String? message;
  List<SearchProducts>? newProducts;
  List<SearchProducts>? usedProducts;
  SearchFilterModel({this.status, this.message,});
  SearchFilterModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    if (json['products'] != null) {
      usedProducts= <SearchProducts>[];
      newProducts =<SearchProducts>[];
      json['products'].forEach((v) {
        if(v['status']=='New'){
          newProducts!.add(SearchProducts.fromJson(v));
        }else{
          usedProducts!.add(SearchProducts.fromJson(v));
        }
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
    description = json['description'];
    image = json['image'];
    company = json['company'];
    countInStock = json['countInStock'];
    iV = json['__v'];
  }
}