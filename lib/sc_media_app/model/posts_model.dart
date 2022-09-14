class PostsModel {
   String? displayName;
   String? createdAt;
   String? updatedAt;
   String? displayContent;
   String? displayPicture;
   String? caption;

   PostsModel(
      {required this.displayName,
        required this.createdAt,
        required this.updatedAt,
        required this.displayPicture,
        required this.caption,
        required this.displayContent});
  factory PostsModel.fromJson(Map<String, dynamic> json) => PostsModel(
    caption: json['caption'],
    createdAt: json['createdAt'],
    displayName: json['display_name'],
    updatedAt: json['updatedAt'],
    displayPicture: json['display_picture'],
    displayContent: json['display_content'],
  );




}