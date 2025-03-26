class ReviewsModel{
  String comment;
  String date ;
  String reviewerEmail ;
  String reviewerName;
  num rating ;

  ReviewsModel({required this.rating, required this.reviewerName, required this.reviewerEmail,
  required this.date, required this.comment});

 factory ReviewsModel.fromJson(Map<String , dynamic> json){
   return ReviewsModel(
       rating:  json["rating"] ?? "",
       reviewerName:  json["reviewerName"] ?? "",
       reviewerEmail:  json["reviewerEmail"] ?? "",
       date:  json["date"] ?? "",
       comment: json["comment"] ?? ""
   );
 }
}

class metaModel{
  String barcode;
  String createdAt;
  String qrCode;
  String updatedAt;

  metaModel({required this.createdAt, required this.updatedAt, required this.qrCode, required this.barcode});

  factory metaModel.fromJson(Map<String, dynamic> json){
    return metaModel(
        createdAt: json['createdAt'] ?? "",
        updatedAt:json[' updatedAt'] ?? "",
        qrCode: json['qrCode'] ?? "",
        barcode: json['barcode'] ?? ""
    );
  }
}

class DimensionModel {
  num depth;
  num height;
  num width;

  DimensionModel({required this.depth, required this.height, required this.width});

  factory DimensionModel.fromJson(Map<String, dynamic> json){
    return DimensionModel(
        depth: json["depth"] ?? "",
        height: json["height"] ?? "",
        width: json["width"] ?? ""
    );
  }
}

class ProductsModel{
  String availabilityStatus;
  String brand;
  String category;
  String description;
  String returnPolicy;
  String shippingInformation;
  String sku;
  String  thumbnail;
  String title;
  String warrantyInformation;
  num discountPercentage;
  int id;
  int minimumOrderQuantity ;
  num price;
  num rating;
  num stock;
  num weight;
  DimensionModel dimensions;
  metaModel meta;
  List<dynamic> images;
  List<dynamic> tags;
  List<ReviewsModel> reviews;

  ProductsModel({required this.availabilityStatus, required this.brand, required this.category, required this.description,
    required this.discountPercentage, required this.id, required this.minimumOrderQuantity, required this.price,
    required this.rating, required this.returnPolicy, required this.shippingInformation, required this.sku,
    required this.stock, required this.thumbnail, required this.title, required this.warrantyInformation, required this.weight,
    required this.dimensions, required this.images, required this.meta, required this.reviews, required this.tags});

  factory ProductsModel.fromJson(Map<String, dynamic> json){
    List<ReviewsModel> mReviews = [];
    for(Map<String, dynamic> eachReview in json['reviews']){
      mReviews.add(ReviewsModel.fromJson(eachReview));
    }

    return ProductsModel(
        availabilityStatus: json['availabilityStatus'] ?? "",
        brand: json['brand'] ?? "",
        category: json['category'] ?? "",
        description: json['description'] ?? "",
        discountPercentage: json['discountPercentage'] ?? "",
        id: json['id'] ?? "",
        minimumOrderQuantity: json['minimumOrderQuantity'] ?? "",
        price: json['price'] ?? "",
        rating: json['rating'] ?? "",
        returnPolicy: json['returnPolicy'] ?? "",
        shippingInformation: json['shippingInformation'] ?? "",
        sku: json['sku'] ?? "",
        stock: json['stock'],
        thumbnail: json['thumbnail'] ?? "",
        title: json['title'] ?? "",
        warrantyInformation: json['warrantyInformation'] ?? "",
        weight: json['weight'] ?? "",
        dimensions: DimensionModel.fromJson(json['dimensions']),
        images: json['images'] ?? "",
        meta: metaModel.fromJson(json['meta']),
        reviews: mReviews,
        tags: json['tags']);
  }



}

class JSONModel{
  int limit;
  List<ProductsModel> products;
  int skip;
  int total;

  JSONModel({required this.products, required this.total, required this.skip, required this.limit});

  factory JSONModel.fromJson(Map<String, dynamic> json){
    List<ProductsModel> mProducts = [];
    for(Map<String , dynamic> eachProduct in json['products']){
      mProducts.add(ProductsModel.fromJson(eachProduct));
    }

    return JSONModel(
        products: mProducts,
        total: json['total'],
        skip: json['skip'],
        limit: json['limit']);
  }
}
