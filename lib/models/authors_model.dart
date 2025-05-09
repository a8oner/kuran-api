class AuthorsModel {
  int? id;
  String? name;
  String? description;
  String? language;

  AuthorsModel({this.id, this.name, this.description, this.language});

  AuthorsModel.fromJson(Map<String, dynamic> json) {
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