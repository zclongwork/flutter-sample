class CategoryModel {
  int id;
  String name;
  Null alias;
  String description;
  String bgPicture;
  String bgColor;
  String headerImage;
  int defaultAuthorId;
  int tagId;

  CategoryModel(
      {required this.id,
        required this.name,
        required this.alias,
        required this.description,
        required this.bgPicture,
        required this.bgColor,
        required this.headerImage,
        required this.defaultAuthorId,
        required this.tagId});

  CategoryModel.fromJson(Map<String, dynamic> json) :
    id = json['id'] ?? 0,
    name = json['name'] ?? '',
    alias = json['alias']?? '',
    description = json['description'] ?? '',
    bgPicture = json['bgPicture']?? 0,
    bgColor = json['bgColor']?? 0,
    headerImage = json['headerImage']?? 0,
    defaultAuthorId = json['defaultAuthorId']?? 0,
    tagId = json['tagId']?? 0;


  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['alias'] = this.alias;
    data['description'] = this.description;
    data['bgPicture'] = this.bgPicture;
    data['bgColor'] = this.bgColor;
    data['headerImage'] = this.headerImage;
    data['defaultAuthorId'] = this.defaultAuthorId;
    data['tagId'] = this.tagId;
    return data;
  }
}