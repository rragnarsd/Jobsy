class LanguageModel {
  final String id;
  final String name;
  final String level;
  final String flagCode;

  LanguageModel({
    required this.id,
    required this.name,
    required this.level,
    required this.flagCode,
  });
}

final List<LanguageModel> languages = [
  LanguageModel(
    id: '1',
    name: 'Íslenska',
    level: 'Framúrskarandi',
    flagCode: 'IS',
  ),
  LanguageModel(
    id: '2',
    name: 'Enska',
    level: 'Framúrskarandi',
    flagCode: 'GB',
  ),
];
