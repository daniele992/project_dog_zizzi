class Post{
  final int ownerId; //Chiave esterna
  final String title;
  final String? subTitle;
  final String textPost;
  final String? imageUrl;

  //Construttore
  const Post({
    required this.ownerId,
    required this.title,
    this.subTitle,
    required this.textPost,
    this.imageUrl,
  });

  Map<String, dynamic> toJson() => {
    'ownerId': ownerId,
    'title': title,
    'subTitle': subTitle,
    'textPost': textPost,
    'imageUrl': imageUrl,
  };
}

class SettingsPost {
  final String titleColorHex;
  final String? subTitleColorHex;
  final String? fontTitle;
  final String? fontSubTitle;
  final bool? titleIsBold;
  final bool? subTitleIsBold;
  final String? imageAlignment;


  const SettingsPost({
    required this.titleColorHex,
    this.subTitleColorHex,
    this.fontTitle,
    this.fontSubTitle,
    this.titleIsBold = false,
    this.subTitleIsBold = false,
    this.imageAlignment = 'center',
  });

  Map<String, dynamic> toJson() => {
    'titleColorHex': titleColorHex,
    'subTitleColorHex': subTitleColorHex,
    'fontTitle': fontTitle,
    'fontSubTitle': fontSubTitle,
    'titleIsBold': titleIsBold,
    'subTitleIsBold': subTitleIsBold,
    'imageAlignment': imageAlignment
  };
}

class AddPost {
  final Post post;
  final SettingsPost settingsPost;

  const AddPost({
    required this.post,
    required this.settingsPost,
  });

  Map<String, dynamic> toJson() => {
    'post': post.toJson(),
    'settingsPost': settingsPost.toJson(),
    'createdAt': DateTime.now().toIso8601String(),
  };

}