

class VideoItem {
  final String id;
  final String title;
  final String thumbnailUrl;
  final String channelName;
  final String description;

  // final String videoUrl;

  VideoItem( {
    required this.id,
    required this.title,
    required this.thumbnailUrl,
    required this.channelName,
    required this.description,
  });

  factory VideoItem.fromJson(Map<String, dynamic> json) {
    final id = json['id']['videoId'];
    final title = json['snippet']['title'];
    final thumbnailUrl = json['snippet']['thumbnails']['high']['url'];
    final channelName = json['snippet']['channelTitle'];
    final description = json['snippet']['description'];
  return VideoItem(id: id, title: title, thumbnailUrl: thumbnailUrl,  channelName: channelName, description: description);
  }
}


