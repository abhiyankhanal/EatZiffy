class CategoryModel {
  int? id;
  String? category;
  int? totalBookmarked;

  CategoryModel({this.id, this.category, this.totalBookmarked});

  CategoryModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    category = json['category'];
    totalBookmarked = json['total_bookmarked'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['category'] = this.category;
    data['total_bookmarked'] = this.totalBookmarked;
    return data;
  }
}
