class ProductModel {
  String? image;
  String? title;
  bool? isFavorite;
  bool? isBookmarked;
  int? labelId;
  int? catId;
  int? id;

  ProductModel(
      {this.image,
      this.title,
      this.isFavorite,
      this.isBookmarked,
      this.labelId,
      this.catId,
      this.id});

  ProductModel.fromJson(Map<String, dynamic> json) {
    image = json['image'];
    title = json['title'];
    isFavorite = json['isFavorite'];
    isBookmarked = json['isBookmarked'];
    labelId = json['labelId'];
    catId = json['catId'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['image'] = this.image;
    data['title'] = this.title;
    data['isFavorite'] = this.isFavorite;
    data['isBookmarked'] = this.isBookmarked;
    data['labelId'] = this.labelId;
    data['catId'] = this.catId;
    data['id'] = this.id;
    return data;
  }
}
