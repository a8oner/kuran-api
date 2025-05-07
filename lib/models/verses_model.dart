class VersesModel {
  int? id;
  Surah? surah;
  int? verseNumber;
  String? verse;
  int? page;
  int? juzNumber;
  String? verseWithoutVowel;
  String? transcription;
  Translation? translation;

  VersesModel(
      {this.id,
        this.surah,
        this.verseNumber,
        this.verse,
        this.page,
        this.juzNumber,
        this.verseWithoutVowel,
        this.transcription,
        this.translation});

  VersesModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    surah = json['surah'] != null ? new Surah.fromJson(json['surah']) : null;
    verseNumber = json['verse_number'];
    verse = json['verse'];
    page = json['page'];
    juzNumber = json['juzNumber'];
    verseWithoutVowel = json['verse_without_vowel'];
    transcription = json['transcription'];
    translation = json['translation'] != null
        ? new Translation.fromJson(json['translation'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    if (this.surah != null) {
      data['surah'] = this.surah!.toJson();
    }
    data['verse_number'] = this.verseNumber;
    data['verse'] = this.verse;
    data['page'] = this.page;
    data['juzNumber'] = this.juzNumber;
    data['verse_without_vowel'] = this.verseWithoutVowel;
    data['transcription'] = this.transcription;
    if (this.translation != null) {
      data['translation'] = this.translation!.toJson();
    }
    return data;
  }
}

class Surah {
  int? id;
  String? name;
  String? slug;
  int? verseCount;
  int? pageNumber;
  String? nameOriginal;
  Audio? audio;

  Surah(
      {this.id,
        this.name,
        this.slug,
        this.verseCount,
        this.pageNumber,
        this.nameOriginal,
        this.audio});

  Surah.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    slug = json['slug'];
    verseCount = json['verse_count'];
    pageNumber = json['pageNumber'];
    nameOriginal = json['name_original'];
    audio = json['audio'] != null ? new Audio.fromJson(json['audio']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['slug'] = this.slug;
    data['verse_count'] = this.verseCount;
    data['pageNumber'] = this.pageNumber;
    data['name_original'] = this.nameOriginal;
    if (this.audio != null) {
      data['audio'] = this.audio!.toJson();
    }
    return data;
  }
}

class Audio {
  String? mp3;
  int? duration;

  Audio({this.mp3, this.duration});

  Audio.fromJson(Map<String, dynamic> json) {
    mp3 = json['mp3'];
    duration = json['duration'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['mp3'] = this.mp3;
    data['duration'] = this.duration;
    return data;
  }
}

class Translation {
  int? id;
  Author? author;
  String? text;
  List<Footnotes>? footnotes;

  Translation({this.id, this.author, this.text, this.footnotes});

  Translation.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    author =
    json['author'] != null ? new Author.fromJson(json['author']) : null;
    text = json['text'];
    if (json['footnotes'] != null) {
      footnotes = <Footnotes>[];
      json['footnotes'].forEach((v) {
        footnotes!.add(new Footnotes.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    if (this.author != null) {
      data['author'] = this.author!.toJson();
    }
    data['text'] = this.text;
    if (this.footnotes != null) {
      data['footnotes'] = this.footnotes!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Author {
  int? id;
  String? name;
  String? description;
  String? language;

  Author({this.id, this.name, this.description, this.language});

  Author.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    description = json['description'];
    language = json['language'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['description'] = this.description;
    data['language'] = this.language;
    return data;
  }
}

class Footnotes {
  int? id;
  int? number;
  String? text;

  Footnotes({this.id, this.number, this.text});

  Footnotes.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    number = json['number'];
    text = json['text'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['number'] = this.number;
    data['text'] = this.text;
    return data;
  }
}