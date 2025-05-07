class Author {
  int? id;
  String? name;
  String? description;
  String? language;

  Author({
    this.id,
    this.name,
    this.description,
    this.language,
  });

  Author copyWith({
    int? id,
    String? name,
    String? description,
    String? language,
  }) {
    return Author(
      id: id ?? this.id,
      name: name ?? this.name,
      description: description ?? this.description,
      language: language ?? this.language,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'description': description,
      'language': language,
    };
  }

  factory Author.fromJson(Map<String, dynamic> json) {
    return Author(
      id: json['id'] as int?,
      name: json['name'] as String?,
      description: json['description'] as String?,
      language: json['language'] as String?,
    );
  }
}
