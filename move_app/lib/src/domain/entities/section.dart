class Section {
  final int id;
  final String title;
  final String slug;
  final String image;

  Section({
    required this.id,
    required this.title,
    required this.slug,
    required this.image,
  });
}

class ExtendedSection {
  final int id;
  final String title;
  final String image;
  final String description;
  final Iterable<SubSection> subSections;

  ExtendedSection({
    required this.id,
    required this.title,
    required this.image,
    required this.description,
    required this.subSections,
  });
}

class SubSection {
  final int id;
  final String title;
  final String slug;
  final String image;
  final String description;
  final String dashboardUrl;

  SubSection({
    required this.id,
    required this.title,
    required this.slug,
    required this.image,
    required this.description,
    required this.dashboardUrl,
  });
}

typedef JSON = Map<String, dynamic>;
