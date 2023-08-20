import 'package:logging/logging.dart';
import 'package:xml/xml.dart';

final logger = Logger("[model]");

final THUMB_BASE_URL = "https://c7.alamy.com/zooms/3/";
final BASE_URL = "https://c7.alamy.com/comb/";

class Image {
  String id;
  String pseudoid;

  String ar;
  int imgseq;
  int li;
  int mr;
  int pr;

  int pixX;
  int pixY;

  String caption;
  String locale;

  //DateTime dateTaken;
  DateTime uploadDate;

  Image({
    required this.id,
    required this.pseudoid,
    required this.ar,
    required this.imgseq,
    required this.li,
    required this.mr,
    required this.pr,
    required this.pixX,
    required this.pixY,
    required this.caption,
    required this.locale,
    //required this.dateTaken,
    required this.uploadDate,
  });

  static Image fromXml(XmlNode xml) {
    try {
      return Image(
        id: xml.getAttribute('ID')!,
        pseudoid: xml.getAttribute('pseudoid')!,
        ar: xml.getAttribute('AR')!,
        imgseq: int.parse(xml.getAttribute('IMGSEQ')!),
        li: int.parse(xml.getAttribute('LI')!),
        mr: int.parse(xml.getAttribute('MR')!),
        pr: int.parse(xml.getAttribute('PR')!),
        pixX: int.parse(xml.getAttribute('PIX_X')!),
        pixY: int.parse(xml.getAttribute('PIX_Y')!),
        caption: xml.getAttribute('CAPTION')!,
        locale: xml.getAttribute('LC')!,
        //dateTaken: DateTime.parse(xml.getAttribute('DATETAKEN')),
        uploadDate: DateTime.parse(xml.getAttribute('uploaddate')!),
      );
    } catch (errorObj) {
      logger.severe("Failed to parse the XML object. ${errorObj.toString()}", errorObj);
      rethrow;
    }
  }

  Uri get imageURL => Uri.parse("$BASE_URL/9/$id/$ar.jpg");
}
