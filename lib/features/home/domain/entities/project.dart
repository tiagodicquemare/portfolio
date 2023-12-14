class Project {
  final String assetLogo;
  final String name;
  final String description;
  final DateTime startDate;
  final DateTime endDate;
  final String? websiteUrl;
  final String? playStoreUrl;
  final String? appStoreUrl;
  final List<Technologie> technologies;
  final List<String> screenshots;

  const Project({
    required this.assetLogo,
    required this.name,
    required this.description,
    required this.startDate,
    required this.endDate,
    this.websiteUrl,
    this.playStoreUrl,
    this.appStoreUrl,
    this.technologies = const [],
    this.screenshots = const [],
  });
}

class Technologie {
  String name;
  String description;
  String url;
  Technologie(this.name, this.description, this.url);
}
