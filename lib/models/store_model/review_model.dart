class ReviewModel{
  String? status;
  String? message;
  List<ReviewsItems>? reviews;

  ReviewModel({this.status, this.message, this.reviews});

  ReviewModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    if (json['reviews'] != null) {
      reviews =<ReviewsItems>[];
      json['reviews'].forEach((v) {
        reviews!.add(ReviewsItems.fromJson(v));
      });
    }
  }
}

class ReviewsItems{
  String? sId;
  String? product;
  String? title;
  String? comment;
  dynamic rating;
  String? createdAt;
  String? updatedAt;
  int? iV;

  ReviewsItems(
      {this.sId,
        this.product,
        this.title,
        this.comment,
        this.rating,
        this.createdAt,
        this.updatedAt,
        this.iV});

  ReviewsItems.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    product = json['product'];
    title = json['title'];
    comment = json['comment'];
    rating = json['rating'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    iV = json['__v'];
  }

}