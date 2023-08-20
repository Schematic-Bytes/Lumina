import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:lumina/requests/config.dart';
import 'package:lumina/requests/model.dart';

class Client {
  final _innerClient = http.Client();

  Future<Iterable<ImageObjs>> getImages(
    String query,
    bool mr,
    bool pr,
    String orientation,
    String license,
  ) async {
    var response = await _innerClient
        .get(Uri.parse("${AppConfig.URI}/api/v1/search/$query/?orientation=$orientation?license=$license"));
    var data = json.decode(response.body);
    print(data);
    var results = List.from(data['results']).map((e) => ImageObjs.fromMap(e));
    return results;
  }

  Future<String> predict(String filePath) async {
    var request = http.MultipartRequest('POST', Uri.parse("${AppConfig.URI}/api/v1/reverse_lookup/"));
    request.files.add(await http.MultipartFile.fromPath('file', filePath));
    final response = await request.send();
    final data = json.decode(await response.stream.bytesToString());
    return data['label']!;
  }
}
