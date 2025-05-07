import 'package:a12_proje/models/surah1.dart';
import 'package:a12_proje/models/translation1.dart';



class Data {
  int? id;
  Surah? surah;
  int? verseNumber;
  String? verse;
  int? page;
  int? juzNumber;
  String? verseWithoutVowel;
  String? transcription;
  Translation? translation;

  Data({
    this.id,
    this.surah,
    this.verseNumber,
    this.verse,
    this.page,
    this.juzNumber,
    this.verseWithoutVowel,
    this.transcription,
    this.translation,
  });

  Data copyWith({
    int? id,
    Surah? surah,
    int? verseNumber,
    String? verse,
    int? page,
    int? juzNumber,
    String? verseWithoutVowel,
    String? transcription,
    Translation? translation,
  }) {
    return Data(
      id: id ?? this.id,
      surah: surah ?? this.surah,
      verseNumber: verseNumber ?? this.verseNumber,
      verse: verse ?? this.verse,
      page: page ?? this.page,
      juzNumber: juzNumber ?? this.juzNumber,
      verseWithoutVowel: verseWithoutVowel ?? this.verseWithoutVowel,
      transcription: transcription ?? this.transcription,
      translation: translation ?? this.translation,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'surah': surah,
      'verse_number': verseNumber,
      'verse': verse,
      'page': page,
      'juzNumber': juzNumber,
      'verse_without_vowel': verseWithoutVowel,
      'transcription': transcription,
      'translation': translation,
    };
  }

  factory Data.fromJson(Map<String, dynamic> json) {
    return Data(
      id: json['id'] as int?,
      surah: json['surah'] == null
          ? null
          : Surah.fromJson(json['surah'] as Map<String, dynamic>),
      verseNumber: json['verse_number'] as int?,
      verse: json['verse'] as String?,
      page: json['page'] as int?,
      juzNumber: json['juzNumber'] as int?,
      verseWithoutVowel: json['verse_without_vowel'] as String?,
      transcription: json['transcription'] as String?,
      translation: json['translation'] == null
          ? null
          : Translation.fromJson(json['translation'] as Map<String, dynamic>),
    );
  }
}
