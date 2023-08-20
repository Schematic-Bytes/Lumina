import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:lumina/requests/config.dart';

class Client {
  final _innerClient = http.Client();

  // Future<Iterable<Image>> getImages() async {
  //   var response = await _innerClient.get(Uri.parse("2?qt=apple"));
  //   var xmlData = XmlDocument.parse(response.body);
  //   var images = xmlData.getElement('IMAGES');
  //   if (images?.children != null) {
  //     return images.children.map((each) => Image.fromXml(each));
  //   }

  //   print(Image.fromXml(images!.children!.first).caption);
  // }

  Future<String> predict(String filePath) async {
    var request = http.MultipartRequest('POST', Uri.parse("${AppConfig.URI}/api/v1/reverse_lookup/"));
    request.files.add(await http.MultipartFile.fromPath('file', filePath));
    final response = await request.send();
    final data = json.decode(await response.stream.bytesToString());
    return data['label']!;
  }
}
