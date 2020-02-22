class ImageItem {
  String id;
  String url;
  String title;
  String description;

  ImageItem({this.id, this.url, this.title, this.description});

  ImageItem.fromJson(Map<String, dynamic> json, String id) {
    id = id;
    url = json['url'];
    title = json['title'];
    description = json['description'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['url'] = this.url ?? '';
    data['title'] = this.title ?? '';
    data['description'] = this.description ?? '';
    return data;
  }
}
