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
                onTap: () => Get.bottomSheet(LanguageSheet(c: _c, s: _c.from)),
                borderRadius: const BorderRadius.all(Radius.circular(20)),
                child: Container(
                  height: 50,
                  width: Get.width * .4,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    border: Border.all(color: CustomColors.secondaryColor),
                    borderRadius: const BorderRadius.all(Radius.circular(20)),
                  ),
                  child: Obx(
                    () => Text(
                      _c.from.isEmpty ? 'Auto' : _c.from.value,
                      style:
                          Styles.regularUbuntu12(CustomColors.secondaryColor),
                    ),
                  ),
                ),
              ),
              IconButton(
                icon: Obx(() => Icon(
                      CupertinoIcons.repeat,
                      color: _c.to.isNotEmpty && _c.from.isNotEmpty
                          ? CustomColors.secondaryColor
                          : CustomColors.grey,
                    )),
                onPressed: _c.swapLanguage,
              ),
              //! To Language
              InkWell(
                onTap: () => Get.bottomSheet(LanguageSheet(c: _c, s: _c.to)),
                borderRadius: const BorderRadius.all(Radius.circular(20)),
                child: Container(
                  height: 50,
                  width: Get.width * .4,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    border: Border.all(color: CustomColors.secondaryColor),
                    borderRadius: const BorderRadius.all(Radius.circular(20)),
                  ),
                  child: Obx(
                    () => Text(
                      _c.to.isEmpty ? 'To' : _c.to.value,
                      style:
                          Styles.regularUbuntu12(CustomColors.secondaryColor),
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
                hintStyle: Styles.regularUbuntu14(CustomColors.secondaryColor),
                hintText: Strings.translateAnythingYouWant,
                border: const OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                ),
              ),
            ),
          ),
          Obx(() {
            _c.resController.value;
            _c.status.value;
            if (_c.resController.text.isNotEmpty) return _translate();
            return const SizedBox.shrink();
          }),
          SizedBox(height: Get.height * .02),
          Align(
            child:
                CustomButton(onPressed: _c.translate, text: Strings.translate),
          )
        ],
      ),
    );
  }

  Widget _translate() => switch (_c.status.value) {
        Status.none => const SizedBox.shrink(),
        Status.success => Padding(
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
        Status.loading => const Align(child: CustomLoading())
      };
}
