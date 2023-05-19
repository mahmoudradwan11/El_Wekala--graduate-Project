class HomeSmartPhone{
  String? status;
  String? message;
  List<Product>? newProduct;
  List<Product>? usedProduct;

  HomeSmartPhone({this.status, this.message,});

  HomeSmartPhone.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    if (json['products'] != null) {
      usedProduct= <Product>[];
      newProduct =<Product>[];
      json['products'].forEach((v){
        if(v['status']=='New'){
          newProduct!.add(Product.fromJson(v));
        }else{
          usedProduct!.add(Product.fromJson(v));
        }
      });
    }
  }

}
class Product {
  String? sId;
  String? status;
  String? category;
  String? name;
  dynamic price;
  String? description;
  String? image;
  List<String>? images;
  String? company;
  dynamic countInStock;
  dynamic iV;
  bool? inCart = false;
  bool? inFavorite = false;
  Product(
      {this.sId,
        this.status,
        this.category,
        this.name,
        this.price,
        this.description,
        this.image,
        this.company,
        this.countInStock,
        this.iV,
        this.inCart,
        this.inFavorite,
      });

  Product.fromJson(Map<String, dynamic> json) {
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
    images = json['images'].cast<String>();
    inCart = json['inCart'];
    inFavorite = json['inFavorites'];
  }
}