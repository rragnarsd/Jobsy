class EducationModel {
  final String id;
  final String name;
  final String school;
  final String type;
  final String yearStart;
  final String yearEnd;

  EducationModel({
    required this.id,
    required this.name,
    required this.school,
    required this.type,
    required this.yearStart,
    required this.yearEnd,
  });
}

final List<EducationModel> educations = [
  EducationModel(
    id: '1',
    name: 'Nám',
    school: 'Skóli',
    type: 'Type of school',
    yearStart: 'Year start',
    yearEnd: 'Year end',
  ),
  EducationModel(
    id: '2',
    name: 'Another Education',
    school: 'Another School',
    type: 'Another Type',
    yearStart: '2020',
    yearEnd: '2022',
  ),
];
