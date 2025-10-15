class ProductModel {
  String? image;
  String? name;
  String? quantity;
  double? rating;
  int? reviews;
  double? regularPrice;
  double? discountPrice;

  ProductModel(
      {this.image,
        this.name,
        this.quantity,
        this.rating,
        this.reviews,
        this.regularPrice,
        this.discountPrice});

  ProductModel.fromJson(Map<String, dynamic> json) {
    image = json['image'];
    name = json['name'];
    quantity = json['quantity'];
    rating = json['rating'];
    reviews = json['reviews'];
    regularPrice = json['regular_price'];
    discountPrice = json['discount_price'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['image'] = this.image;
    data['name'] = this.name;
    data['quantity'] = this.quantity;
    data['rating'] = this.rating;
    data['reviews'] = this.reviews;
    data['regular_price'] = this.regularPrice;
    data['discount_price'] = this.discountPrice;
    return data;
  }
}
