class SortModel{
  List<ProductsSort>? products;

  SortModel({this.products});

  SortModel.fromJson(Map<String, dynamic> json) {
    if (json['products'] != null) {
      products = <ProductsSort>[];
      json['products'].forEach((v) {
        products!.add(ProductsSort.fromJson(v));
      });
    }
  }
}

class ProductsSort {
  int? sales;
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
  bool? inCart = false;
  bool? inFavorite = false;
  int? iV;

  ProductsSort(
      {this.sales,
        this.sId,
        this.status,
        this.category,
        this.name,
        this.price,
        this.description,
        this.image,
        this.images,
        this.company,
        this.countInStock,
        this.iV});

  ProductsSort.fromJson(Map<String, dynamic> json) {
    sales = json['sales'];
    sId = json['_id'];
    status = json['status'];
    category = json['category'];
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
