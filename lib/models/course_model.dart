class CourseModel {
  final String id;
  final String title;
  final String businessName;
  final DateTime date;
  final double price;
  final String type;
  final int duration;
  final String courseInfo;
  final String logoUrl;
  final List<String> categories;

  CourseModel({
    required this.id,
    required this.title,
    required this.businessName,
    required this.date,
    required this.price,
    required this.type,
    required this.duration,
    required this.courseInfo,
    required this.categories,
    required this.logoUrl,
  });
}
