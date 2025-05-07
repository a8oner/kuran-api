class SurahsModel {
  int? id;
  String? name;
  String? slug;
  int? verseCount;
  int? pageNumber;
  String? nameOriginal;


  SurahsModel(
      {this.id,
        this.name,
        this.slug,
        this.verseCount,
        this.pageNumber,
        this.nameOriginal,
        });

  SurahsModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    slug = json['slug'];
    verseCount = json['verse_count'];
    pageNumber = json['pageNumber'];
    nameOriginal = json['name_original'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['slug'] = this.slug;
    data['verse_count'] = this.verseCount;
    data['pageNumber'] = this.pageNumber;
    data['name_original'] = this.nameOriginal;
    return data;
  }
}
