import 'package:flutter/cupertino.dart';

import '../header.dart';

class LanguageTranslatorScreen extends StatefulWidget {
  const LanguageTranslatorScreen({super.key});

  @override
  State<LanguageTranslatorScreen> createState() =>
      _LanguageTranslatorScreenState();
}

class _LanguageTranslatorScreenState extends State<LanguageTranslatorScreen> {
  final _c = TranslateController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(Strings.languageTranslator),
      ),
      body: ListView(
        physics: const BouncingScrollPhysics(),
        padding: EdgeInsets.only(bottom: Get.height * .12),
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              //! From Language
              InkWell(
                onTap: () =>
                    Get.bottomSheet(LanguageSheet(controller: _c, s: _c.from)),
                borderRadius: const BorderRadius.all(Radius.circular(20)),
                child: Container(
                  height: 50,
                  width: Get.width * .4,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    border: Border.all(color: CustomColors.primaryColor),
                    borderRadius: const BorderRadius.all(Radius.circular(20)),
                  ),
                  child: Obx(
                    () => Text(
                      _c.from.isEmpty ? 'Auto' : _c.from.value,
                      style: Styles.regularUbuntu12(CustomColors.primaryColor),
                    ),
                  ),
                ),
              ),
              IconButton(
                icon: const Icon(CupertinoIcons.repeat),
                onPressed: () {},
              ),
              //! To Language
              InkWell(
                onTap: () =>
                    Get.bottomSheet(LanguageSheet(controller: _c, s: _c.to)),
                borderRadius: const BorderRadius.all(Radius.circular(20)),
                child: Container(
                  height: 50,
                  width: Get.width * .4,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    border: Border.all(color: CustomColors.primaryColor),
                    borderRadius: const BorderRadius.all(Radius.circular(20)),
                  ),
                  child: Obx(
                    () => Text(
                      _c.to.isEmpty ? 'To' : _c.to.value,
                      style: Styles.regularUbuntu12(CustomColors.primaryColor),
                    ),
                  ),
                ),
              ),
            ],
          ),
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: Get.width * .04,
              vertical: Get.height * .035,
            ),
            child: TextFormField(
              minLines: 5,
              maxLines: null,
              onTapOutside: (e) => Focus.of(context).unfocus(),
              controller: _c.textController,
              decoration: InputDecoration(
                hintStyle: Styles.regularUbuntu14(CustomColors.primaryColor),
                hintText: Strings.translateAnythingYouWant,
                border: const OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                ),
              ),
            ),
          ),
          if (_c.resController.text.isNotEmpty)
            Padding(
              padding: EdgeInsets.symmetric(horizontal: Get.width * .04),
              child: TextFormField(
                maxLines: null,
                controller: _c.resController,
                onTapOutside: (e) => Focus.of(context).unfocus(),
                decoration: const InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                  ),
                ),
              ),
            ),
          SizedBox(height: Get.height * .02),
          Align(child: CustomButton(onPressed: () {}, text: Strings.translate))
        ],
      ),
    );
  }
}
