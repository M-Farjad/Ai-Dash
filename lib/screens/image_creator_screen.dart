import 'package:cached_network_image/cached_network_image.dart';

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
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: BottomTextField(
        controller: _c.textController,
        onTap: _c.sendMessage,
      ),
      body: ListView(
        // controller: controller.scrollController,
        physics: const BouncingScrollPhysics(),
        padding: EdgeInsets.only(bottom: Get.height * .12),
        children: [
          Container(
            height: Get.height * .5,
            alignment: Alignment.center,
            child: Obx(() => _aiImage()),
          )
        ],
      ),
    );
  }
}
