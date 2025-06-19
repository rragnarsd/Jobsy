import 'package:codehatch/utils/enums.dart';

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

  static final List<CourseModel> courses = [
    CourseModel(
      id: '1',
      title: 'Flutter Development Bootcamp',
      businessName: 'CodeCraft',
      startDate: DateTime(2025, 7, 1),
      price: 199.99,
      type: CourseTypes.remote,
      timeSpan: 4,
      courseInfo: 'Learn Flutter from scratch and build beautiful native apps.',
      categories: ['Development', 'Mobile', 'Flutter'],
      logoUrl: 'assets/logos/code-craft.png',
      imageUrl:
          'https://images.pexels.com/photos/546819/pexels-photo-546819.jpeg',
    ),
    CourseModel(
      id: '2',
      title: 'Digital Marketing Mastery',
      businessName: 'MarketingPro',
      startDate: DateTime(2025, 8, 15),
      price: 149.99,
      type: CourseTypes.remote,
      timeSpan: 3,
      courseInfo: 'Master SEO, SEM, and social media marketing techniques.',
      categories: ['Marketing', 'Digital'],
      logoUrl: 'assets/logos/marketing-pro.png',
      imageUrl:
          'https://images.pexels.com/photos/95916/pexels-photo-95916.jpeg',
    ),
    CourseModel(
      id: '3',
      title: 'Data Science with Python',
      businessName: 'DataGenius',
      startDate: DateTime(2025, 9, 5),
      price: 249.99,
      type: CourseTypes.onSite,
      timeSpan: 7,
      courseInfo:
          'An in-depth course on data analysis and machine learning using Python.',
      categories: ['Data Science', 'Python', 'AI'],
      logoUrl: 'assets/logos/data-genius.png',
      imageUrl:
          'https://images.pexels.com/photos/1089438/pexels-photo-1089438.jpeg',
    ),
    CourseModel(
      id: '4',
      title: 'UI/UX Design Principles',
      businessName: 'DesignHub',
      startDate: DateTime(2025, 7, 20),
      price: 99.99,
      type: CourseTypes.remote,
      timeSpan: 2,
      courseInfo:
          'Understand core design principles and create user-friendly interfaces.',
      categories: ['Design', 'UI/UX'],
      logoUrl: 'assets/logos/design-hub.png',
      imageUrl:
          'https://images.pexels.com/photos/196644/pexels-photo-196644.jpeg',
    ),
    CourseModel(
      id: '5',
      title: 'Project Management (PMP)',
      businessName: 'ProManage',
      startDate: DateTime(2025, 10, 1),
      price: 299.99,
      type: CourseTypes.onSite,
      timeSpan: 4,
      courseInfo:
          'Prepare for the PMP certification with practical project management training.',
      categories: ['Management', 'PMP'],
      logoUrl: 'assets/logos/pro-manage.png',
      imageUrl:
          'https://images.pexels.com/photos/3183150/pexels-photo-3183150.jpeg',
    ),
  ];
}
