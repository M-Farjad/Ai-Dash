import '../header.dart';

class ImageCreatorScreen extends StatefulWidget {
  const ImageCreatorScreen({super.key});

  @override
  State<ImageCreatorScreen> createState() => _ImageCreatorScreenState();
}

class _ImageCreatorScreenState extends State<ImageCreatorScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(Strings.createImageWithAi),
      ),
      body: ListView(
        children: [],
      ),
    );
  }
}
