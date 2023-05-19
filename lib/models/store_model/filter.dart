class FilterSellerModel{
  String? status;
  String? message;
  List<ProductsFiltee>? usedProducts;
  List<ProductsFiltee>? newProducts;
  FilterSellerModel({this.status, this.message,});

  FilterSellerModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    if (json['products'] != null) {
      usedProducts =  <ProductsFiltee>[];
      newProducts =<ProductsFiltee>[];
      json['products'].forEach((v) {
        if(v['status']=='New'){
          newProducts!.add(ProductsFiltee.fromJson(v));
        }else{
          usedProducts!.add(ProductsFiltee.fromJson(v));
        }
      });
    }
  }
}
class ProductsFiltee {
  String? sId;
  String? status;
  String? category;
  String? name;
  List<String>? images;
  dynamic price;
  String? description;
  String? image;
  String? company;
  dynamic countInStock;
  int? iV;
  bool? inCart = false;
  bool? inFavorite = false;
  ProductsFiltee(
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

  ProductsFiltee.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    status = json['status'];
    category = json['category'];
    name = json['name'];
    price = json['price'];
    description = json['description'];
    image = json['image'];
    company = json['company'];
    images = json['images'].cast<String>();
    countInStock = json['countInStock'];
    iV = json['__v'];
  }

}