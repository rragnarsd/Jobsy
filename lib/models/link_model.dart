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
