import 'package:a12_proje/models/author1.dart';



class Translation {
  int? id;
  Author? author;
  String? text;
  Null? footnotes;

  Translation({
    this.id,
    this.author,
    this.text,
    this.footnotes,
  });

  Translation copyWith({
    int? id,
    Author? author,
    String? text,
    Null? footnotes,
  }) {
    return Translation(
      id: id ?? this.id,
      author: author ?? this.author,
      text: text ?? this.text,
      footnotes: footnotes ?? this.footnotes,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'author': author,
      'text': text,
      'footnotes': footnotes,
    };
  }

  factory Translation.fromJson(Map<String, dynamic> json) {
    return Translation(
      id: json['id'] as int?,
      author: json['author'] == null
          ? null
          : Author.fromJson(json['author'] as Map<String, dynamic>),
      text: json['text'] as String?,
      footnotes: json['footnotes'] as Null?,
    );
  }
}
