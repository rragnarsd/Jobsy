class WorkplaceModel {
  final String id;
  final String name;
  final String description;
  final String location;
  final String websiteUrl;
  final String size;
  final String? imageUrl;
  final String? logoUrl;
  final String? motto;
  final List<String>? awards;
  final List<PerkModel>? perks;
  final List<String> jobIds;

  WorkplaceModel({
    required this.id,
    required this.name,
    required this.description,
    required this.location,
    required this.websiteUrl,
    required this.size,
    required this.jobIds,
    this.imageUrl,
    this.logoUrl,
    this.motto,
    this.awards,
    this.perks,
  });

  factory WorkplaceModel.fromJson(Map<String, dynamic> json) {
    return WorkplaceModel(
      id: json['id'],
      name: json['name'],
      description: json['description'],
      location: json['location'],
      websiteUrl: json['websiteUrl'],
      size: json['size'],
      imageUrl: json['imageUrl'],
      logoUrl: json['logoUrl'],
      motto: json['motto'],
      awards: json['awards'] != null ? List<String>.from(json['awards']) : null,
      perks: json['perks'] != null
          ? (json['perks'] as List).map((p) => PerkModel.fromJson(p)).toList()
          : null,
      jobIds: List<String>.from(json['jobIds']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'description': description,
      'location': location,
      'websiteUrl': websiteUrl,
      'size': size,
      'imageUrl': imageUrl,
      'logoUrl': logoUrl,
      'motto': motto,
      'awards': awards,
      'perks': perks?.map((p) => p.toJson()).toList() ?? [],
      'jobIds': jobIds,
    };
  }
}

class PerkModel {
  final String title;
  final String description;

  PerkModel({required this.title, required this.description});

  factory PerkModel.fromJson(Map<String, dynamic> json) {
    return PerkModel(title: json['title'], description: json['description']);
  }

  Map<String, dynamic> toJson() {
    return {'title': title, 'description': description};
  }
}
