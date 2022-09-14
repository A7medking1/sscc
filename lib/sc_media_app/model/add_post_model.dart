class AddPostModel{

  String? caption;
  String? display_picture;
  String? display_content;

  AddPostModel({this.caption, this.display_picture, this.display_content});

  Map<String, dynamic> toJson() {
    return {
      "caption": caption,
      "display_picture": display_picture,
      "display_content": display_content,
    };
  }
}