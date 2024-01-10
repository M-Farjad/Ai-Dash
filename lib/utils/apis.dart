import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:translator_plus/translator_plus.dart';

import '../header.dart';

class APIs {
  // Get Answer from ChatGPT
  static Future<String> getAnswer(String question) async {
    try {
      final body = {
        "model": "gpt-3.5-turbo",
        "max_tokens": 2000,
        "temperature": 0,
        "messages": [
          {"role": "user", "content": question},
          // {"role": "system", "content": "You are a helpful assistant."},
          // {
          //   "role": "assistant",
          //   "content": "The Los Angeles Dodgers won the World Series in 2020."
          // },
          // {"role": "user", "content": "Where was it played?"}
        ]
      };
      final res = await http.post(
        Uri.parse('https://api.openai.com/v1/chat/completions'),
        headers: {
          HttpHeaders.contentTypeHeader: "application/json",
          HttpHeaders.authorizationHeader: "Bearer $apiKey"
        },
        body: jsonEncode(body),
      );
      final data = jsonDecode(res.body);

      log(data.toString());
      log(data['choices'][0]['message']['content']);
      return (data['choices'][0]['message']['content']);
    } catch (e) {
      log(e.toString());
      return Strings.somthingWentWrong;
    }
  }

  static Future<List<String>> searchAiImages(String param) async {
    try {
      final res = await http
          .get(Uri.parse('https://lexica.art/api/v1/search?q=$param'));
      final data = jsonDecode(res.body);
      return List.from(data['images']).map((e) => e['src'].toString()).toList();
    } catch (e) {
      log('SearchAiImagesError: $e');
      return [];
    }
  }

  static Future<String> googleTranslate(
      {required String from, required String to, required String text}) async {
    try {
      final res = await GoogleTranslator().translate(text, from: from, to: to);
      // final res = await http.get(Uri.parse(
      //     'https://translate.google.com/translate_a/t?client=at&sc=1&v=2.0&sl=auto&tl=hi&hl=en&ie=UTF-8&oe=UTF-8&text=hello'));
      log(res.text);
      return res.text;
    } catch (e) {
      log(e.toString());
      MyDialog.getWarning(Strings.somthingWentWrong);
      return Strings.somthingWentWrong;
    }
  }
}
