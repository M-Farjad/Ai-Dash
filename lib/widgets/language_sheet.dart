import 'dart:developer';

import '../header.dart';

class LanguageSheet extends StatelessWidget {
  LanguageSheet({super.key, required this.c, required this.s});
  final TranslateController c;
  final RxString s;
  final search = ''.obs;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
          left: Get.width * .04, right: Get.width * .04, top: Get.height * .02),
      height: Get.height * .5,
      decoration: BoxDecoration(
        color: Theme.of(context).scaffoldBackgroundColor,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(15),
          topRight: Radius.circular(15),
        ),
      ),
      child: Column(
        children: [
          ChatTextField(
            // controller: c.textController,
            controller: null,
            hint: Strings.searchLanguage,
            prfIcon: const Icon(
              Icons.translate_rounded,
              color: CustomColors.primaryColor,
            ),
            onChanged: (p0) => search.value = p0.toLowerCase(),
          ),
          Expanded(
            flex: 8,
            child: Obx(
              () {
                final List<String> list = search.isEmpty
                    ? c.lang
                    : c.lang
                        .where((e) => e.toLowerCase().contains(search.value))
                        .toList();
                return ListView.builder(
                  physics: const BouncingScrollPhysics(),
                  itemCount: list.length,
                  padding: EdgeInsets.only(top: Get.height * .02, left: 8),
                  itemBuilder: (ctx, index) => InkWell(
                    onTap: () {
                      s.value = list[index];
                      log(list[index]);
                      Get.back();
                    },
                    child: Padding(
                      padding: EdgeInsets.only(bottom: Get.height * .02),
                      child: Text(list[index]),
                    ),
                  ),
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
