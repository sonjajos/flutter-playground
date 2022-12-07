// ignore_for_file: non_constant_identifier_names

class Reciepe {
  final String videoUrl;
  final String thumbnailUrl;
  final int prepTime;
  final String name;
  final int servings;
  final String description;

  const Reciepe({
    this.videoUrl = "",
    this.prepTime = 0,
    required this.name,
    required this.thumbnailUrl,
    required this.servings,
    required this.description,
  });

  factory Reciepe.fromJson(Map<String, dynamic> json) {
    return Reciepe(
      videoUrl: json['video_url'] ?? "",
      prepTime: json['prep_time_minutes'] ?? 0,
      name: json['name'],
      thumbnailUrl: json['thumbnail_url'],
      servings: json['num_servings'],
      description: json['description'],
    );
  }
}

class Reciepes {
  final List<dynamic> results;

  const Reciepes({
    required this.results,
  });

  factory Reciepes.fromJson(json) {
    return Reciepes(
      results: json['results'],
    );
  }
}
