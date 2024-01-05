import 'dart:developer';

import '../header.dart';
import 'package:appwrite/appwrite.dart';

class AppWrite {
  static final _client = Client();
  static final _db = Databases(_client);
  static const _apiKey = 'apiKey';
  static void init() {
    _client
        .setEndpoint('https://cloud.appwrite.io/v1')
        .setProject('659855304c6b2a0508d8')
        .setSelfSigned(status: true);
    getApiKey();
  }

  static Future<String> getApiKey() async {
    try {
      final d = await _db.getDocument(
          databaseId: 'MyDB',
          collectionId: 'APIKey',
          documentId: 'chatGptApiKey');
      apiKey = d.data[_apiKey];
      log(apiKey.toString());
      return apiKey;
    } catch (e) {
      log(e.toString());
      return '';
    }
  }
}
