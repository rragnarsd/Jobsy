class SkillsModel {
  final String id;
  final String category;
  final String categoryItem;

  SkillsModel({
    required this.id,
    required this.category,
    required this.categoryItem,
  });

  factory SkillsModel.fromJson(Map<String, dynamic> json) {
    return SkillsModel(
      id: json['id'],
      category: json['category'],
      categoryItem: json['categoryItem'],
    );
  }

  Map<String, dynamic> toJson() {
    return {'id': id, 'category': category, 'categoryItem': categoryItem};
  }
}
