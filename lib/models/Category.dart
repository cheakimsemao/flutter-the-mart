class Category {
  int id;
  String categoryName;
  String categoryIcon;

  Category(
    this.id,
    this.categoryName,
    this.categoryIcon,
  );

  Category.fromJson(Map<String, dynamic> json)
    : id = json['id'],
      categoryName = json['categoryName'],
      categoryIcon = json['categoryIcon'];
}
