class CategoryModel {
  const CategoryModel({required this.title, this.id, this.icon, this.desc});

  final String? title;
  final String? id;
  final String? icon;
  final String? desc;

  factory CategoryModel.fromJson(Map<String, dynamic> json) {
    return CategoryModel(
      id: json['id'],
      title: json['title'],
      icon: json["imageUrl"],
       desc: json['Description'],
    );
  }
}
