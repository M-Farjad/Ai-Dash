import 'dart:convert';
import 'dart:developer';

import '../header.dart';

class TranslateController extends GetxController {
  //! members
  final textController = TextEditingController();
  final resController = TextEditingController();
  final from = ''.obs;
  final to = ''.obs;
  final status = Status.none.obs;

  // list of languages available
  final lang = const [
    "Afar",
    "Abkhazian",
    "Avestan",
    "Afrikaans",
    "Akan",
    "Amharic",
    "Aragonese",
    "Arabic",
    "Assamese",
    "Avaric",
    "Aymara",
    "Azerbaijani",
    "Bashkir",
    "Belarusian",
    "Bulgarian",
    "Bihari languages",
    "Bislama",
    "Bambara",
    "Bengali",
    "Tibetan",
    "Breton",
    "Bosnian",
    "Catalan",
    "Chechen",
    "Chamorro",
    "Corsican",
    "Cree",
    "Czech",
    "Church Slavic",
    "Chuvash",
    "Welsh",
    "Danish",
    "German",
    "Maldivian",
    "Dzongkha",
    "Ewe",
    "Greek",
    "English",
    "Esperanto",
    "Spanish",
    "Estonian",
    "Basque",
    "Persian",
    "Fulah",
    "Finnish",
    "Fijian",
    "Faroese",
    "French",
    "Western Frisian",
    "Irish",
    "Gaelic",
    "Galician",
    "Guarani",
    "Gujarati",
    "Manx",
    "Hausa",
    "Hebrew",
    "Hindi",
    "Hiri Motu",
    "Croatian",
    "Haitian",
    "Hungarian",
    "Armenian",
    "Herero",
    "Interlingua",
    "Indonesian",
    "Interlingue",
    "Igbo",
    "Sichuan Yi",
    "Inupiaq",
    "Ido",
    "Icelandic",
    "Italian",
    "Inuktitut",
    "Japanese",
    "Javanese",
    "Georgian",
    "Kongo",
    "Kikuyu",
    "Kuanyama",
    "Kazakh",
    "Kalaallisut",
    "Central Khmer",
    "Kannada",
    "Korean",
    "Kanuri",
    "Kashmiri",
    "Kurdish",
    "Komi",
    "Cornish",
    "Kirghiz",
    "Latin",
    "Luxembourgish",
    "Ganda",
    "Limburgan",
    "Lingala",
    "Lao",
    "Lithuanian",
    "Luba-Katanga",
    "Latvian",
    "Malagasy",
    "Marshallese",
    "Maori",
    "Macedonian",
    "Malayalam",
    "Mongolian",
    "Marathi",
    "Malay",
    "Maltese",
    "Burmese",
    "Nauru",
    "Norwegian",
    "North Ndebele",
    "Nepali",
    "Ndonga",
    "Dutch",
    "South Ndebele",
    "Navajo",
    "Chichewa",
    "Occitan",
    "Ojibwa",
    "Oromo",
    "Oriya",
    "Ossetic",
    "Panjabi",
    "Pali",
    "Polish",
    "Pushto",
    "Portuguese",
    "Quechua",
    "Romansh",
    "Rundi",
    "Romanian",
    "Russian",
    "Kinyarwanda",
    "Sanskrit",
    "Sardinian",
    "Sindhi",
    "Northern Sami",
    "Sango",
    "Sinhala",
    "Slovak",
    "Slovenian",
    "Samoan",
    "Shona",
    "Somali",
    "Albanian",
    "Serbian",
    "Swati",
    "Sotho, Southern",
    "Sundanese",
    "Swedish",
    "Swahili",
    "Tamil",
    "Telugu",
    "Tajik",
    "Thai",
    "Tigrinya",
    "Turkmen",
    "Tagalog",
    "Tswana",
    "Tonga",
    "Turkish",
    "Tsonga",
    "Tatar",
    "Twi",
    "Tahitian",
    "Uighur",
    "Ukrainian",
    "Urdu",
    "Uzbek",
    "Venda",
    "Vietnamese",
    "Volapük",
    "Walloon",
    "Wolof",
    "Xhosa",
    "Yiddish",
    "Yoruba",
    "Zhuang",
    "Chinese",
    "Zulu"
  ];

  //! methods
  void translate() async {
    try {
      if (textController.text.trim().isNotEmpty && to.isNotEmpty) {
        status.value = Status.loading;
        // !Bot Message
        String prompt = '';
        if (from.isNotEmpty) {
          prompt =
              'Can You translate given text from ${from.value} to ${to.value}:\n${textController.text}';
        } else {
          prompt =
              'Can you translate the given text to ${to.value}:\n${textController.text}';
        }
        log(prompt);
        final res = await APIs.getAnswer(prompt);
        resController.text = utf8.decode(res.codeUnits);
        status.value = Status.success;
        textController.clear();
      } else {
        status.value = Status.none;
        textController.text.trim().isEmpty
            ? MyDialog.getInfo(Strings.enterSomeText)
            : MyDialog.getInfo(Strings.enterLanguage);
      }
    } catch (e) {
      log(e.toString());
      MyDialog.getWarning(Strings.somthingWentWrong);
    }
  }

  void swapLanguage() {
    if (to.trim().isNotEmpty && from.trim().isNotEmpty) {
      final temp = to.value;
      to.value = from.value;
      from.value = temp;
    }
  }
}
