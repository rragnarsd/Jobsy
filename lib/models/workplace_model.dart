class WorkplaceModel {
  final String id;
  final String name;
  final String description;
  final String location;
  final String websiteUrl;
  final String size;
  final List<String> awards;
  final List<String> perks;
  final List<String> otherJobIds;

  WorkplaceModel({
    required this.id,
    required this.name,
    required this.description,
    required this.location,
    required this.websiteUrl,
    required this.size,
    this.awards = const [],
    this.perks = const [],
    this.otherJobIds = const [],
  });
}
