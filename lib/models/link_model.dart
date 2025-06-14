class LinkModel {
  final String id;
  final String site;
  final String media;
  final String? iconUrl;

  LinkModel({
    required this.id,
    required this.site,
    required this.media,
    this.iconUrl,
  });
}

final List<LinkModel> links = [
  LinkModel(id: '1', site: 'Site', media: 'Media'),
  LinkModel(id: '2', site: 'LinkedIn', media: 'Professional Network'),
  LinkModel(id: '3', site: 'GitHub', media: 'Code Repository'),
];
