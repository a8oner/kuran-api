import 'package:a12_proje/models/audio1.dart';



class Surah {
  int? id;
  String? name;
  String? slug;
  int? verseCount;
  int? pageNumber;
  String? nameOriginal;
  Audio? audio;

  Surah({
    this.id,
    this.name,
    this.slug,
    this.verseCount,
    this.pageNumber,
    this.nameOriginal,
    this.audio,
  });

  Surah copyWith({
    int? id,
    String? name,
    String? slug,
    int? verseCount,
    int? pageNumber,
    String? nameOriginal,
    Audio? audio,
  }) {
    return Surah(
      id: id ?? this.id,
      name: name ?? this.name,
      slug: slug ?? this.slug,
      verseCount: verseCount ?? this.verseCount,
      pageNumber: pageNumber ?? this.pageNumber,
      nameOriginal: nameOriginal ?? this.nameOriginal,
      audio: audio ?? this.audio,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'slug': slug,
      'verse_count': verseCount,
      'pageNumber': pageNumber,
      'name_original': nameOriginal,
      'audio': audio,
    };
  }

  factory Surah.fromJson(Map<String, dynamic> json) {
    return Surah(
      id: json['id'] as int?,
      name: json['name'] as String?,
      slug: json['slug'] as String?,
      verseCount: json['verse_count'] as int?,
      pageNumber: json['pageNumber'] as int?,
      nameOriginal: json['name_original'] as String?,
      audio: json['audio'] == null
          ? null
          : Audio.fromJson(json['audio'] as Map<String, dynamic>),
    );
  }
}
