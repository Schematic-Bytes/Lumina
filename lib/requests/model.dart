import 'package:logging/logging.dart';

final logger = Logger("[model]");

final THUMB_BASE_URL = "https://c7.alamy.com/zooms/3/";
final BASE_URL = "https://c7.alamy.com/comb/";

class ImageObjs {
  String id;

  int mr;
  int pr;

  String filename;
  String caption;

  String thumbnailUrl;

  ImageObjs({
    required this.id,
    required this.mr,
    required this.pr,
    required this.caption,
    required this.filename,
    required this.thumbnailUrl,
  });

  static ImageObjs fromMap(Map<String, dynamic> map) {
    try {
      return ImageObjs(
        id: map['id'],
        mr: map['mr'],
        pr: map['pr'],
        caption: map['caption'],
        filename: map['filename'],
        thumbnailUrl: map['thumbnail_url'],
      );
    } catch (errorObj) {
      logger.severe("Failed to parse the XML object. ${errorObj.toString()}", errorObj);
      rethrow;
    }
  }
}
