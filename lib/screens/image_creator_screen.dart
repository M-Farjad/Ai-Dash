import '../header.dart';

class ImageCreatorScreen extends StatefulWidget {
  const ImageCreatorScreen({super.key});

  @override
  State<ImageCreatorScreen> createState() => _ImageCreatorScreenState();
}

class _ImageCreatorScreenState extends State<ImageCreatorScreen> {
  final _c = Get.put(ImageController());

  Widget _aiImage() => switch (_c.status.value) {
        Status.none => Lottie.asset(
            Assets.aiPlay,
            height: Get.height * .3,
            width: Get.width,
          ),
        Status.success => ClipRRect(
            borderRadius: const BorderRadius.all(Radius.circular(10)),
            child: CachedNetworkImage(
              imageUrl: _c.url.value,
              placeholder: (context, url) => const Center(
                child: CustomLoading(),
              ),
              errorWidget: (context, url, error) => const Icon(
                Icons.error_outline_rounded,
              ),
            ),
          ),
        Status.loading => const CustomLoading()
      };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(Strings.createImageWithAi),
        actions: [
          Obx(() => _c.status.value == Status.success
              ? IconButton(
                  onPressed: _c.shareImage,
                  icon: const Icon(Icons.share_rounded),
                )
              : const SizedBox.shrink()),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: BottomTextField(
        controller: _c.textController,
        onTap: _c.searchAiImage,
        // onTap: _c.sendMessage,
      ),
      body: ListView(
        // controller: controller.scrollController,
        physics: const BouncingScrollPhysics(),
        padding: EdgeInsets.only(bottom: Get.height * .12),
        children: [
          Container(
            height: Get.height * .5,
            margin: EdgeInsets.symmetric(
                horizontal: Get.width * .01, vertical: Get.height * .01),
            alignment: Alignment.center,
            child: Obx(() => _aiImage()),
          ),
          Obx(
            () => (_c.imageList.isEmpty)
                ? const SizedBox.shrink()
                : SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    physics: const BouncingScrollPhysics(),
                    child: Wrap(
                      spacing: 8,
                      children: _c.imageList
                          .map((e) => InkWell(
                                onTap: () => _c.updateImage(e),
                                child: ClipRRect(
                                  borderRadius: const BorderRadius.all(
                                      Radius.circular(5)),
                                  child: CachedNetworkImage(
                                    imageUrl: e,
                                    height: 100,
                                    errorWidget: (context, url, error) =>
                                        const Icon(
                                      Icons.error_outline_rounded,
                                    ),
                                  ),
                                ),
                              ))
                          .toList(),
                    ),
                  ),
          ),
          Spacing.getVerticalHeight(.02),
          Obx(
            () => _c.status.value == Status.success
                ? Align(
                    child: CustomButton(
                      onPressed: _c.downloadImage,
                      text: Strings.download,
                    ),
                  )
                : const SizedBox.shrink(),
          )
        ],
      ),
    );
  }
}
