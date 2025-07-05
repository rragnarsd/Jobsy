import 'package:codehatch/utils/extensions.dart';

class CourseModel {
  final String id;
  final String title;
  final String businessName;
  final DateTime startDate;
  final int timeSpan;
  final double price;
  final CourseTypes type;
  final String courseInfo;
  final String logoUrl;
  final List<String> categories;
  final String imageUrl;

  CourseModel({
    required this.id,
    required this.title,
    required this.businessName,
    required this.startDate,
    required this.timeSpan,
    required this.price,
    required this.type,
    required this.courseInfo,
    required this.categories,
    required this.logoUrl,
    required this.imageUrl,
  });

  factory CourseModel.fromJson(Map<String, dynamic> json) {
    return CourseModel(
      id: json['id'],
      title: json['title'],
      businessName: json['businessName'],
      startDate: DateTime.parse(json['startDate']),
      timeSpan: json['timeSpan'],
      price: json['price'],
      type: CourseTypes.values.byName(json['type']),
      courseInfo: json['courseInfo'],
      categories: List<String>.from(json['categories']),
      logoUrl: json['logoUrl'],
      imageUrl: json['imageUrl'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'businessName': businessName,
      'startDate': startDate.toIso8601String(),
      'timeSpan': timeSpan,
      'price': price,
      'type': type.name,
      'courseInfo': courseInfo,
      'categories': categories,
      'logoUrl': logoUrl,
      'imageUrl': imageUrl,
    };
  }
}
