class PhotoModel {
  PhotoModel({
    this.albumId,
    this.id,
    this.url,
    this.thumbnailUrl,
  });

  int? albumId;
  int? id;
  String? url;
  String? thumbnailUrl;

  PhotoModel.fromJson(Map<String, dynamic>? json) {
    if (json != null) {
      albumId = json['albumId'];
      id = json['id'];
      url = json['url'];
      thumbnailUrl = json['thumbnailUrl'];
    }
  }

  Map<String, dynamic> toMap() {
    return {
      'albumId': albumId,
      'id': id,
      'url': url,
      'thumbnailUrl': thumbnailUrl,
    };
  }
}
