class ReferenceModel {
  final String id;
  final String name;
  final String jobTitle;
  final String email;
  final String? imageUrl;

  ReferenceModel({
    required this.id,
    required this.name,
    required this.jobTitle,
    required this.email,
    this.imageUrl,
  });
}

final List<ReferenceModel> references = [
  ReferenceModel(id: '1', name: 'Name', jobTitle: 'Job title', email: 'Email'),
  ReferenceModel(
    id: '2',
    name: 'John Doe',
    jobTitle: 'Senior Developer',
    email: 'john.doe@example.com',
  ),
];
