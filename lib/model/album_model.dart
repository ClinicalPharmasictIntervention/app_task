class AlbumModel {
  AlbumModel({
    this.userId,
    this.id,
    this.title,
  });

  int? userId;
  int? id;
  String? title;

  AlbumModel.fromJson(Map<String, dynamic>? json) {
    if (json != null) {
      userId = json['userId'];
      id = json['id'];
      title = json['title'];
    }
  }

  Map<String, dynamic> toMap() {
    return {
      'userId': userId,
      'userId': userId,
      'id': id,
      'title': title,
    };
  }
}
