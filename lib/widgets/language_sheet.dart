import '../header.dart';

class LanguageSheet extends StatelessWidget {
  LanguageSheet({super.key, required this.controller, required this.s});
  final TranslateController controller;
  final RxString s;
  final search = ''.obs;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: Get.width * .04),
      height: Get.height * .5,
      decoration: const BoxDecoration(
        color: CustomColors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      child: Column(
        children: [
          SizedBox(height: Get.height * .02),
          ChatTextField(
            controller: controller.textController,
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
                    ? controller.lang
                    : controller.lang
                        .where((e) => e.contains(search.value))
                        .toList();
                return ListView.builder(
                  physics: const BouncingScrollPhysics(),
                  itemCount: list.length,
                  padding: EdgeInsets.only(top: Get.height * .02, left: 8),
                  itemBuilder: (ctx, index) => InkWell(
                    onTap: () {
                      s.value = list[index];
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
