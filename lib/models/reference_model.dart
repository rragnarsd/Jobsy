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
  ReferenceModel(
    id: '1',
    name: 'Paul Newman',
    jobTitle: 'CEO',
    email: 'paul_ceo@hotmail.com',
  ),
  ReferenceModel(
    id: '2',
    name: 'John Doe',
    jobTitle: 'Senior Developer',
    email: 'john.doe@example.com',
  ),
];
